@interface IDSServerDesiredPreKeyMaterialSet
- (BOOL)isEqual:(id)a3;
- (BOOL)requireSignature;
- (IDSServerDesiredPreKeyMaterialSet)initWithPublicPreKeyData:(id)a3 wrapMode:(int64_t)a4 creationDate:(id)a5;
- (IDSServerDesiredPreKeyMaterialSet)initWithUUID:(id)a3 publicPreKeyData:(id)a4 wrapMode:(int64_t)a5 creationDate:(id)a6;
- (NSData)publicPreKeyData;
- (NSDate)creationDate;
- (NSString)description;
- (NSUUID)uuid;
- (id)materialDataByID;
- (int)type;
- (int64_t)wrapMode;
- (unint64_t)forParticipantID;
- (unint64_t)hash;
@end

@implementation IDSServerDesiredPreKeyMaterialSet

- (IDSServerDesiredPreKeyMaterialSet)initWithPublicPreKeyData:(id)a3 wrapMode:(int64_t)a4 creationDate:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = +[NSUUID UUID];
  v11 = [(IDSServerDesiredPreKeyMaterialSet *)self initWithUUID:v10 publicPreKeyData:v9 wrapMode:a4 creationDate:v8];

  return v11;
}

- (IDSServerDesiredPreKeyMaterialSet)initWithUUID:(id)a3 publicPreKeyData:(id)a4 wrapMode:(int64_t)a5 creationDate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSServerDesiredPreKeyMaterialSet;
  v14 = [(IDSServerDesiredPreKeyMaterialSet *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_publicPreKeyData, a4);
    v15->_type = 11;
    objc_storeStrong((id *)&v15->_uuid, a3);
    v15->_wrapMode = a5;
    objc_storeStrong((id *)&v15->_creationDate, a6);
    v15->_requireSignature = 1;
    v16 = v15;
  }

  return v15;
}

- (unint64_t)forParticipantID
{
  return 0;
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<%@: %p preKey=%@>", objc_opt_class(), self, self->_publicPreKeyData];
}

- (unint64_t)hash
{
  return (unint64_t)[(NSData *)self->_publicPreKeyData hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (id *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v5 = [v4[2] isEqual:self->_publicPreKeyData];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (id)materialDataByID
{
  v3 = +[NSUUID UUID];
  v4 = IDSGetUUIDDataFromNSUUID();

  v16 = v4;
  unsigned __int8 v5 = +[IDSGroupEncryptionPreKeyDictionaryKeys publicPreKey];
  v14[0] = v5;
  v15[0] = self->_publicPreKeyData;
  v6 = +[IDSGroupEncryptionPreKeyDictionaryKeys creationDate];
  v14[1] = v6;
  [(NSDate *)self->_creationDate timeIntervalSince1970];
  v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v15[1] = v7;
  id v8 = +[IDSGroupEncryptionPreKeyDictionaryKeys wrapMode];
  v14[2] = v8;
  id v9 = +[NSNumber numberWithInteger:self->_wrapMode];
  v15[2] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];
  id v11 = JWEncodeDictionary();
  v17 = v11;
  id v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];

  return v12;
}

- (NSData)publicPreKeyData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)wrapMode
{
  return self->_wrapMode;
}

- (int)type
{
  return self->_type;
}

- (BOOL)requireSignature
{
  return self->_requireSignature;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);

  objc_storeStrong((id *)&self->_publicPreKeyData, 0);
}

@end