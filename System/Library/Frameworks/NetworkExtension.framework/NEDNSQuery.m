@interface NEDNSQuery
- (NEDNSQuery)initWithName:(id)a3 recordType:(int64_t)a4 recordClass:(int64_t)a5;
- (NSData)answerData;
- (NSString)name;
- (int64_t)recordClass;
- (int64_t)recordType;
- (unsigned)answerTTL;
- (void)setAnswerData:(id)a3;
- (void)setAnswerTTL:(unsigned int)a3;
@end

@implementation NEDNSQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_answerData, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setAnswerTTL:(unsigned int)a3
{
  self->_answerTTL = a3;
}

- (unsigned)answerTTL
{
  return self->_answerTTL;
}

- (void)setAnswerData:(id)a3
{
}

- (NSData)answerData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)recordClass
{
  return self->_recordClass;
}

- (int64_t)recordType
{
  return self->_recordType;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NEDNSQuery)initWithName:(id)a3 recordType:(int64_t)a4 recordClass:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEDNSQuery;
  v10 = [(NEDNSQuery *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_name, a3);
    v11->_recordType = a4;
    v11->_recordClass = a5;
  }

  return v11;
}

@end