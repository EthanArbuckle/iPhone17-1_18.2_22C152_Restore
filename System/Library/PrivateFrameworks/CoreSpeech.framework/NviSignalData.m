@interface NviSignalData
+ (id)headerString;
- (NviSignalData)initWithCoder:(id)a3;
- (NviSignalData)initWithSignalType:(unint64_t)a3 timestamp:(unint64_t)a4;
- (id)description;
- (id)stringForLogging;
- (unint64_t)sigGenTs;
- (unint64_t)sigType;
- (void)encodeWithCoder:(id)a3;
- (void)setSigGenTs:(unint64_t)a3;
- (void)setSigType:(unint64_t)a3;
@end

@implementation NviSignalData

- (void)setSigGenTs:(unint64_t)a3
{
  self->_sigGenTs = a3;
}

- (unint64_t)sigGenTs
{
  return self->_sigGenTs;
}

- (void)setSigType:(unint64_t)a3
{
  self->_sigType = a3;
}

- (unint64_t)sigType
{
  return self->_sigType;
}

- (id)description
{
  v3 = NSString;
  v4 = +[NviUtils strRepForNviSignalType:self->_sigType];
  v5 = [v3 stringWithFormat:@"{%@:ts=%lld}", v4, self->_sigGenTs];

  return v5;
}

- (id)stringForLogging
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[NviSignalData stringForLogging]";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Abstract Impl. Returning nil", (uint8_t *)&v4, 0xCu);
  }
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t sigType = self->_sigType;
  id v5 = a3;
  [v5 encodeInteger:sigType forKey:@"type"];
  [v5 encodeInt64:self->_sigGenTs forKey:@"ts"];
}

- (NviSignalData)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NviSignalData;
  id v5 = [(NviSignalData *)&v7 init];
  if (v5)
  {
    v5->_unint64_t sigType = [v4 decodeIntegerForKey:@"type"];
    v5->_sigGenTs = [v4 decodeInt64ForKey:@"ts"];
  }

  return v5;
}

- (NviSignalData)initWithSignalType:(unint64_t)a3 timestamp:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NviSignalData;
  result = [(NviSignalData *)&v7 init];
  if (result)
  {
    result->_unint64_t sigType = a3;
    result->_sigGenTs = a4;
  }
  return result;
}

+ (id)headerString
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = NviLogContextFacility;
  if (os_log_type_enabled((os_log_t)NviLogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "+[NviSignalData headerString]";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Abstract Impl. Returning nil", (uint8_t *)&v4, 0xCu);
  }
  return 0;
}

@end