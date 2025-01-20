@interface MADDeferredProcessingEntry
+ (id)entryWithLocalIdentifier:(id)a3 requestDate:(id)a4;
- (MADDeferredProcessingEntry)initWithLocalIdentifier:(id)a3 requestDate:(id)a4;
- (NSDate)requestDate;
- (NSString)localIdentifier;
- (void)setLocalIdentifier:(id)a3;
- (void)setRequestDate:(id)a3;
@end

@implementation MADDeferredProcessingEntry

- (MADDeferredProcessingEntry)initWithLocalIdentifier:(id)a3 requestDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MADDeferredProcessingEntry;
  v9 = [(MADDeferredProcessingEntry *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localIdentifier, a3);
    objc_storeStrong((id *)&v10->_requestDate, a4);
  }

  return v10;
}

+ (id)entryWithLocalIdentifier:(id)a3 requestDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithLocalIdentifier:v6 requestDate:v5];

  return v7;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (void)setLocalIdentifier:(id)a3
{
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (void)setRequestDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

@end