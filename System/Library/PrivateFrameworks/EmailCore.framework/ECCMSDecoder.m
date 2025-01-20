@interface ECCMSDecoder
+ (id)decoderForEncodedData:(id)a3 detachedContentData:(id)a4 outError:(id *)a5;
+ (id)decoderForEncodedData:(id)a3 outError:(id *)a4;
- (BOOL)isEncrypted;
- (BOOL)isSigned;
- (ECCMSDecoder)initWithContentInfo:(id)a3 detachedContentData:(id)a4;
- (NSData)decryptedContentData;
- (id)extractSignatureInfoAndSignedData:(id *)a3 outError:(id *)a4;
@end

@implementation ECCMSDecoder

- (ECCMSDecoder)initWithContentInfo:(id)a3 detachedContentData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ECCMSDecoder;
  v9 = [(ECCMSDecoder *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contentInfo, a3);
    objc_storeStrong((id *)&v10->_detachedContentData, a4);
  }

  return v10;
}

+ (id)decoderForEncodedData:(id)a3 detachedContentData:(id)a4 outError:(id *)a5
{
  id v8 = a4;
  v9 = [MEMORY[0x1E4F77DC0] decodeMessageSecurityObject:a3 options:0 error:a5];
  if (v9) {
    v10 = (void *)[objc_alloc((Class)a1) initWithContentInfo:v9 detachedContentData:v8];
  }
  else {
    v10 = 0;
  }

  return v10;
}

+ (id)decoderForEncodedData:(id)a3 outError:(id *)a4
{
  v4 = [a1 decoderForEncodedData:a3 detachedContentData:0 outError:a4];
  return v4;
}

- (BOOL)isEncrypted
{
  v2 = [(MSCMSContentInfo *)self->_contentInfo contentType];
  if ([v2 isEqualToString:*MEMORY[0x1E4F77D28]]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 isEqualToString:*MEMORY[0x1E4F77D18]];
  }

  return v3;
}

- (BOOL)isSigned
{
  v2 = [(MSCMSContentInfo *)self->_contentInfo contentType];
  char v3 = [v2 isEqualToString:*MEMORY[0x1E4F77D30]];

  return v3;
}

- (NSData)decryptedContentData
{
  if ([(ECCMSDecoder *)self isEncrypted])
  {
    char v3 = [(MSCMSContentInfo *)self->_contentInfo embeddedContent];
    v4 = [v3 dataContent];
  }
  else
  {
    v4 = 0;
  }
  return (NSData *)v4;
}

- (id)extractSignatureInfoAndSignedData:(id *)a3 outError:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (![(ECCMSDecoder *)self isSigned])
  {
    v10 = 0;
    goto LABEL_23;
  }
  id v7 = [(MSCMSContentInfo *)self->_contentInfo embeddedContent];
  id v8 = v7;
  if (!v7) {
    goto LABEL_5;
  }
  if (!self->_detachedContentData)
  {
    v11 = [v7 dataContent];
LABEL_9:
    objc_msgSend(v8, "signers", v11);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = 0;
    uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v24;
LABEL_11:
      uint64_t v16 = 0;
      v17 = v13;
      while (1)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v23 + 1) + 8 * v16);
        id v22 = v17;
        char v19 = [v18 verifySignature:&v22];
        id v13 = v22;

        if ((v19 & 1) == 0) {
          break;
        }
        ++v16;
        v17 = v13;
        if (v14 == v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v14) {
            goto LABEL_11;
          }
          break;
        }
      }
    }

    if (a3) {
      *a3 = v21;
    }
    if (a4) {
      *a4 = v13;
    }
    v10 = objc_msgSend(v12, "ef_map:", &__block_literal_global_0);

    goto LABEL_22;
  }
  v9 = [v7 dataContent];

  if (!v9)
  {
    v11 = self->_detachedContentData;
    [v8 setDataContent:self->_detachedContentData];
    goto LABEL_9;
  }
LABEL_5:
  v10 = 0;
LABEL_22:

LABEL_23:
  return v10;
}

ECSignatureInfo *__59__ECCMSDecoder_extractSignatureInfoAndSignedData_outError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = [[ECSignatureInfo alloc] initWithSignerInfo:v2];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detachedContentData, 0);
  objc_storeStrong((id *)&self->_contentInfo, 0);
}

@end