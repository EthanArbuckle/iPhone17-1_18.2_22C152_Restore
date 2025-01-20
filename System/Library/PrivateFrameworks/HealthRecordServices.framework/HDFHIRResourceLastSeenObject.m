@interface HDFHIRResourceLastSeenObject
+ (BOOL)supportsSecureCoding;
- (HDFHIRResourceLastSeenObject)initWithCoder:(id)a3;
- (HDFHIRResourceLastSeenObject)initWithResourceIdentifier:(id)a3 sourceURL:(id)a4 lastSeenDate:(id)a5;
- (HKFHIRIdentifier)resourceIdentifier;
- (NSDate)lastSeenDate;
- (NSURL)sourceURL;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDFHIRResourceLastSeenObject

- (HDFHIRResourceLastSeenObject)initWithResourceIdentifier:(id)a3 sourceURL:(id)a4 lastSeenDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDFHIRResourceLastSeenObject;
  v11 = [(HDFHIRResourceLastSeenObject *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    resourceIdentifier = v11->_resourceIdentifier;
    v11->_resourceIdentifier = (HKFHIRIdentifier *)v12;

    uint64_t v14 = [v9 copy];
    sourceURL = v11->_sourceURL;
    v11->_sourceURL = (NSURL *)v14;

    uint64_t v16 = [v10 copy];
    lastSeenDate = v11->_lastSeenDate;
    v11->_lastSeenDate = (NSDate *)v16;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDFHIRResourceLastSeenObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SourceURL"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastSeenDate"];
    self = [(HDFHIRResourceLastSeenObject *)self initWithResourceIdentifier:v5 sourceURL:v6 lastSeenDate:v7];

    id v8 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    id v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HDFHIRResourceLastSeenObject *)self resourceIdentifier];
  [v4 encodeObject:v5 forKey:@"Identifier"];

  v6 = [(HDFHIRResourceLastSeenObject *)self sourceURL];
  [v4 encodeObject:v6 forKey:@"SourceURL"];

  id v7 = [(HDFHIRResourceLastSeenObject *)self lastSeenDate];
  [v4 encodeObject:v7 forKey:@"LastSeenDate"];
}

- (HKFHIRIdentifier)resourceIdentifier
{
  return self->_resourceIdentifier;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (NSDate)lastSeenDate
{
  return self->_lastSeenDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSeenDate, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);

  objc_storeStrong((id *)&self->_resourceIdentifier, 0);
}

@end