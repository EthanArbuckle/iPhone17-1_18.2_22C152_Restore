@interface GKMappedIndexPath
+ (id)indexPathForItem:(int64_t)a3 inSection:(int64_t)a4 fromSourceIndexPath:(id)a5 withTag:(id)a6;
- (NSIndexPath)sourceIndexPath;
- (id)description;
- (id)tag;
- (void)setSourceIndexPath:(id)a3;
- (void)setTag:(id)a3;
@end

@implementation GKMappedIndexPath

+ (id)indexPathForItem:(int64_t)a3 inSection:(int64_t)a4 fromSourceIndexPath:(id)a5 withTag:(id)a6
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v12[0] = a4;
  v12[1] = a3;
  id v8 = a6;
  id v9 = a5;
  v10 = [a1 indexPathWithIndexes:v12 length:2];
  [v10 setTag:v8];

  [v10 setSourceIndexPath:v9];

  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p> [%d, %d] => %@:[%d, %d]", objc_opt_class(), self, -[NSIndexPath section](self->_sourceIndexPath, "section"), -[NSIndexPath item](self->_sourceIndexPath, "item"), self->_tag, -[GKMappedIndexPath section](self, "section"), -[GKMappedIndexPath item](self, "item")];
}

- (id)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
}

- (NSIndexPath)sourceIndexPath
{
  return self->_sourceIndexPath;
}

- (void)setSourceIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceIndexPath, 0);

  objc_storeStrong(&self->_tag, 0);
}

@end