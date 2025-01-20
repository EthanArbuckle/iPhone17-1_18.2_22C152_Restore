@interface NTKCollieSnapshotInfo
+ (id)snapshotInfoWithStyleName:(id)a3 resourceDirectory:(id)a4 poseType:(unint64_t)a5 size:(CGSize)a6;
- (BOOL)equalsStyleName:(id)a3 resourceDirectory:(id)a4 poseType:(unint64_t)a5 size:(CGSize)a6;
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (NSMutableSet)completions;
- (NSString)resourceDirectory;
- (NSString)styleName;
- (NTKCollieSnapshotInfo)initWithStyleName:(id)a3 resourceDirectory:(id)a4 poseType:(unint64_t)a5 size:(CGSize)a6;
- (unint64_t)poseType;
- (void)setCompletions:(id)a3;
- (void)setPoseType:(unint64_t)a3;
- (void)setResourceDirectory:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setStyleName:(id)a3;
@end

@implementation NTKCollieSnapshotInfo

- (NTKCollieSnapshotInfo)initWithStyleName:(id)a3 resourceDirectory:(id)a4 poseType:(unint64_t)a5 size:(CGSize)a6
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v12 = a3;
  id v13 = a4;
  v19.receiver = self;
  v19.super_class = (Class)NTKCollieSnapshotInfo;
  v14 = [(NTKCollieSnapshotInfo *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_styleName, a3);
    objc_storeStrong((id *)&v15->_resourceDirectory, a4);
    v15->_poseType = a5;
    v15->_size.CGFloat width = width;
    v15->_size.CGFloat height = height;
    uint64_t v16 = objc_opt_new();
    completions = v15->_completions;
    v15->_completions = (NSMutableSet *)v16;
  }
  return v15;
}

+ (id)snapshotInfoWithStyleName:(id)a3 resourceDirectory:(id)a4 poseType:(unint64_t)a5 size:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  id v10 = a4;
  id v11 = a3;
  id v12 = -[NTKCollieSnapshotInfo initWithStyleName:resourceDirectory:poseType:size:]([NTKCollieSnapshotInfo alloc], "initWithStyleName:resourceDirectory:poseType:size:", v11, v10, a5, width, height);

  return v12;
}

- (BOOL)equalsStyleName:(id)a3 resourceDirectory:(id)a4 poseType:(unint64_t)a5 size:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  id v11 = a3;
  id v12 = (NSString *)a4;
  BOOL v15 = 0;
  if (self->_poseType == a5 && self->_size.width == width && self->_size.height == height)
  {
    if ([(NSString *)self->_styleName isEqualToString:v11])
    {
      resourceDirectory = self->_resourceDirectory;
      if (resourceDirectory == v12 || [(NSString *)resourceDirectory isEqualToString:v12]) {
        BOOL v15 = 1;
      }
    }
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (double *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v5 = -[NTKCollieSnapshotInfo equalsStyleName:resourceDirectory:poseType:size:](self, "equalsStyleName:resourceDirectory:poseType:size:", *((void *)v4 + 1), *((void *)v4 + 2), *((void *)v4 + 3), v4[5], v4[6]);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (NSString)styleName
{
  return self->_styleName;
}

- (void)setStyleName:(id)a3
{
}

- (NSString)resourceDirectory
{
  return self->_resourceDirectory;
}

- (void)setResourceDirectory:(id)a3
{
}

- (unint64_t)poseType
{
  return self->_poseType;
}

- (void)setPoseType:(unint64_t)a3
{
  self->_poseType = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (NSMutableSet)completions
{
  return self->_completions;
}

- (void)setCompletions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_resourceDirectory, 0);

  objc_storeStrong((id *)&self->_styleName, 0);
}

@end