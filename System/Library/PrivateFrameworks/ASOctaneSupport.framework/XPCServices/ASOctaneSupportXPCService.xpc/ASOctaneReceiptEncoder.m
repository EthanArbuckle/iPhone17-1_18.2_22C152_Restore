@interface ASOctaneReceiptEncoder
- ($07C5F7F5A364B97903591EEA1EF96986)_receiptAttributeWithCoder:(SEL)a3 type:(SecAsn1Coder *)a4 version:(int64_t)a5 UTF8String:(int64_t)a6;
- ($07C5F7F5A364B97903591EEA1EF96986)_receiptAttributeWithCoder:(SEL)a3 type:(SecAsn1Coder *)a4 version:(int64_t)a5 data:(int64_t)a6;
- ($07C5F7F5A364B97903591EEA1EF96986)_receiptAttributeWithCoder:(SEL)a3 type:(SecAsn1Coder *)a4 version:(int64_t)a5 integer:(int64_t)a6;
- ($E570233E5C131744623CAF595F5D8D88)_receiptAttributeWithCoder:(SEL)a3 type:(SecAsn1Coder *)a4 version:(int64_t)a5 IA5String:(int64_t)a6;
- (ASOctaneReceiptEncoder)initWithBundleID:(id)a3 bundleVersion:(id)a4 deviceID:(id)a5 transactions:(id)a6;
- (NSArray)transactions;
- (NSString)bundleID;
- (NSString)bundleVersion;
- (NSString)deviceID;
- (id)_dateFormatter;
- (id)_encodePayload;
- (id)_encodePayloadForIAPReceipt:(id)a3;
- (id)_smallestInt:(int64_t)a3;
- (id)encodeAndSignWithIdentity:(__SecIdentity *)a3 error:(id *)a4;
@end

@implementation ASOctaneReceiptEncoder

- (ASOctaneReceiptEncoder)initWithBundleID:(id)a3 bundleVersion:(id)a4 deviceID:(id)a5 transactions:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ASOctaneReceiptEncoder;
  v15 = [(ASOctaneReceiptEncoder *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bundleID, a3);
    objc_storeStrong((id *)&v16->_bundleVersion, a4);
    objc_storeStrong((id *)&v16->_deviceID, a5);
    objc_storeStrong((id *)&v16->_transactions, a6);
  }

  return v16;
}

- (id)_dateFormatter
{
  if (qword_10031B0C0 != -1) {
    dispatch_once(&qword_10031B0C0, &stru_1002D5038);
  }
  v2 = (void *)qword_10031B0B8;
  return v2;
}

- (id)encodeAndSignWithIdentity:(__SecIdentity *)a3 error:(id *)a4
{
  v5 = [(ASOctaneReceiptEncoder *)self _encodePayload];
  CMSEncoderRef cmsEncoderOut = 0;
  CMSEncoderCreate(&cmsEncoderOut);
  CMSEncoderSetSignerAlgorithm(cmsEncoderOut, kCMSEncoderDigestAlgorithmSHA256);
  CMSEncoderAddSigners(cmsEncoderOut, a3);
  v6 = cmsEncoderOut;
  id v7 = v5;
  CMSEncoderUpdateContent(v6, [v7 bytes], (size_t)objc_msgSend(v7, "length"));
  CFDataRef encodedContentOut = 0;
  OSStatus v8 = CMSEncoderCopyEncodedContent(cmsEncoderOut, &encodedContentOut);
  if (v8)
  {
    v9 = (__CFString *)SecCopyErrorMessageString(v8, 0);
    NSLog(@"Error encoding and signing content: %@", v9);
  }
  CFDataRef v10 = encodedContentOut;
  CFRelease(cmsEncoderOut);

  return v10;
}

