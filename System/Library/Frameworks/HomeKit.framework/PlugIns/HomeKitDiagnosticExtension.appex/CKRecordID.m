@interface CKRecordID
- (NSString)hmd_canonicalStringRepresentation;
- (id)hmd_initWithCanonicalStringRepresentation:(id)a3;
@end

@implementation CKRecordID

- (NSString)hmd_canonicalStringRepresentation
{
  v3 = sub_10000C888();
  v4 = [(CKRecordID *)self zoneID];
  v5 = [v4 ownerName];
  v6 = [v5 stringByAddingPercentEncodingWithAllowedCharacters:v3];

  v7 = [v4 zoneName];
  v8 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v3];

  v9 = [(CKRecordID *)self recordName];
  v10 = [v9 stringByAddingPercentEncodingWithAllowedCharacters:v3];

  v11 = +[NSString stringWithFormat:@"%@/%@/%@", v6, v8, v10];

  return (NSString *)v11;
}

- (id)hmd_initWithCanonicalStringRepresentation:(id)a3
{
  id v3 = a3;
  if (qword_100036BD8 != -1) {
    dispatch_once(&qword_100036BD8, &stru_10002C820);
  }
  id v4 = (id)qword_100036BE0;
  id v5 = [objc_alloc((Class)NSScanner) initWithString:v3];
  [v5 setCharactersToBeSkipped:0];
  id v23 = 0;
  unsigned int v6 = [v5 scanCharactersFromSet:v4 intoString:&v23];
  id v7 = v23;
  v8 = v7;
  if (!v6)
  {
    v13 = 0;
    v9 = v7;
LABEL_17:
    v17 = 0;
    id v19 = 0;
    goto LABEL_21;
  }
  v9 = [v7 stringByRemovingPercentEncoding];

  if (!v9 || ![v9 length])
  {
    v13 = 0;
    goto LABEL_19;
  }
  if (![v5 scanString:@"/" intoString:0])
  {
    v13 = 0;
    goto LABEL_17;
  }
  id v22 = 0;
  unsigned int v10 = [v5 scanCharactersFromSet:v4 intoString:&v22];
  id v11 = v22;
  v12 = v11;
  if (!v10)
  {
    v17 = 0;
    v13 = v11;
    goto LABEL_20;
  }
  v13 = [v11 stringByRemovingPercentEncoding];

  if (!v13
    || ![v13 length]
    || ![v5 scanString:@"/" intoString:0])
  {
LABEL_19:
    v17 = 0;
LABEL_20:
    id v19 = 0;
    goto LABEL_21;
  }
  id v21 = 0;
  unsigned int v14 = [v5 scanCharactersFromSet:v4 intoString:&v21];
  id v15 = v21;
  v16 = v15;
  if (!v14)
  {
    id v19 = 0;
    v17 = v15;
    goto LABEL_21;
  }
  v17 = [v15 stringByRemovingPercentEncoding];

  if (!v17 || ![v17 length] || !objc_msgSend(v5, "isAtEnd")) {
    goto LABEL_20;
  }
  id v18 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:v13 ownerName:v9];
  id v19 = [objc_alloc((Class)CKRecordID) initWithRecordName:v17 zoneID:v18];

LABEL_21:
  return v19;
}

@end