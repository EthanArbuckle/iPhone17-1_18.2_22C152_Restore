@interface PHPerson(PNPersonProtocol)
- (BOOL)favorite;
- (BOOL)hidden;
- (__CFString)anonymizedName;
- (id)keyFace;
- (id)personLocalIdentifiers;
- (void)pn_addMergeCandidatePersons:()PNPersonProtocol;
- (void)setIsVerified:()PNPersonProtocol;
- (void)setKeyFace:()PNPersonProtocol;
- (void)setManualOrder:()PNPersonProtocol;
@end

@implementation PHPerson(PNPersonProtocol)

- (__CFString)anonymizedName
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  objc_getAssociatedObject(a1, &PHPersonPNPersonProtocolAnonymizedNameKey);
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = [a1 name];
    if ([v3 length])
    {
      id v4 = [v3 dataUsingEncoding:1 allowLossyConversion:1];
      CC_SHA1((const void *)[v4 bytes], objc_msgSend(v4, "length"), md);
      v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:20];
      v2 = [v5 base64EncodedStringWithOptions:0];
    }
    else
    {
      v2 = 0;
    }
    if (v2) {
      v6 = v2;
    }
    else {
      v6 = &stru_1F15A0D70;
    }
    objc_setAssociatedObject(a1, &PHPersonPNPersonProtocolAnonymizedNameKey, v6, (void *)1);
  }
  if ([(__CFString *)v2 length]) {
    v7 = v2;
  }
  else {
    v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (BOOL)hidden
{
  return [a1 type] == -1;
}

- (BOOL)favorite
{
  return [a1 type] == 1;
}

- (void)setIsVerified:()PNPersonProtocol
{
  id v1 = [MEMORY[0x1E4F39208] changeRequestForPerson:a1];
  [v1 setVerifiedType:2];
}

- (void)setManualOrder:()PNPersonProtocol
{
  id v4 = [MEMORY[0x1E4F39208] changeRequestForPerson:a1];
  [v4 setManualOrder:a3];
}

- (id)keyFace
{
  id v1 = [MEMORY[0x1E4F39048] fetchKeyFaceForPerson:a1 options:0];
  v2 = [v1 firstObject];

  return v2;
}

- (void)setKeyFace:()PNPersonProtocol
{
  id v9 = a3;
  id v4 = [a1 keyFace];
  v5 = [v4 localIdentifier];
  v6 = [v9 localIdentifier];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    v8 = [MEMORY[0x1E4F39208] changeRequestForPerson:a1];
    [v8 setKeyFace:v9 forCluster:0];
  }
}

- (void)pn_addMergeCandidatePersons:()PNPersonProtocol
{
  id v4 = (void *)MEMORY[0x1E4F39208];
  id v5 = a3;
  id v6 = [v4 changeRequestForPerson:a1];
  [v6 addMergeCandidatePersons:v5];
}

- (id)personLocalIdentifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id v1 = [a1 localIdentifier];
  v4[0] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

@end