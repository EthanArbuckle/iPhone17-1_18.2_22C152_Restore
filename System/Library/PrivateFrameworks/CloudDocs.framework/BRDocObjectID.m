@interface BRDocObjectID
+ (BOOL)supportsSecureCoding;
- (BOOL)isDocumentID;
- (BOOL)isFpfsItem;
- (BRDocObjectID)initWithCoder:(id)a3;
- (BRDocObjectID)initWithDocID:(unsigned int)a3;
- (BRDocObjectID)initWithDocIDNumber:(id)a3;
- (id)asString;
- (id)description;
- (id)documentID;
- (unint64_t)rawID;
- (unsigned)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BRDocObjectID

- (BRDocObjectID)initWithDocIDNumber:(id)a3
{
  uint64_t v4 = [a3 unsignedIntValue];

  return [(BRDocObjectID *)self initWithDocID:v4];
}

- (BRDocObjectID)initWithDocID:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BRDocObjectID;
  result = [(BRDocObjectID *)&v5 init];
  if (result) {
    result->_docID = a3;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<doc-id %x>", self->_docID);
}

- (id)asString
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"d%x", self->_docID);
}

- (unint64_t)rawID
{
  return self->_docID;
}

- (id)documentID
{
  return (id)[NSNumber numberWithUnsignedInt:self->_docID];
}

- (BOOL)isDocumentID
{
  return 1;
}

- (unsigned)type
{
  return 2;
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

- (BRDocObjectID)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BRDocObjectID;
  objc_super v5 = [(BRDocObjectID *)&v7 init];
  if (v5) {
    v5->_docID = [v4 decodeInt32ForKey:@"v"];
  }

  return v5;
}

@end