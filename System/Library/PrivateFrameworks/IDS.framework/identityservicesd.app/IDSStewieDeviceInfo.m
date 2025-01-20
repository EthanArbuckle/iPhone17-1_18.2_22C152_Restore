@interface IDSStewieDeviceInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (IDSStewieDeviceInfo)initWithCoder:(id)a3;
- (IDSStewieDeviceInfo)initWithLocale:(id)a3 pushToken:(id)a4 dsid:(id)a5 accessTokens:(id)a6 featureIDs:(id)a7;
- (NSArray)accessTokens;
- (NSArray)featureIDs;
- (NSData)pushToken;
- (NSString)dsid;
- (NSString)locale;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IDSStewieDeviceInfo

- (IDSStewieDeviceInfo)initWithLocale:(id)a3 pushToken:(id)a4 dsid:(id)a5 accessTokens:(id)a6 featureIDs:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)IDSStewieDeviceInfo;
  v17 = [(IDSStewieDeviceInfo *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_locale, a3);
    objc_storeStrong((id *)&v18->_pushToken, a4);
    objc_storeStrong((id *)&v18->_dsid, a5);
    objc_storeStrong((id *)&v18->_accessTokens, a6);
    objc_storeStrong((id *)&v18->_featureIDs, a7);
  }

  return v18;
}

- (unint64_t)type
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [v5 locale];
      v7 = [(IDSStewieDeviceInfo *)self locale];
      if (![v6 isEqualToString:v7])
      {
        unsigned __int8 v13 = 0;
LABEL_27:

        goto LABEL_28;
      }
      v8 = [v5 pushToken];
      v9 = [(IDSStewieDeviceInfo *)self pushToken];
      if (![v8 isEqualToData:v9])
      {
        unsigned __int8 v13 = 0;
LABEL_26:

        goto LABEL_27;
      }
      v10 = [v5 dsid];
      if (v10
        || ([(IDSStewieDeviceInfo *)self dsid], (v23 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v11 = [v5 dsid];
        v12 = [(IDSStewieDeviceInfo *)self dsid];
        if (![v11 isEqualToString:v12])
        {
          unsigned __int8 v13 = 0;
LABEL_22:

          goto LABEL_23;
        }
        objc_super v21 = v12;
        v22 = v11;
        int v25 = 1;
      }
      else
      {
        v23 = 0;
        int v25 = 0;
      }
      id v14 = [v5 featureIDs];
      if (v14
        || ([(IDSStewieDeviceInfo *)self featureIDs], (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v24 = v10;
        id v15 = objc_msgSend(v5, "featureIDs", v19);
        id v16 = [(IDSStewieDeviceInfo *)self featureIDs];
        unsigned __int8 v13 = [v15 isEqualToArray:v16];

        if (v14)
        {

          v10 = v24;
          if (v25)
          {
            v12 = v21;
            v11 = v22;
            goto LABEL_22;
          }
LABEL_23:
          if (!v10) {

          }
          goto LABEL_26;
        }
        v10 = v24;
        v17 = v20;
      }
      else
      {
        v17 = 0;
        unsigned __int8 v13 = 1;
      }

      v12 = v21;
      v11 = v22;
      if (v25) {
        goto LABEL_22;
      }
      goto LABEL_23;
    }
  }
  unsigned __int8 v13 = 0;
LABEL_28:

  return v13;
}

- (unint64_t)hash
{
  v3 = [(IDSStewieDeviceInfo *)self locale];
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = [(IDSStewieDeviceInfo *)self pushToken];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  v7 = [(IDSStewieDeviceInfo *)self dsid];

  if (v7)
  {
    v8 = [(IDSStewieDeviceInfo *)self dsid];
    v6 ^= (unint64_t)[v8 hash];
  }
  v9 = [(IDSStewieDeviceInfo *)self accessTokens];

  if (v9)
  {
    v10 = [(IDSStewieDeviceInfo *)self accessTokens];
    v6 ^= (unint64_t)[v10 hash];
  }
  v11 = [(IDSStewieDeviceInfo *)self featureIDs];

  if (v11)
  {
    v12 = [(IDSStewieDeviceInfo *)self featureIDs];
    v6 ^= (unint64_t)[v12 hash];
  }
  return v6;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = [(IDSStewieDeviceInfo *)self locale];
  id v5 = [(IDSStewieDeviceInfo *)self pushToken];
  unint64_t v6 = [v5 debugDescription];
  v7 = [(IDSStewieDeviceInfo *)self dsid];
  v8 = [(IDSStewieDeviceInfo *)self accessTokens];
  id v9 = [v8 count];
  v10 = [(IDSStewieDeviceInfo *)self featureIDs];
  v11 = +[NSString stringWithFormat:@"<%@: %p { loc: %@, tok: %@, dsid: %@, accessTokens count: %ld, featureIDs: %@ }>", v3, self, v4, v6, v7, v9, v10];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(IDSStewieDeviceInfo *)self locale];
  [v4 encodeObject:v5 forKey:@"locale"];

  unint64_t v6 = [(IDSStewieDeviceInfo *)self pushToken];
  [v4 encodeObject:v6 forKey:@"pushToken"];

  v7 = [(IDSStewieDeviceInfo *)self dsid];
  [v4 encodeObject:v7 forKey:@"dsid"];

  v8 = [(IDSStewieDeviceInfo *)self accessTokens];
  [v4 encodeObject:v8 forKey:@"accessTokens"];

  id v9 = [(IDSStewieDeviceInfo *)self featureIDs];
  [v4 encodeObject:v9 forKey:@"featureIDs"];
}

- (IDSStewieDeviceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pushToken"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dsid"];
  uint64_t v8 = objc_opt_class();
  id v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"accessTokens"];

  uint64_t v11 = objc_opt_class();
  v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, objc_opt_class(), 0);
  unsigned __int8 v13 = [v4 decodeObjectOfClasses:v12 forKey:@"featureIDs"];

  id v14 = [(IDSStewieDeviceInfo *)self initWithLocale:v5 pushToken:v6 dsid:v7 accessTokens:v10 featureIDs:v13];
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)locale
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)pushToken
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)dsid
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)accessTokens
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)featureIDs
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureIDs, 0);
  objc_storeStrong((id *)&self->_accessTokens, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

@end