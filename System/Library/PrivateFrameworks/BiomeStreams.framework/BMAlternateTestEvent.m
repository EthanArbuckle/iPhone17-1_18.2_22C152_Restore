@interface BMAlternateTestEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMAlternateTestEvent)initWithAlternateContent:(unsigned int)a3 dataVersion:(unsigned int)a4;
- (BMAlternateTestEvent)initWithCoder:(id)a3;
- (BMAlternateTestEvent)initWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BOOL)checkAndReportDecodingFailureIfNeededForuint32_t:(unsigned int)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (id)serialize;
- (unsigned)alternateContent;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMAlternateTestEvent

- (BMAlternateTestEvent)initWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BMAlternateTestEvent;
  v7 = [(BMEventBase *)&v10 init];
  if (!v7
    || [v6 length] == 8
    && ([v6 getBytes:&v7->_data length:8], v7->_data.dataVersion == a4))
  {
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BMAlternateTestEvent)initWithAlternateContent:(unsigned int)a3 dataVersion:(unsigned int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BMAlternateTestEvent;
  result = [(BMEventBase *)&v7 init];
  if (result)
  {
    result->_data.dataVersion = a4;
    result->_data.content = a3;
  }
  return result;
}

- (unsigned)alternateContent
{
  return self->_data.content;
}

- (unsigned)dataVersion
{
  return self->_data.dataVersion;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  id v6 = [[BMAlternateTestEvent alloc] initWithData:v5 dataVersion:v4];

  return v6;
}

- (id)serialize
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&self->_data length:8];

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForuint32_t:(unsigned int)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1E4F28C58];
      v17 = [NSString stringWithFormat:@"Failed to decode key %@", v11, *MEMORY[0x1E4F28568]];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = [v16 errorWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  p_data = &self->_data;
  uint64_t dataVersion = self->_data.dataVersion;
  id v5 = a3;
  [v5 encodeInt32:dataVersion forKey:@"dataVersion"];
  [v5 encodeInt32:p_data->content forKey:@"alternateContent"];
}

- (BMAlternateTestEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v7 = [v4 decodeInt32ForKey:@"dataVersion"];
  if (-[BMAlternateTestEvent checkAndReportDecodingFailureIfNeededForuint32_t:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForuint32_t:key:coder:errorDomain:errorCode:", v7, @"dataVersion", v4, v6, -1)|| (uint64_t v8 = [v4 decodeInt32ForKey:@"alternateContent"], -[BMAlternateTestEvent checkAndReportDecodingFailureIfNeededForuint32_t:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForuint32_t:key:coder:errorDomain:errorCode:", v8, @"alternateContent", v4, v6, -1)))
  {
    v9 = 0;
  }
  else
  {
    self = [(BMAlternateTestEvent *)self initWithAlternateContent:v8 dataVersion:v7];
    v9 = self;
  }

  return v9;
}

@end