@interface MTRContentControlClusterRatingNameStruct
- (MTRContentControlClusterRatingNameStruct)init;
- (NSString)ratingName;
- (NSString)ratingNameDesc;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setRatingName:(id)a3;
- (void)setRatingNameDesc:(id)a3;
@end

@implementation MTRContentControlClusterRatingNameStruct

- (MTRContentControlClusterRatingNameStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRContentControlClusterRatingNameStruct;
  v2 = [(MTRContentControlClusterRatingNameStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    ratingName = v2->_ratingName;
    v2->_ratingName = (NSString *)&stru_26F969DC8;

    ratingNameDesc = v3->_ratingNameDesc;
    v3->_ratingNameDesc = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRContentControlClusterRatingNameStruct);
  objc_super v7 = objc_msgSend_ratingName(self, v5, v6);
  objc_msgSend_setRatingName_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_ratingNameDesc(self, v9, v10);
  objc_msgSend_setRatingNameDesc_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: ratingName:%@; ratingNameDesc:%@; >",
    v5,
    self->_ratingName,
  objc_super v7 = self->_ratingNameDesc);

  return v7;
}

- (NSString)ratingName
{
  return self->_ratingName;
}

- (void)setRatingName:(id)a3
{
}

- (NSString)ratingNameDesc
{
  return self->_ratingNameDesc;
}

- (void)setRatingNameDesc:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingNameDesc, 0);

  objc_storeStrong((id *)&self->_ratingName, 0);
}

@end