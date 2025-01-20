@interface IKFolder
+ (id)archiveFolder;
+ (id)folderWithFolderID:(int64_t)a3;
+ (id)starredFolder;
+ (id)unreadFolder;
- (BOOL)syncToMobile;
- (IKFolder)init;
- (IKFolder)initWithFolderID:(int64_t)a3;
- (NSString)title;
- (id)description;
- (int64_t)folderID;
- (unint64_t)position;
- (void)dealloc;
- (void)setFolderID:(int64_t)a3;
- (void)setPosition:(unint64_t)a3;
- (void)setSyncToMobile:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation IKFolder

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setSyncToMobile:(BOOL)a3
{
  self->_syncToMobile = a3;
}

- (BOOL)syncToMobile
{
  return self->_syncToMobile;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setFolderID:(int64_t)a3
{
  self->_folderID = a3;
}

- (int64_t)folderID
{
  return self->_folderID;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IKFolder;
  [(IKFolder *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %@ (%ld)>", NSStringFromClass(v4), -[IKFolder title](self, "title"), -[IKFolder folderID](self, "folderID")];
}

- (IKFolder)initWithFolderID:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IKFolder;
  result = [(IKFolder *)&v5 init];
  if (result)
  {
    result->_folderID = a3;
    result->_title = 0;
    result->_syncToMobile = 0;
    result->_position = 0;
  }
  return result;
}

- (IKFolder)init
{
  return [(IKFolder *)self initWithFolderID:0x7FFFFFFFFFFFFFFFLL];
}

+ (id)folderWithFolderID:(int64_t)a3
{
  objc_super v3 = [[IKFolder alloc] initWithFolderID:a3];
  return v3;
}

+ (id)archiveFolder
{
  return (id)[a1 folderWithFolderID:-3];
}

+ (id)starredFolder
{
  return (id)[a1 folderWithFolderID:-2];
}

+ (id)unreadFolder
{
  return (id)[a1 folderWithFolderID:-1];
}

@end