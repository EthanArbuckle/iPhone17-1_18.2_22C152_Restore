@interface BRInodeObjectID
+ (BOOL)supportsSecureCoding;
- (BOOL)isFolderOrAliasID;
- (BOOL)isFpfsItem;
- (BRInodeObjectID)initWithCoder:(id)a3;
- (BRInodeObjectID)initWithFileID:(unint64_t)a3;
- (id)asString;
- (id)description;
- (id)folderID;
- (unint64_t)rawID;
- (unsigned)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BRInodeObjectID

- (BRInodeObjectID)initWithFileID:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BRInodeObjectID;
  result = [(BRInodeObjectID *)&v5 init];
  if (result) {
    result->_ino = a3;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<ino %llx>", self->_ino);
}

- (id)asString
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"i%llx", self->_ino);
}

- (unint64_t)rawID
{
  return self->_ino;
}

- (id)folderID
{
  return (id)[NSNumber numberWithUnsignedLongLong:self->_ino];
}

- (BOOL)isFolderOrAliasID
{
  return 1;
}

- (unsigned)type
{
  return 3;
}

- (BOOL)isFpfsItem
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BRInodeObjectID)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BRInodeObjectID;
  objc_super v5 = [(BRInodeObjectID *)&v7 init];
  if (v5) {
    v5->_ino = [v4 decodeInt64ForKey:@"v"];
  }

  return v5;
}

@end