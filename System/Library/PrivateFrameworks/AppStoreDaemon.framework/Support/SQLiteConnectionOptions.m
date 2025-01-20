@interface SQLiteConnectionOptions
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation SQLiteConnectionOptions

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (v5)
  {
    v5[2] = self->_cacheSize;
    id v7 = [(NSString *)self->_databasePath copyWithZone:a3];
    v8 = (void *)v6[3];
    v6[3] = v7;

    id v9 = [(NSString *)self->_encryptionKeyId copyWithZone:a3];
    v10 = (void *)v6[4];
    v6[4] = v9;

    *((unsigned char *)v6 + 8) = self->_readOnly;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionType, 0);
  objc_storeStrong((id *)&self->_encryptionKeyId, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
}

@end