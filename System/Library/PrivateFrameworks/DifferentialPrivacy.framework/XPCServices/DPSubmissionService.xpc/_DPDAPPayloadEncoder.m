@interface _DPDAPPayloadEncoder
+ (id)encoderForDonation:(id)a3 keys:(id)a4 error:(id *)a5;
+ (id)new;
+ (unint64_t)secondsSinceEpochWithPrecision;
- (BOOL)encryptHelperSharesWithError:(id *)a3;
- (BOOL)encryptLeaderSharesWithError:(id *)a3;
- (BOOL)isDonationValidWithError:(id *)a3;
- (NSArray)encryptedHelperShares;
- (NSArray)encryptedLeaderShares;
- (NSData)publicShare;
- (NSData)report;
- (NSData)reportID;
- (_DPDAPPayloadEncoder)init;
- (_DPDAPPayloadEncoder)initWithDonation:(id)a3 keys:(id)a4 error:(id *)a5;
- (_DPDAPPayloadEncoder)initWithDonation:(id)a3 keys:(id)a4 taskProv:(id)a5 error:(id *)a6;
- (_DPDediscoDonation)donation;
- (_DPDediscoKeyConfigurationV2)keys;
- (_DPTaskProv)taskProv;
- (id)dapVersion;
- (id)dediscoPayloadWithError:(id *)a3;
- (id)encodedAdditionalDataWithError:(id *)a3;
- (id)encodedInfoForServerRole:(unsigned __int8)a3;
- (id)encodedPlaintextInputShareForServerRole:(unsigned __int8)a3 error:(id *)a4;
- (id)encodedReportAuthExtensionDataWithError:(id *)a3;
- (id)encodedReportWithError:(id *)a3;
- (id)encodedTaskProvExtensionDataWithError:(id *)a3;
- (id)encryptedShareForServerRole:(unsigned __int8)a3 publicKey:(id)a4 error:(id *)a5;
- (id)inputShareInfoString;
- (id)taskIDWithError:(id *)a3;
- (unint64_t)time;
- (void)encodePublicShare;
- (void)encodeReportID;
- (void)setEncryptedHelperShares:(id)a3;
- (void)setEncryptedLeaderShares:(id)a3;
- (void)setPublicShare:(id)a3;
- (void)setReport:(id)a3;
- (void)setReportID:(id)a3;
@end

@implementation _DPDAPPayloadEncoder

+ (id)encoderForDonation:(id)a3 keys:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = +[_DPDediscoUtils dediscoVersionForDonation:v7];
  if (v9 - 3 < 2)
  {
    v10 = _DPDAP09PayloadEncoder;
LABEL_5:
    id v11 = [[v10 alloc] initWithDonation:v7 keys:v8 error:a5];
    goto LABEL_7;
  }
  if (v9 == 2)
  {
    v10 = _DPDAP02PayloadEncoder;
    goto LABEL_5;
  }
  v12 = +[NSString stringWithFormat:@"Failed to find matching DAP version from PPM version %lu.", v9];
  v13 = +[_DPDediscoError errorWithCode:400 description:v12];

  [v13 logAndStoreInError:a5];
  id v11 = 0;
LABEL_7:

  return v11;
}

- (id)taskIDWithError:(id *)a3
{
  v4 = [(_DPDAPPayloadEncoder *)self taskProv];
  v5 = [v4 taskIDWithError:a3];

  return v5;
}

- (id)encodedTaskProvExtensionDataWithError:(id *)a3
{
  v4 = [(_DPDAPPayloadEncoder *)self taskProv];
  v5 = [v4 encodedTaskConfigWithError:a3];

  return v5;
}

- (id)dediscoPayloadWithError:(id *)a3
{
  id v13 = 0;
  v6 = [(_DPDAPPayloadEncoder *)self encodedReportWithError:&v13];
  id v7 = v13;
  if (v6)
  {
    id v8 = [_DPDediscoPayload alloc];
    unint64_t v9 = [(_DPDAPPayloadEncoder *)self taskProv];
    v10 = [v9 collectionID];
    id v11 = [(_DPDediscoPayload *)v8 initWithCollectionId:v10 algorithm:&stru_1000780C8 algorithmParameters:0 fsEncryptedShare:0 dsEncryptedShare:0 fsPublicKey:&stru_1000780C8 dsPublicKey:&stru_1000780C8 versionHash:&stru_1000780C8 report:v6];
  }
  else
  {
    id v11 = 0;
    if (a3) {
      *a3 = v7;
    }
  }

  return v11;
}

- (id)encodedReportAuthExtensionDataWithError:(id *)a3
{
  v3 = +[_DPLog framework];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10005655C(v3);
  }

  return 0;
}

