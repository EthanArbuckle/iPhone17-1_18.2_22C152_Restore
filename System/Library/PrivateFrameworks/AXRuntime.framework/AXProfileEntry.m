@interface AXProfileEntry
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)uid;
- (NSString)appName;
- (double)duration;
- (id)description;
- (int)pid;
- (int64_t)attribute;
- (unint64_t)type;
- (unint64_t)valueHash;
- (unint64_t)valueSize;
- (void)setAppName:(id)a3;
- (void)setAttribute:(int64_t)a3;
- (void)setDuration:(double)a3;
- (void)setPid:(int)a3;
- (void)setType:(unint64_t)a3;
- (void)setUid:(id)a3;
- (void)setValueHash:(unint64_t)a3;
- (void)setValueSize:(unint64_t)a3;
@end

@implementation AXProfileEntry

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Attr:%ld duration:%f hash:%lu", self->_attribute, *(void *)&self->_duration, self->_valueHash);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)uid
{
  unint64_t elementID = self->_uid.elementID;
  unint64_t elementOrHash = self->_uid.elementOrHash;
  result.var1 = elementID;
  result.var0 = elementOrHash;
  return result;
}

- (void)setUid:(id)a3
{
  self->_uid = ($886C338F17C0F012374626B487BB4A27)a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (int64_t)attribute
{
  return self->_attribute;
}

- (void)setAttribute:(int64_t)a3
{
  self->_attribute = a3;
}

- (unint64_t)valueSize
{
  return self->_valueSize;
}

- (void)setValueSize:(unint64_t)a3
{
  self->_valueSize = a3;
}

- (unint64_t)valueHash
{
  return self->_valueHash;
}

- (void)setValueHash:(unint64_t)a3
{
  self->_valueHash = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end