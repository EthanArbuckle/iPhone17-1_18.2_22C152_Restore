@interface ASDAlertPresentationResult
+ (BOOL)supportsSecureCoding;
- (ASDAlertPresentationResult)initWithCoder:(id)a3;
- (ASDAlertPresentationResult)initWithError:(id)a3;
- (ASDAlertPresentationResult)initWithSelectedActionIdentifier:(id)a3;
- (BOOL)isSelectedAction:(id)a3;
- (NSError)error;
- (NSUUID)selectedActionIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDAlertPresentationResult

- (ASDAlertPresentationResult)initWithError:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASDAlertPresentationResult;
  v6 = [(ASDAlertPresentationResult *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    selectedActionIdentifier = v7->_selectedActionIdentifier;
    v7->_selectedActionIdentifier = 0;
  }
  return v7;
}

- (ASDAlertPresentationResult)initWithSelectedActionIdentifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASDAlertPresentationResult;
  v6 = [(ASDAlertPresentationResult *)&v10 init];
  v7 = v6;
  if (v6)
  {
    error = v6->_error;
    v6->_error = 0;

    objc_storeStrong((id *)&v7->_selectedActionIdentifier, a3);
  }

  return v7;
}

- (BOOL)isSelectedAction:(id)a3
{
  if (self->_error) {
    return 0;
  }
  selectedActionIdentifier = self->_selectedActionIdentifier;
  id v5 = [a3 identifier];
  LOBYTE(selectedActionIdentifier) = [(NSUUID *)selectedActionIdentifier isEqual:v5];

  return (char)selectedActionIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDAlertPresentationResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDAlertPresentationResult;
  id v5 = [(ASDAlertPresentationResult *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedActionIdentifier"];
    selectedActionIdentifier = v5->_selectedActionIdentifier;
    v5->_selectedActionIdentifier = (NSUUID *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  error = self->_error;
  id v5 = a3;
  [v5 encodeObject:error forKey:@"error"];
  [v5 encodeObject:self->_selectedActionIdentifier forKey:@"selectedActionIdentifier"];
}

- (NSError)error
{
  return self->_error;
}

- (NSUUID)selectedActionIdentifier
{
  return self->_selectedActionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedActionIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end