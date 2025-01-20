@interface QLMovieEdits
+ (id)editsWithRightRotationsCount:(unint64_t)a3 trimStartTime:(double)a4 trimEndTime:(double)a5;
- (BOOL)hasEdits;
- (BOOL)isEqual:(id)a3;
- (BOOL)rotated;
- (BOOL)trimmed;
- (QLMovieEdits)init;
- (double)trimEndTime;
- (double)trimStartTime;
- (unint64_t)rightRotationsCount;
- (void)incrementRightRotationsCount;
- (void)resetEditingValues;
- (void)resetTrimmingValues;
- (void)setRightRotationsCount:(unint64_t)a3;
- (void)setTrimEndTime:(double)a3;
- (void)setTrimStartTime:(double)a3;
@end

@implementation QLMovieEdits

- (QLMovieEdits)init
{
  v5.receiver = self;
  v5.super_class = (Class)QLMovieEdits;
  v2 = [(QLMovieEdits *)&v5 init];
  v3 = v2;
  if (v2) {
    [(QLMovieEdits *)v2 resetEditingValues];
  }
  return v3;
}

+ (id)editsWithRightRotationsCount:(unint64_t)a3 trimStartTime:(double)a4 trimEndTime:(double)a5
{
  v8 = objc_opt_new();
  [v8 setRightRotationsCount:a3];
  [v8 setTrimStartTime:a4];
  [v8 setTrimEndTime:a5];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (QLMovieEdits *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      unint64_t rightRotationsCount = self->_rightRotationsCount;
      if (rightRotationsCount == [(QLMovieEdits *)v5 rightRotationsCount]
        && (double trimStartTime = self->_trimStartTime, [(QLMovieEdits *)v5 trimStartTime],
                                                  trimStartTime == v8))
      {
        double trimEndTime = self->_trimEndTime;
        [(QLMovieEdits *)v5 trimEndTime];
        BOOL v11 = trimEndTime == v10;
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (void)incrementRightRotationsCount
{
  self->_unint64_t rightRotationsCount = (LODWORD(self->_rightRotationsCount) + 1) & 3;
}

- (void)resetTrimmingValues
{
  *(int64x2_t *)&self->_double trimStartTime = vdupq_n_s64(0x7FF8000000000000uLL);
}

- (void)resetEditingValues
{
  self->_unint64_t rightRotationsCount = 0;
  [(QLMovieEdits *)self resetTrimmingValues];
}

- (BOOL)hasEdits
{
  if ([(QLMovieEdits *)self rotated]) {
    return 1;
  }

  return [(QLMovieEdits *)self trimmed];
}

- (BOOL)rotated
{
  return self->_rightRotationsCount != 0;
}

- (BOOL)trimmed
{
  return 1;
}

- (unint64_t)rightRotationsCount
{
  return self->_rightRotationsCount;
}

- (void)setRightRotationsCount:(unint64_t)a3
{
  self->_unint64_t rightRotationsCount = a3;
}

- (double)trimStartTime
{
  return self->_trimStartTime;
}

- (void)setTrimStartTime:(double)a3
{
  self->_double trimStartTime = a3;
}

- (double)trimEndTime
{
  return self->_trimEndTime;
}

- (void)setTrimEndTime:(double)a3
{
  self->_double trimEndTime = a3;
}

@end