@interface CHRemoteRecognitionSketchRequest
+ (BOOL)supportsSecureCoding;
+ (id)loadFromFile:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRemoteRecognitionSketchRequest:(id)a3;
- (CHRemoteRecognitionSketchRequest)initWithCoder:(id)a3;
- (CHRemoteRecognitionSketchRequest)initWithDrawing:(id)a3 options:(id)a4 priority:(int64_t)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHRemoteRecognitionSketchRequest

- (CHRemoteRecognitionSketchRequest)initWithDrawing:(id)a3 options:(id)a4 priority:(int64_t)a5
{
  v6.receiver = self;
  v6.super_class = (Class)CHRemoteRecognitionSketchRequest;
  return [(CHRemoteRecognitionRequest *)&v6 initWithDrawing:a3 options:a4 priority:a5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHRemoteRecognitionSketchRequest)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CHRemoteRecognitionSketchRequest;
  result = [(CHRemoteRecognitionRequest *)&v6 initWithCoder:a3];
  if (!result)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v4 = (id)qword_1EA3C9FB0;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1C492D000, v4, OS_LOG_TYPE_ERROR, "CHRemoteRecognitionSketchRequest decoding failed. Locale is required to be non-null.", v5, 2u);
    }

    return 0;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CHRemoteRecognitionSketchRequest;
  [(CHRemoteRecognitionRequest *)&v3 encodeWithCoder:a3];
}

+ (id)loadFromFile:(id)a3
{
  objc_super v6 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E4F1C9B8], a2, (uint64_t)a3, v3, v4, v5);
  v7 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v8 = objc_opt_class();
  v11 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v7, v9, v8, (uint64_t)v6, 0, v10);

  return v11;
}

- (BOOL)isEqualToRemoteRecognitionSketchRequest:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)CHRemoteRecognitionSketchRequest;
  return -[CHRemoteRecognitionRequest isEqualToRemoteRecognitionRequest:](&v6, sel_isEqualToRemoteRecognitionRequest_);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isEqualToRemoteRecognitionSketchRequest = objc_msgSend_isEqualToRemoteRecognitionSketchRequest_(self, v5, (uint64_t)v4, v6, v7, v8);

    return isEqualToRemoteRecognitionSketchRequest;
  }
  else
  {

    return 0;
  }
}

@end