@interface AEGridEnvironment
- (AEGridEnvironment)init;
- (BOOL)isEqual:(id)a3;
- (double)compactExtensionHeight;
- (double)headerHeight;
- (double)minimumTileHeight;
- (double)scale;
- (double)targetBottomMargin;
- (unint64_t)hash;
- (void)setCompactExtensionHeight:(double)a3;
- (void)setHeaderHeight:(double)a3;
- (void)setMinimumTileHeight:(double)a3;
- (void)setScale:(double)a3;
- (void)setTargetBottomMargin:(double)a3;
@end

@implementation AEGridEnvironment

- (void)setCompactExtensionHeight:(double)a3
{
  self->_compactExtensionHeight = a3;
}

- (double)compactExtensionHeight
{
  return self->_compactExtensionHeight;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setMinimumTileHeight:(double)a3
{
  self->_minimumTileHeight = a3;
}

- (double)minimumTileHeight
{
  return self->_minimumTileHeight;
}

- (void)setTargetBottomMargin:(double)a3
{
  self->_targetBottomMargin = a3;
}

- (double)targetBottomMargin
{
  return self->_targetBottomMargin;
}

- (void)setHeaderHeight:(double)a3
{
  self->_headerHeight = a3;
}

- (double)headerHeight
{
  return self->_headerHeight;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AEGridEnvironment *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  if (v4 == self)
  {
    BOOL v22 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = v5;
    [(AEGridEnvironment *)self headerHeight];
    double v8 = v7;
    [(AEGridEnvironment *)v6 headerHeight];
    if (v8 != v9) {
      goto LABEL_11;
    }
    [(AEGridEnvironment *)self targetBottomMargin];
    double v11 = v10;
    [(AEGridEnvironment *)v6 targetBottomMargin];
    if (v11 != v12) {
      goto LABEL_11;
    }
    [(AEGridEnvironment *)self minimumTileHeight];
    double v14 = v13;
    [(AEGridEnvironment *)v6 minimumTileHeight];
    if (v14 == v15
      && ([(AEGridEnvironment *)self scale], double v17 = v16, [(AEGridEnvironment *)v6 scale], v17 == v18))
    {
      [(AEGridEnvironment *)self compactExtensionHeight];
      double v20 = v19;
      [(AEGridEnvironment *)v6 compactExtensionHeight];
      BOOL v22 = v20 == v21;
    }
    else
    {
LABEL_11:
      BOOL v22 = 0;
    }
  }
  else
  {
LABEL_9:
    BOOL v22 = 0;
  }
LABEL_13:

  return v22;
}

- (unint64_t)hash
{
  [(AEGridEnvironment *)self scale];
  double v4 = v3;
  [(AEGridEnvironment *)self headerHeight];
  unint64_t v6 = (unint64_t)(v4 * v5);
  [(AEGridEnvironment *)self targetBottomMargin];
  unint64_t v8 = (unint64_t)(v4 * v7);
  [(AEGridEnvironment *)self minimumTileHeight];
  unint64_t v10 = (unint64_t)(v4 * v9);
  [(AEGridEnvironment *)self compactExtensionHeight];
  return v6 ^ (unint64_t)v4 ^ v8 ^ v10 ^ (unint64_t)(v4 * v11);
}

- (AEGridEnvironment)init
{
  v3.receiver = self;
  v3.super_class = (Class)AEGridEnvironment;
  result = [(AEGridEnvironment *)&v3 init];
  if (result) {
    result->_scale = 1.0;
  }
  return result;
}

@end