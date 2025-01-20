@interface BRDbRowObjectID
+ (BOOL)supportsSecureCoding;
- (BOOL)isFpfsItem;
- (BRDbRowObjectID)initWithCoder:(id)a3;
- (BRDbRowObjectID)initWithRowID:(unint64_t)a3 type:(unsigned __int8)a4;
- (id)asString;
- (id)description;
- (id)documentID;
- (id)folderID;
- (id)itemDBRowID;
- (unint64_t)rawID;
- (unsigned)type;
- (void)documentID;
- (void)encodeWithCoder:(id)a3;
- (void)folderID;
@end

@implementation BRDbRowObjectID

- (BRDbRowObjectID)initWithRowID:(unint64_t)a3 type:(unsigned __int8)a4
{
  v7.receiver = self;
  v7.super_class = (Class)BRDbRowObjectID;
  result = [(BRDbRowObjectID *)&v7 init];
  if (result)
  {
    result->_rowId = a3;
    result->_type = a4;
  }
  return result;
}

- (id)description
{
  v2 = NSString;
  v3 = [(BRDbRowObjectID *)self asString];
  v4 = [v2 stringWithFormat:@"<%@>", v3];

  return v4;
}

- (id)asString
{
  if ([(BRFileObjectID *)self isRootContainerItem])
  {
    v3 = (id *)MEMORY[0x1E4F25C68];
LABEL_5:
    id v4 = *v3;
    goto LABEL_7;
  }
  if ([(BRFileObjectID *)self isCloudDocsRoot])
  {
    v3 = (id *)MEMORY[0x1E4F25BF0];
    goto LABEL_5;
  }
  objc_msgSend(NSString, "stringWithFormat:", @"%c%llx", +[BRFileObjectTypeConverter toChar:](BRFileObjectTypeConverter, "toChar:", self->_type), self->_rowId);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v4;
}

- (unint64_t)rawID
{
  return self->_rowId;
}

- (id)folderID
{
  v2 = brc_bread_crumbs((uint64_t)"-[BRDbRowObjectID folderID]", 238);
  v3 = brc_default_log(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRDbRowObjectID folderID]();
  }

  return 0;
}

- (id)documentID
{
  v2 = brc_bread_crumbs((uint64_t)"-[BRDbRowObjectID documentID]", 244);
  v3 = brc_default_log(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRDbRowObjectID documentID]();
  }

  return 0;
}

- (id)itemDBRowID
{
  return (id)[NSNumber numberWithUnsignedLongLong:self->_rowId];
}

- (unsigned)type
{
  return self->_type;
}

- (BOOL)isFpfsItem
{
  if (self->_type == 1) {
    return BRIsFPFSEnabled(self, a2);
  }
  else {
    return 1;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t rowId = self->_rowId;
  id v5 = a3;
  [v5 encodeInt64:rowId forKey:@"r"];
  [v5 encodeInt64:self->_type forKey:@"t"];
}

- (BRDbRowObjectID)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BRDbRowObjectID;
  id v5 = [(BRDbRowObjectID *)&v7 init];
  if (v5)
  {
    v5->_unint64_t rowId = [v4 decodeInt64ForKey:@"r"];
    v5->_type = [v4 decodeIntegerForKey:@"t"];
  }

  return v5;
}

- (void)folderID
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: asked the folderID of a BRDbRowObjectID item%@", v2, v3, v4, v5, v6);
}

- (void)documentID
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: asked the documentID of a BRDbRowObjectID item%@", v2, v3, v4, v5, v6);
}

@end