- (_DPDAPPayloadEncoder)initWithDonation:(id)a3 keys:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 leaderURL];
  id v11 = [v9 helperURL];
  v12 = +[_DPTaskProv taskProvFromDonation:v8 leaderURL:v10 helperURL:v11 error:a5];

  if (v12)
  {
    self = [(_DPDAPPayloadEncoder *)self initWithDonation:v8 keys:v9 taskProv:v12 error:a5];
    id v13 = self;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (_DPDAPPayloadEncoder)initWithDonation:(id)a3 keys:(id)a4 taskProv:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v24.receiver = self;
  v24.super_class = (Class)_DPDAPPayloadEncoder;
  v14 = [(_DPDAPPayloadEncoder *)&v24 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_donation, a3);
    objc_storeStrong((id *)&v15->_keys, a4);
    objc_storeStrong((id *)&v15->_taskProv, a5);
    if (![(_DPDAPPayloadEncoder *)v15 isDonationValidWithError:a6])
    {
      v22 = 0;
      goto LABEL_6;
    }
    id v16 = [(id)objc_opt_class() secondsSinceEpochWithPrecision];
    reportID = v15->_reportID;
    v15->_time = (unint64_t)v16;
    v15->_reportID = 0;

    publicShare = v15->_publicShare;
    v15->_publicShare = 0;

    encryptedLeaderShares = v15->_encryptedLeaderShares;
    v15->_encryptedLeaderShares = 0;

    encryptedHelperShares = v15->_encryptedHelperShares;
    v15->_encryptedHelperShares = 0;

    report = v15->_report;
    v15->_report = 0;
  }
  v22 = v15;
LABEL_6:

  return v22;
}

+ (unint64_t)secondsSinceEpochWithPrecision
{
  v2 = +[NSDate date];
  [v2 timeIntervalSince1970];
  unint64_t v4 = (unint64_t)v3;

  return 14400 * (v4 / 0x3840);
}

- (void)encodeReportID
{
  double v3 = [(_DPDAPPayloadEncoder *)self reportID];

  if (!v3)
  {
    unint64_t v4 = [(_DPDAPPayloadEncoder *)self taskProv];
    unsigned int v5 = [v4 vdafType];

    if (v5 == -65536)
    {
      id v9 = +[NSMutableData dataWithLength:16];
      arc4random_buf([v9 mutableBytes], 0x10uLL);
    }
    else
    {
      v6 = [(_DPDAPPayloadEncoder *)self donation];
      id v7 = [v6 metadata];
      id v8 = [v7 objectForKeyedSubscript:kDPMetadataVDAF];
      id v9 = [v8 objectForKeyedSubscript:kDPMetadataVDAFNonce];
    }
    [(_DPDAPPayloadEncoder *)self setReportID:v9];
  }
}

- (void)encodePublicShare
{
  double v3 = [(_DPDAPPayloadEncoder *)self publicShare];

  if (!v3)
  {
    unint64_t v4 = [(_DPDAPPayloadEncoder *)self taskProv];
    unsigned int v5 = [v4 vdafType];

    if (v5 == -65536)
    {
      id v9 = +[NSData data];
      -[_DPDAPPayloadEncoder setPublicShare:](self, "setPublicShare:");
    }
    else
    {
      id v9 = [(_DPDAPPayloadEncoder *)self donation];
      v6 = [v9 metadata];
      id v7 = [v6 objectForKeyedSubscript:kDPMetadataVDAF];
      id v8 = [v7 objectForKeyedSubscript:kDPMetadataVDAFPublicShare];
      [(_DPDAPPayloadEncoder *)self setPublicShare:v8];
    }
  }
}

- (id)encodedInfoForServerRole:(unsigned __int8)a3
{
  unsigned __int8 v8 = a3;
  char v7 = 1;
  double v3 = [(_DPDAPPayloadEncoder *)self inputShareInfoString];
  unint64_t v4 = [v3 dataUsingEncoding:4];
  unsigned int v5 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", (char *)[v4 length] + 2);
  [v5 appendData:v4];
  [v5 appendBytes:&v7 length:1];
  [v5 appendBytes:&v8 length:1];

  return v5;
}

- (BOOL)encryptLeaderSharesWithError:(id *)a3
{
  unsigned int v5 = [(_DPDAPPayloadEncoder *)self encryptedLeaderShares];

  if (!v5)
  {
    v6 = [(_DPDAPPayloadEncoder *)self keys];
    char v7 = [v6 destinationPublicKey];
    unsigned __int8 v8 = [(_DPDAPPayloadEncoder *)self encryptedShareForServerRole:2 publicKey:v7 error:a3];
    [(_DPDAPPayloadEncoder *)self setEncryptedLeaderShares:v8];
  }
  return v5 == 0;
}

