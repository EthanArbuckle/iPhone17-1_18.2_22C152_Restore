@interface IDSKeyTransparencyEntry
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToKeyTransparencyEntry:(id)a3;
- (BOOL)ktCapable;
- (IDSKeyTransparencyEntry)initWithPushToken:(id)a3 loggableData:(id)a4 signedData:(id)a5;
- (NSData)loggableData;
- (NSData)pushToken;
- (NSData)signedData;
- (NSString)buildVersion;
- (NSString)productName;
- (id)description;
- (int64_t)transparencyVersion;
- (unint64_t)hash;
- (void)setBuildVersion:(id)a3;
- (void)setKtCapable:(BOOL)a3;
- (void)setProductName:(id)a3;
- (void)setTransparencyVersion:(int64_t)a3;
@end

@implementation IDSKeyTransparencyEntry

- (IDSKeyTransparencyEntry)initWithPushToken:(id)a3 loggableData:(id)a4 signedData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSKeyTransparencyEntry;
  v12 = [(IDSKeyTransparencyEntry *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_pushToken, a3);
    objc_storeStrong((id *)&v13->_loggableData, a4);
    objc_storeStrong((id *)&v13->_signedData, a5);
  }

  return v13;
}

- (BOOL)isEqualToKeyTransparencyEntry:(id)a3
{
  v5 = (IDSKeyTransparencyEntry *)a3;
  v6 = v5;
  if (self == v5)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (v5)
    {
      v7 = [(IDSKeyTransparencyEntry *)self pushToken];
      v8 = [(IDSKeyTransparencyEntry *)v6 pushToken];
      if (v7 != v8)
      {
        id v9 = [(IDSKeyTransparencyEntry *)self pushToken];
        id v10 = [(IDSKeyTransparencyEntry *)v6 pushToken];
        if (![v9 isEqual:v10])
        {
          LOBYTE(v11) = 0;
          goto LABEL_22;
        }
        v27 = v10;
        v28 = v9;
      }
      v12 = [(IDSKeyTransparencyEntry *)self loggableData];
      v13 = [(IDSKeyTransparencyEntry *)v6 loggableData];
      if (v12 != v13)
      {
        v14 = [(IDSKeyTransparencyEntry *)self loggableData];
        objc_super v15 = [(IDSKeyTransparencyEntry *)v6 loggableData];
        if (![v14 isEqual:v15])
        {
          LOBYTE(v11) = 0;
LABEL_20:

LABEL_21:
          id v10 = v27;
          id v9 = v28;
          if (v7 == v8)
          {
LABEL_23:

            goto LABEL_24;
          }
LABEL_22:

          goto LABEL_23;
        }
        v25 = v15;
        v26 = v14;
      }
      v16 = [(IDSKeyTransparencyEntry *)self signedData];
      v17 = [(IDSKeyTransparencyEntry *)v6 signedData];
      unsigned __int8 v18 = [v16 isEqualToData:v17];
      if ((v18 & 1) != 0
        || ([(IDSKeyTransparencyEntry *)self signedData],
            uint64_t v19 = objc_claimAutoreleasedReturnValue(),
            [(IDSKeyTransparencyEntry *)v6 signedData],
            uint64_t v20 = objc_claimAutoreleasedReturnValue(),
            v24 = (void *)v19,
            v21 = (void *)v19,
            v3 = (void *)v20,
            [v21 isEqual:v20]))
      {
        unsigned int v22 = [(IDSKeyTransparencyEntry *)self ktCapable];
        unsigned int v11 = v22 ^ [(IDSKeyTransparencyEntry *)v6 ktCapable] ^ 1;
        if (v18)
        {
LABEL_19:

          objc_super v15 = v25;
          v14 = v26;
          if (v12 == v13) {
            goto LABEL_21;
          }
          goto LABEL_20;
        }
      }
      else
      {
        LOBYTE(v11) = 0;
      }

      goto LABEL_19;
    }
    LOBYTE(v11) = 0;
  }
LABEL_24:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = [(IDSKeyTransparencyEntry *)self isEqualToKeyTransparencyEntry:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v3 = [(IDSKeyTransparencyEntry *)self pushToken];
  unint64_t v4 = (unint64_t)[v3 hash];
  BOOL v5 = [(IDSKeyTransparencyEntry *)self loggableData];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  v7 = [(IDSKeyTransparencyEntry *)self signedData];
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];

  return v8;
}

- (id)description
{
  uint64_t v14 = objc_opt_class();
  objc_super v15 = [(IDSKeyTransparencyEntry *)self pushToken];
  v3 = [v15 debugDescription];
  unint64_t v4 = [(IDSKeyTransparencyEntry *)self loggableData];
  id v5 = [v4 length];
  unint64_t v6 = [(IDSKeyTransparencyEntry *)self signedData];
  id v7 = [v6 length];
  if ([(IDSKeyTransparencyEntry *)self ktCapable]) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  id v9 = [(IDSKeyTransparencyEntry *)self productName];
  id v10 = [(IDSKeyTransparencyEntry *)self buildVersion];
  unsigned int v11 = +[NSNumber numberWithLongLong:[(IDSKeyTransparencyEntry *)self transparencyVersion]];
  v12 = +[NSString stringWithFormat:@"<%@: %p pushToken: %@, loggableData.length: %lu, signedData.length:%lu, ktCapable: %@, productName: %@, buildVersion: %@, transparencyVersion: %@>", v14, self, v3, v5, v7, v8, v9, v10, v11];

  return v12;
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (NSData)loggableData
{
  return self->_loggableData;
}

- (NSData)signedData
{
  return self->_signedData;
}

- (BOOL)ktCapable
{
  return self->_ktCapable;
}

- (void)setKtCapable:(BOOL)a3
{
  self->_ktCapable = a3;
}

- (NSString)productName
{
  return self->_productName;
}

- (void)setProductName:(id)a3
{
  self->_productName = (NSString *)a3;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  self->_buildVersion = (NSString *)a3;
}

- (int64_t)transparencyVersion
{
  return self->_transparencyVersion;
}

- (void)setTransparencyVersion:(int64_t)a3
{
  self->_transparencyVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signedData, 0);
  objc_storeStrong((id *)&self->_loggableData, 0);

  objc_storeStrong((id *)&self->_pushToken, 0);
}

@end