@interface AMSFamilyAccountPair
- (AMSFamilyAccountPair)initWithDownloaderAccountID:(unint64_t)a3 purchaserAccountID:(unint64_t)a4 familyID:(unint64_t)a5;
- (unint64_t)downloaderAccountID;
- (unint64_t)familyID;
- (unint64_t)purchaserAccountID;
@end

@implementation AMSFamilyAccountPair

- (AMSFamilyAccountPair)initWithDownloaderAccountID:(unint64_t)a3 purchaserAccountID:(unint64_t)a4 familyID:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)AMSFamilyAccountPair;
  result = [(AMSFamilyAccountPair *)&v9 init];
  if (result)
  {
    result->_downloaderAccountID = a3;
    result->_familyID = a5;
    result->_purchaserAccountID = a4;
  }
  return result;
}

- (unint64_t)downloaderAccountID
{
  return self->_downloaderAccountID;
}

- (unint64_t)familyID
{
  return self->_familyID;
}

- (unint64_t)purchaserAccountID
{
  return self->_purchaserAccountID;
}

@end