- (id)_encodePayload
{
  SecAsn1CoderRef coder = 0;
  SecAsn1CoderCreate(&coder);
  v3 = [(ASOctaneReceiptEncoder *)self transactions];
  v4 = malloc_type_malloc(8 * (void)[v3 count] + 160, 0x2004093837F09uLL);

  v5 = [(ASOctaneReceiptEncoder *)self transactions];
  bzero(v4, 8 * (void)[v5 count] + 160);

  memset(v56, 0, sizeof(v56));
  [(ASOctaneReceiptEncoder *)self _receiptAttributeWithCoder:coder type:0 version:1 UTF8String:"Xcode"];
  void *v4 = v56;
  memset(v55, 0, sizeof(v55));
  [(ASOctaneReceiptEncoder *)self _receiptAttributeWithCoder:coder type:1 version:1 integer:0];
  v4[1] = v55;
  long long v54 = 0u;
  memset(v53, 0, sizeof(v53));
  [(ASOctaneReceiptEncoder *)self _receiptAttributeWithCoder:coder type:2 version:1 UTF8String:[(NSString *)self->_bundleID UTF8String]];
  v4[2] = v53;
  memset(v52, 0, sizeof(v52));
  [(ASOctaneReceiptEncoder *)self _receiptAttributeWithCoder:coder type:3 version:1 UTF8String:[(NSString *)self->_bundleVersion UTF8String]];
  v4[3] = v52;
  uint64_t v6 = arc4random();
  unint64_t v51 = arc4random() | (unint64_t)(16 * v6);
  uint64_t v7 = 8;
  uint64_t v8 = +[NSData dataWithBytes:&v51 length:8];
  memset(v50, 0, sizeof(v50));
  [(ASOctaneReceiptEncoder *)self _receiptAttributeWithCoder:coder type:4 version:1 data:v8];
  v4[4] = v50;
  v9 = [(ASOctaneReceiptEncoder *)self deviceID];
  uint64_t v10 = [v9 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1002F48B8];

  v40 = (void *)v10;
  id v11 = +[NSMutableData oct_dataWithHexString:v10];
  v41 = (void *)v8;
  [v11 appendData:v8];
  id v12 = +[NSData dataWithBytes:*((void *)&v54 + 1) length:(void)v54];
  [v11 appendData:v12];

  id v39 = v11;
  CC_SHA1([v39 bytes], (CC_LONG)objc_msgSend(v39, "length"), md);
  memset(v49, 0, sizeof(v49));
  SecAsn1CoderRef v13 = coder;
  id v14 = +[NSData dataWithBytes:md length:20];
  [(ASOctaneReceiptEncoder *)self _receiptAttributeWithCoder:v13 type:5 version:1 data:v14];

  v4[5] = v49;
  memset(v48, 0, sizeof(v48));
  [(ASOctaneReceiptEncoder *)self _receiptAttributeWithCoder:coder type:8 version:1 IA5String:""];
  v4[6] = v48;
  v15 = [(ASOctaneReceiptEncoder *)self _dateFormatter];
  memset(v47, 0, sizeof(v47));
  SecAsn1CoderRef v16 = coder;
  v17 = +[NSDate now];
  id v18 = [v15 stringFromDate:v17];
  -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:IA5String:](self, "_receiptAttributeWithCoder:type:version:IA5String:", v16, 12, 1, [v18 UTF8String]);

  v4[7] = v47;
  v19 = [(ASOctaneReceiptEncoder *)self transactions];
  v20 = malloc_type_malloc(48 * (void)[v19 count], 0x10100402F876B04uLL);

  v21 = [(ASOctaneReceiptEncoder *)self transactions];
  id v22 = [v21 count];

  if (v22)
  {
    uint64_t v23 = 8;
    v24 = v20;
    do
    {
      v26 = [(ASOctaneReceiptEncoder *)self transactions];
      v27 = [v26 objectAtIndexedSubscript:v23 - 8];

      v28 = [(ASOctaneReceiptEncoder *)self _encodePayloadForIAPReceipt:v27];
      [(ASOctaneReceiptEncoder *)self _receiptAttributeWithCoder:coder type:17 version:1 data:v28];
      long long v29 = v44;
      long long v30 = v46;
      v24[1] = v45;
      v24[2] = v30;
      _OWORD *v24 = v29;
      v4[v23] = v24;
      LODWORD(v7) = v23 + 1;

      v31 = [(ASOctaneReceiptEncoder *)self transactions];
      id v32 = [v31 count];

      v24 += 3;
      unint64_t v33 = v23 - 7;
      ++v23;
    }
    while ((unint64_t)v32 > v33);
    uint64_t v7 = v7;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v44 = 0u;
  SecAsn1CoderRef v34 = coder;
  v35 = +[NSDate distantFuture];
  id v36 = [v15 stringFromDate:v35];
  -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:IA5String:](self, "_receiptAttributeWithCoder:type:version:IA5String:", v34, 21, 1, [v36 UTF8String]);

  v4[v7] = &v44;
  dest.Data = 0;
  src = v4;
  dest.Length = 0;
  SecAsn1EncodeItem(coder, &src, (const SecAsn1Template *)&unk_1002D5058, &dest);
  v37 = +[NSData dataWithBytes:dest.Data length:dest.Length];
  SecAsn1CoderRelease(coder);
  if (v20) {
    free(v20);
  }
  free(v4);

  return v37;
}

