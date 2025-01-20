@interface CKContextUserActivity
+ (BOOL)supportsSecureCoding;
- (CKContextUserActivity)initWithCoder:(id)a3;
- (CKContextUserActivity)initWithUserActivity:(id)a3;
- (NSDate)entryDate;
- (NSNumber)numberOfOccurrences;
- (NSString)bundleIdentifier;
- (NSUUID)uuid;
- (NSUserActivity)userActivity;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)prepareForDonationWithCompletionHandler:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setEntryDate:(id)a3;
- (void)setNumberOfOccurrences:(id)a3;
@end

@implementation CKContextUserActivity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKContextUserActivity)initWithUserActivity:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKContextUserActivity;
  v6 = [(CKContextUserActivity *)&v10 init];
  if (v6)
  {
    v7 = (NSUUID *)objc_alloc_init(MEMORY[0x263F08C38]);
    uuid = v6->_uuid;
    v6->_uuid = v7;

    objc_storeStrong((id *)&v6->_userActivity, a3);
  }

  return v6;
}

- (void)prepareForDonationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_userActivityData)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
  else
  {
    objc_initWeak(&location, self);
    userActivity = self->_userActivity;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __65__CKContextUserActivity_prepareForDonationWithCompletionHandler___block_invoke;
    v7[3] = &unk_264197080;
    objc_copyWeak(&v9, &location);
    id v8 = v5;
    [(NSUserActivity *)userActivity _createUserActivityDataWithOptions:0 completionHandler:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __65__CKContextUserActivity_prepareForDonationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (a3 || !WeakRetained)
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    objc_storeStrong(WeakRetained + 3, a2);
    id v8 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v8();
}

- (void)setEntryDate:(id)a3
{
  [a3 timeIntervalSince1970];
  self->_recordedTimeIntervalSince1970 = v4;
}

- (NSDate)entryDate
{
  return (NSDate *)[MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:self->_recordedTimeIntervalSince1970];
}

- (id)description
{
  v3 = [(NSUserActivity *)self->_userActivity title];
  uint64_t v4 = [v3 length];
  bundleIdentifier = (NSString *)v3;
  if (v4) {
    goto LABEL_4;
  }
  if ([(NSString *)self->_bundleIdentifier length])
  {
    bundleIdentifier = self->_bundleIdentifier;
LABEL_4:
    v6 = bundleIdentifier;
    goto LABEL_5;
  }
  v6 = @"No description available";
LABEL_5:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUserActivity *)self->_userActivity hash];
  uint64_t v4 = [(NSUserActivity *)self->_userActivity activityType];
  uint64_t v5 = [v4 hash] - v3 + 32 * v3;

  NSUInteger v6 = [(NSString *)self->_bundleIdentifier hash] - v5 + 32 * v5;
  v7 = [(NSUserActivity *)self->_userActivity userInfo];
  uint64_t v8 = [v7 hash] - v6 + 32 * v6;

  id v9 = [(NSUserActivity *)self->_userActivity webpageURL];
  uint64_t v10 = [v9 hash] - v8 + 32 * v8;

  v11 = [(NSUserActivity *)self->_userActivity referrerURL];
  unint64_t v12 = [v11 hash] - v10 + 32 * v10 + 887503681;

  return v12;
}

- (CKContextUserActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CKContextUserActivity;
  uint64_t v5 = [(CKContextUserActivity *)&v24 init];
  if (v5)
  {
    NSUInteger v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
    v7 = v6;
    if (v6) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = (NSUUID *)objc_alloc_init(MEMORY[0x263F08C38]);
    }
    uuid = v5->_uuid;
    v5->_uuid = v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    uint64_t v11 = [v10 copy];
    unint64_t v12 = (void *)v11;
    if (v11) {
      v13 = (__CFString *)v11;
    }
    else {
      v13 = &stru_26C3C8D00;
    }
    objc_storeStrong((id *)&v5->_bundleIdentifier, v13);

    [v4 decodeDoubleForKey:@"recordedTimeInterval"];
    v5->_recordedTimeIntervalSince1970 = v14;
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberOfOccurrences"];
    v16 = (void *)v15;
    if (v15) {
      v17 = (void *)v15;
    }
    else {
      v17 = &unk_26C3C97B8;
    }
    objc_storeStrong((id *)&v5->_numberOfOccurrences, v17);

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userActivityData"];
    userActivityData = v5->_userActivityData;
    v5->_userActivityData = (NSData *)v18;

    uint64_t v20 = [objc_alloc(MEMORY[0x263F08D38]) _initWithUserActivityData:v5->_userActivityData];
    userActivity = v5->_userActivity;
    v5->_userActivity = (NSUserActivity *)v20;

    v22 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:bundleIdentifier forKey:@"bundleIdentifier"];
  [v5 encodeDouble:@"recordedTimeInterval" forKey:self->_recordedTimeIntervalSince1970];
  [v5 encodeObject:self->_numberOfOccurrences forKey:@"numberOfOccurrence"];
  [v5 encodeObject:self->_uuid forKey:@"uuid"];
  [v5 encodeObject:self->_userActivityData forKey:@"userActivityData"];
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSNumber)numberOfOccurrences
{
  return self->_numberOfOccurrences;
}

- (void)setNumberOfOccurrences:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_numberOfOccurrences, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_userActivityData, 0);

  objc_storeStrong((id *)&self->_userActivity, 0);
}

@end