@interface MKTableViewCell
- (BOOL)_mapkit_forceSeparatorFrameToCGRectZero;
- (CGRect)_separatorFrame;
- (int64_t)_mapkit_separatorStyleOverride;
- (void)_mapkit_disableSeparatorStyleOverride;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setSeparatorStyle:(int64_t)mapkit_separatorStyleOverride;
- (void)set_mapkit_forceSeparatorFrameToCGRectZero:(BOOL)a3;
- (void)set_mapkit_separatorStyleOverride:(int64_t)a3;
@end

@implementation MKTableViewCell

- (void)set_mapkit_forceSeparatorFrameToCGRectZero:(BOOL)a3
{
  if (self->__mapkit_forceSeparatorFrameToCGRectZero != a3)
  {
    self->__mapkit_forceSeparatorFrameToCGRectZero = a3;
    uint64_t v4 = [(MKTableViewCell *)self separatorStyle];
    [(MKTableViewCell *)self setSeparatorStyle:(v4 + 1) % 3];
    [(MKTableViewCell *)self setSeparatorStyle:v4];
  }
}

- (void)set_mapkit_separatorStyleOverride:(int64_t)a3
{
  self->__mapkit_separatorStyleOverride = a3;
  self->__mapkit_separatorStyleOverrideEnabled = 1;
}

- (void)_mapkit_disableSeparatorStyleOverride
{
  self->__mapkit_separatorStyleOverrideEnabled = 0;
}

- (void)setSeparatorStyle:(int64_t)mapkit_separatorStyleOverride
{
  if (self->__mapkit_separatorStyleOverrideEnabled) {
    mapkit_separatorStyleOverride = self->__mapkit_separatorStyleOverride;
  }
  v3.receiver = self;
  v3.super_class = (Class)MKTableViewCell;
  [(MKTableViewCell *)&v3 setSeparatorStyle:mapkit_separatorStyleOverride];
}

- (CGRect)_separatorFrame
{
  if (self->__mapkit_forceSeparatorFrameToCGRectZero)
  {
    double v2 = *MEMORY[0x1E4F1DB28];
    double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MKTableViewCell;
    [(MKTableViewCell *)&v6 _separatorFrame];
  }
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKTableViewCell;
  -[MKTableViewCell setSemanticContentAttribute:](&v6, sel_setSemanticContentAttribute_);
  double v5 = [(MKTableViewCell *)self contentView];
  [v5 setSemanticContentAttribute:a3];
}

- (BOOL)_mapkit_forceSeparatorFrameToCGRectZero
{
  return self->__mapkit_forceSeparatorFrameToCGRectZero;
}

- (int64_t)_mapkit_separatorStyleOverride
{
  return self->__mapkit_separatorStyleOverride;
}

@end