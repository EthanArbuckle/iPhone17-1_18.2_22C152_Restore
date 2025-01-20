@interface Bulletin
- (BOOL)isEqual:(id)a3;
- (Bulletin)init;
- (unint64_t)hash;
@end

@implementation Bulletin

- (Bulletin)init
{
  v9.receiver = self;
  v9.super_class = (Class)Bulletin;
  v2 = [(Bulletin *)&v9 init];
  if (v2)
  {
    v3 = (NSDate *)objc_alloc_init((Class)NSDate);
    creationDate = v2->_creationDate;
    v2->_creationDate = v3;

    v5 = +[NSUUID UUID];
    uint64_t v6 = [v5 UUIDString];
    recordID = v2->_recordID;
    v2->_recordID = (NSString *)v6;
  }
  return v2;
}

- (unint64_t)hash
{
  return [(NSString *)self->_recordID hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    if (self)
    {
      recordID = self->_recordID;
      if (v4)
      {
LABEL_5:
        uint64_t v8 = v4[7];
LABEL_6:
        objc_super v9 = recordID;
        unsigned __int8 v6 = [(NSString *)v9 isEqualToString:v8];

        goto LABEL_7;
      }
    }
    else
    {
      recordID = 0;
      if (v4) {
        goto LABEL_5;
      }
    }
    uint64_t v8 = 0;
    goto LABEL_6;
  }
  unsigned __int8 v6 = 0;
LABEL_7:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_interruptionLevel, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_launchURL, 0);
  objc_storeStrong((id *)&self->_actionButtonURL, 0);
  objc_storeStrong((id *)&self->_actionButtonTitle, 0);
}

@end