- (id)_encodePayloadForIAPReceipt:(id)a3
{
  SecAsn1CoderRef coder = 0;
  id v4 = a3;
  SecAsn1CoderCreate(&coder);
  v5 = [v4 objectForKeyedSubscript:@"quantity"];
  id v6 = [v5 integerValue];

  uint64_t v7 = [v4 objectForKeyedSubscript:@"productID"];
  uint64_t v8 = [v4 objectForKeyedSubscript:@"transactionID"];
  v9 = [v4 objectForKeyedSubscript:@"originalTransactionDate"];
  uint64_t v10 = [v4 objectForKeyedSubscript:@"originalTransactionID"];
  v31 = [v4 objectForKeyedSubscript:@"purchaseDate"];
  long long v30 = [v4 objectForKeyedSubscript:@"subscriptionExpirationDate"];
  id v11 = [v4 objectForKeyedSubscript:@"introPeriod"];
  id v12 = [v4 objectForKeyedSubscript:@"cancellationDate"];

  long long v47 = 0u;
  long long v46 = 0u;
  long long v45 = 0u;
  memset(v42, 0, sizeof(v42));
  [(ASOctaneReceiptEncoder *)self _receiptAttributeWithCoder:coder type:1701 version:1 integer:v6];
  v44[0] = v42;
  memset(v41, 0, sizeof(v41));
  SecAsn1CoderRef v13 = coder;
  id v29 = v7;
  -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:UTF8String:](self, "_receiptAttributeWithCoder:type:version:UTF8String:", v13, 1702, 1, [v29 UTF8String]);
  v44[1] = v41;
  memset(v40, 0, sizeof(v40));
  SecAsn1CoderRef v14 = coder;
  id v28 = v8;
  -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:UTF8String:](self, "_receiptAttributeWithCoder:type:version:UTF8String:", v14, 1703, 1, [v28 UTF8String]);
  v44[2] = v40;
  v15 = [(ASOctaneReceiptEncoder *)self _dateFormatter];
  memset(v39, 0, sizeof(v39));
  SecAsn1CoderRef v16 = coder;
  id v17 = [v15 stringFromDate:v9];
  -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:IA5String:](self, "_receiptAttributeWithCoder:type:version:IA5String:", v16, 1704, 1, [v17 UTF8String]);

  v44[3] = v39;
  memset(v38, 0, sizeof(v38));
  if (v10)
  {
    -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:UTF8String:](self, "_receiptAttributeWithCoder:type:version:UTF8String:", coder, 1705, 1, [v10 UTF8String]);
    *(void *)&long long v45 = v38;
    int v18 = 5;
  }
  else
  {
    uint64_t v10 = 0;
    int v18 = 4;
  }
  memset(v37, 0, sizeof(v37));
  if (v31)
  {
    SecAsn1CoderRef v19 = coder;
    objc_msgSend(v15, "stringFromDate:");
    id v20 = objc_claimAutoreleasedReturnValue();
    -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:IA5String:](self, "_receiptAttributeWithCoder:type:version:IA5String:", v19, 1706, 1, [v20 UTF8String]);

    v44[v18++] = v37;
  }
  long long v21 = 0uLL;
  memset(v36, 0, sizeof(v36));
  if (v30)
  {
    SecAsn1CoderRef v22 = coder;
    id v23 = [v15 stringFromDate:v30];
    -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:IA5String:](self, "_receiptAttributeWithCoder:type:version:IA5String:", v22, 1708, 1, [v23 UTF8String]);

    long long v21 = 0uLL;
    v44[v18++] = v36;
  }
  v35[1] = v21;
  v35[2] = v21;
  v35[0] = v21;
  if (v12)
  {
    SecAsn1CoderRef v24 = coder;
    id v25 = [v15 stringFromDate:v12];
    -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:IA5String:](self, "_receiptAttributeWithCoder:type:version:IA5String:", v24, 1712, 1, [v25 UTF8String]);

    v44[v18++] = v35;
  }
  memset(v34, 0, sizeof(v34));
  if (v11)
  {
    -[ASOctaneReceiptEncoder _receiptAttributeWithCoder:type:version:integer:](self, "_receiptAttributeWithCoder:type:version:integer:", coder, 1719, 1, [v11 BOOLValue]);
    v44[v18] = v34;
  }
  dest.Data = 0;
  src = v44;
  dest.Length = 0;
  SecAsn1EncodeItem(coder, &src, (const SecAsn1Template *)&unk_1002D5058, &dest);
  v26 = +[NSData dataWithBytes:dest.Data length:dest.Length];
  SecAsn1CoderRelease(coder);

  return v26;
}

