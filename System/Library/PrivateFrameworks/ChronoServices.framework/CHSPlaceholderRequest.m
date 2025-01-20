@interface CHSPlaceholderRequest
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (CHSPlaceholderRequest)init;
- (CHSPlaceholderRequest)initWithCoder:(id)a3;
- (CHSPlaceholderRequest)initWithMetrics:(id)a3 family:(int64_t)a4 fileHandle:(id)a5;
- (CHSWidgetMetrics)metrics;
- (NSFileHandle)fileHandle;
- (int64_t)family;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSPlaceholderRequest

+ (id)new
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"CHSPlaceholderRequest.m" lineNumber:16 description:@"use initWithMetrics:family:fileHandle:"];

  return 0;
}

- (CHSPlaceholderRequest)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"CHSPlaceholderRequest.m" lineNumber:21 description:@"use initWithMetrics:family:fileHandle:"];

  return 0;
}

- (CHSPlaceholderRequest)initWithMetrics:(id)a3 family:(int64_t)a4 fileHandle:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CHSPlaceholderRequest;
  v11 = [(CHSPlaceholderRequest *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_metrics, a3);
    v12->_family = a4;
    objc_storeStrong((id *)&v12->_fileHandle, a5);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_family forKey:@"_family"];
  [v4 encodeObject:self->_metrics forKey:@"_metrics"];
  [v4 encodeObject:self->_fileHandle forKey:@"_fileHandle"];
}

- (CHSPlaceholderRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_metrics"];
  unint64_t v6 = [v4 decodeIntegerForKey:@"_family"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fileHandle"];
  v8 = (void *)v7;
  id v9 = 0;
  if (v5 && v7)
  {
    if (CHSWidgetFamilyIsValid(v6))
    {
      self = [(CHSPlaceholderRequest *)self initWithMetrics:v5 family:v6 fileHandle:v8];
      id v9 = self;
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

- (CHSWidgetMetrics)metrics
{
  return self->_metrics;
}

- (int64_t)family
{
  return self->_family;
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end