@interface EKNotificationCollectionOptions
- (EKNotificationCollectionOptions)initWithExternalID:(id)a3 externalIDTag:(id)a4 inSource:(id)a5;
- (EKSource)source;
- (NSString)externalID;
- (NSString)externalIDTag;
- (id)description;
@end

@implementation EKNotificationCollectionOptions

- (EKNotificationCollectionOptions)initWithExternalID:(id)a3 externalIDTag:(id)a4 inSource:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EKNotificationCollectionOptions;
  v12 = [(EKNotificationCollectionOptions *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_externalID, a3);
    objc_storeStrong((id *)&v13->_externalIDTag, a4);
    objc_storeStrong((id *)&v13->_source, a5);
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(EKNotificationCollectionOptions *)self externalID];
  v6 = [(EKNotificationCollectionOptions *)self externalIDTag];
  v7 = [(EKNotificationCollectionOptions *)self source];
  v8 = [v3 stringWithFormat:@"<%@: %p>(externalID = %@, externalIDTag = %@, source = %@)", v4, self, v5, v6, v7];

  return v8;
}

- (EKSource)source
{
  return self->_source;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (NSString)externalIDTag
{
  return self->_externalIDTag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalIDTag, 0);
  objc_storeStrong((id *)&self->_externalID, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

@end