- ($E570233E5C131744623CAF595F5D8D88)_receiptAttributeWithCoder:(SEL)a3 type:(SecAsn1Coder *)a4 version:(int64_t)a5 IA5String:(int64_t)a6
{
  dest.Length = 0;
  dest.Data = 0;
  v15.Length = 0;
  v15.Data = 0;
  size_t v12 = strlen(a7);
  SecAsn1AllocCopy(a4, a7, v12, &dest);
  SecAsn1EncodeItem(a4, &dest, kSecAsn1IA5StringTemplate, &v15);
  SecAsn1CoderRef v13 = +[NSData dataWithBytes:v15.Data length:v15.Length];
  [(ASOctaneReceiptEncoder *)self _receiptAttributeWithCoder:a4 type:a5 version:a6 data:v13];

  return result;
}

- ($07C5F7F5A364B97903591EEA1EF96986)_receiptAttributeWithCoder:(SEL)a3 type:(SecAsn1Coder *)a4 version:(int64_t)a5 UTF8String:(int64_t)a6
{
  dest.Length = 0;
  dest.Data = 0;
  v15.Length = 0;
  v15.Data = 0;
  size_t v12 = strlen(a7);
  SecAsn1AllocCopy(a4, a7, v12, &dest);
  SecAsn1EncodeItem(a4, &dest, kSecAsn1UTF8StringTemplate, &v15);
  SecAsn1CoderRef v13 = +[NSData dataWithBytes:v15.Data length:v15.Length];
  [(ASOctaneReceiptEncoder *)self _receiptAttributeWithCoder:a4 type:a5 version:a6 data:v13];

  return result;
}

- ($07C5F7F5A364B97903591EEA1EF96986)_receiptAttributeWithCoder:(SEL)a3 type:(SecAsn1Coder *)a4 version:(int64_t)a5 integer:(int64_t)a6
{
  dest.Length = 0;
  dest.Data = 0;
  v14.Length = 0;
  v14.Data = 0;
  id v11 = [(ASOctaneReceiptEncoder *)self _smallestInt:a7];
  SecAsn1AllocCopy(a4, [v11 bytes], (size_t)objc_msgSend(v11, "length"), &dest);
  SecAsn1EncodeItem(a4, &dest, kSecAsn1IntegerTemplate, &v14);
  size_t v12 = +[NSData dataWithBytes:v14.Data length:v14.Length];
  [(ASOctaneReceiptEncoder *)self _receiptAttributeWithCoder:a4 type:a5 version:a6 data:v12];

  return result;
}

- ($07C5F7F5A364B97903591EEA1EF96986)_receiptAttributeWithCoder:(SEL)a3 type:(SecAsn1Coder *)a4 version:(int64_t)a5 data:(int64_t)a6
{
  dest.Length = 0;
  dest.Data = 0;
  v21.Length = 0;
  v21.Data = 0;
  SecAsn1Item v20 = (SecAsn1Item)0;
  id v12 = a7;
  id v13 = [(ASOctaneReceiptEncoder *)self _smallestInt:a5];
  SecAsn1AllocCopy(a4, [v13 bytes], (size_t)objc_msgSend(v13, "length"), &dest);
  id v14 = [(ASOctaneReceiptEncoder *)self _smallestInt:a6];
  SecAsn1AllocCopy(a4, [v14 bytes], (size_t)objc_msgSend(v14, "length"), &v21);
  id v15 = v12;
  id v16 = [v15 bytes];
  id v17 = [v15 length];

  SecAsn1AllocCopy(a4, v16, (size_t)v17, &v20);
  cssm_data v18 = v21;
  retstr->var0 = dest;
  retstr->var1 = v18;
  retstr->var2 = v20;

  return result;
}

- (id)_smallestInt:(int64_t)a3
{
  unint64_t v10 = bswap64(a3);
  v3 = &v10;
  unsigned int v4 = v10;
  if ((_BYTE)v10)
  {
    int v5 = 8;
LABEL_3:
    unsigned int v6 = v5 + (v4 >> 7);
    uint64_t v7 = v3;
  }
  else
  {
    unsigned int v6 = 8;
    uint64_t v7 = &v10;
    while (1)
    {
      int v5 = v6 - 1;
      if (v6 == 1) {
        break;
      }
      v3 = (unint64_t *)((char *)v7 + 1);
      unsigned int v4 = *((char *)v7 + 1);
      if ((v4 & 0x80000000) != 0) {
        goto LABEL_4;
      }
      uint64_t v7 = (unint64_t *)((char *)v7 + 1);
      --v6;
      unsigned int v4 = v4;
      if ((_BYTE)v4) {
        goto LABEL_3;
      }
    }
    uint64_t v7 = (unint64_t *)((char *)&v10 + 7);
  }
LABEL_4:
  uint64_t v8 = +[NSData dataWithBytes:v7 length:v6];
  return v8;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSArray)transactions
{
  return self->_transactions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end