- (BOOL)encryptHelperSharesWithError:(id *)a3
{
  unsigned int v5 = [(_DPDAPPayloadEncoder *)self encryptedHelperShares];

  if (!v5)
  {
    v6 = [(_DPDAPPayloadEncoder *)self keys];
    char v7 = [v6 facilitatorPublicKey];
    unsigned __int8 v8 = [(_DPDAPPayloadEncoder *)self encryptedShareForServerRole:3 publicKey:v7 error:a3];
    [(_DPDAPPayloadEncoder *)self setEncryptedHelperShares:v8];
  }
  return v5 == 0;
}

- (id)inputShareInfoString
{
  v2 = [(_DPDAPPayloadEncoder *)self dapVersion];
  double v3 = +[NSString stringWithFormat:@"dap-%@ input share", v2];

  return v3;
}

- (id)encryptedShareForServerRole:(unsigned __int8)a3 publicKey:(id)a4 error:(id *)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  id v9 = [(_DPDAPPayloadEncoder *)self encodedPlaintextInputShareForServerRole:v6 error:a5];
  if (v9)
  {
    v10 = [(_DPDAPPayloadEncoder *)self encodedInfoForServerRole:v6];
    id v11 = [(_DPDAPPayloadEncoder *)self encodedAdditionalDataWithError:a5];
    if (v11)
    {
      id v12 = [(id)objc_opt_class() encryptWithPublicKey:v8 info:v10 inputShare:v9 additionalData:v11 error:a5];
      if ([v12 count] == (id)2)
      {
        id v13 = v12;
      }
      else
      {
        CFStringRef v14 = @"Helper";
        if (v6 == 2) {
          CFStringRef v14 = @"Leader";
        }
        v15 = +[NSString stringWithFormat:@"Unable to encrypt %@ share with HPKE.", v14];
        id v16 = +[_DPDediscoError errorWithCode:100 description:v15];
        if (a5)
        {
          uint64_t v17 = +[_DPDediscoError errorWithCode:100 underlyingError:*a5 description:v15];

          id v16 = (void *)v17;
        }
        [v16 logAndStoreInError:a5];

        id v13 = 0;
      }
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (BOOL)isDonationValidWithError:(id *)a3
{
  unint64_t v4 = [(_DPDAPPayloadEncoder *)self taskProv];
  unsigned int v5 = [v4 vdafType];

  if (v5 == -65536) {
    return 1;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v28[0] = kDPMetadataVDAFNonce;
  v28[1] = kDPMetadataVDAFPublicShare;
  id obj = +[NSArray arrayWithObjects:v28 count:2];
  id v7 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    v21 = a3;
    uint64_t v9 = *(void *)v25;
    uint64_t v10 = kDPMetadataVDAF;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v13 = [(_DPDAPPayloadEncoder *)self donation];
        CFStringRef v14 = [v13 metadata];
        v15 = [v14 objectForKeyedSubscript:v10];
        id v16 = [v15 objectForKeyedSubscript:v12];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          v18 = +[NSString stringWithFormat:@"Invalid VDAF parameter(%@) in metadata.", v12];
          v19 = +[_DPDediscoError errorWithCode:701 description:v18];

          [v19 logAndStoreInError:v21];
          BOOL v6 = 0;
          goto LABEL_13;
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v6 = 1;
LABEL_13:

  return v6;
}

- (id)encodedReportWithError:(id *)a3
{
  return 0;
}

- (id)dapVersion
{
  return 0;
}

- (id)encodedAdditionalDataWithError:(id *)a3
{
  return 0;
}

- (id)encodedPlaintextInputShareForServerRole:(unsigned __int8)a3 error:(id *)a4
{
  return 0;
}

- (_DPDAPPayloadEncoder)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (_DPDediscoDonation)donation
{
  return self->_donation;
}

- (_DPDediscoKeyConfigurationV2)keys
{
  return self->_keys;
}

- (_DPTaskProv)taskProv
{
  return self->_taskProv;
}

- (unint64_t)time
{
  return self->_time;
}

- (NSData)reportID
{
  return self->_reportID;
}

- (void)setReportID:(id)a3
{
}

- (NSData)publicShare
{
  return self->_publicShare;
}

- (void)setPublicShare:(id)a3
{
}

- (NSArray)encryptedLeaderShares
{
  return self->_encryptedLeaderShares;
}

- (void)setEncryptedLeaderShares:(id)a3
{
}

- (NSArray)encryptedHelperShares
{
  return self->_encryptedHelperShares;
}

- (void)setEncryptedHelperShares:(id)a3
{
}

- (NSData)report
{
  return self->_report;
}

- (void)setReport:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_encryptedHelperShares, 0);
  objc_storeStrong((id *)&self->_encryptedLeaderShares, 0);
  objc_storeStrong((id *)&self->_publicShare, 0);
  objc_storeStrong((id *)&self->_reportID, 0);
  objc_storeStrong((id *)&self->_taskProv, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_donation, 0);
}

@end