@interface CATActiveServiceConnectionIDSMessage
+ (id)instanceWithDictionary:(id)a3;
- (CATActiveIDSServiceConnectionMessageContent)content;
- (CATActiveServiceConnectionIDSMessage)initWithConnectionIdentifier:(id)a3 receivedSequenceNumber:(id)a4 content:(id)a5;
- (NSDictionary)dictionaryValue;
- (NSNumber)receivedSequenceNumber;
- (NSUUID)connectionIdentifier;
- (int64_t)messageType;
@end

@implementation CATActiveServiceConnectionIDSMessage

- (CATActiveServiceConnectionIDSMessage)initWithConnectionIdentifier:(id)a3 receivedSequenceNumber:(id)a4 content:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CATActiveServiceConnectionIDSMessage;
  v12 = [(CATActiveServiceConnectionIDSMessage *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connectionIdentifier, a3);
    objc_storeStrong((id *)&v13->_receivedSequenceNumber, a4);
    objc_storeStrong((id *)&v13->_content, a5);
  }

  return v13;
}

- (int64_t)messageType
{
  return 102;
}

- (NSDictionary)dictionaryValue
{
  v3 = objc_opt_new();
  v4 = [(CATActiveServiceConnectionIDSMessage *)self connectionIdentifier];
  v5 = [v4 UUIDString];
  [v3 setObject:v5 forKeyedSubscript:@"ConnectionIdentifier"];

  v6 = [(CATActiveServiceConnectionIDSMessage *)self content];
  v7 = [v6 dictionaryValue];
  [v3 setObject:v7 forKeyedSubscript:@"Content"];

  v8 = NSNumber;
  id v9 = [(CATActiveServiceConnectionIDSMessage *)self content];
  id v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "contentType"));
  [v3 setObject:v10 forKeyedSubscript:@"ContentType"];

  id v11 = [(CATActiveServiceConnectionIDSMessage *)self receivedSequenceNumber];
  [v3 setObject:v11 forKeyedSubscript:@"ReceivedSequenceNumber"];

  v12 = (void *)[v3 copy];

  return (NSDictionary *)v12;
}

+ (id)instanceWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "cat_uuidForKey:", @"ConnectionIdentifier");
  v6 = [v4 objectForKeyedSubscript:@"Content"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  id v9 = [v4 objectForKeyedSubscript:@"ContentType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  v12 = [v4 objectForKeyedSubscript:@"ReceivedSequenceNumber"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v13 = v12;
  }
  else {
    v13 = 0;
  }
  id v14 = v13;

  objc_super v15 = 0;
  if (v5 && v8 && v11)
  {
    uint64_t v16 = [v11 integerValue];
    if ((unint64_t)(v16 - 1) <= 5
      && ([(__objc2_class *)*off_2641DBF78[v16 - 1] instanceWithDictionary:v8],
          (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v18 = (void *)v17;
      objc_super v15 = (void *)[objc_alloc((Class)a1) initWithConnectionIdentifier:v5 receivedSequenceNumber:v14 content:v17];
    }
    else
    {
      objc_super v15 = 0;
    }
  }

  return v15;
}

- (NSUUID)connectionIdentifier
{
  return self->_connectionIdentifier;
}

- (NSNumber)receivedSequenceNumber
{
  return self->_receivedSequenceNumber;
}

- (CATActiveIDSServiceConnectionMessageContent)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_receivedSequenceNumber, 0);

  objc_storeStrong((id *)&self->_connectionIdentifier, 0);
}

@end