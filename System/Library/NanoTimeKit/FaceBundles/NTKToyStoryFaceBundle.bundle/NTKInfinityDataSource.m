@interface NTKInfinityDataSource
+ (id)alienColor;
+ (id)ballColor;
+ (id)bullseyeColor;
+ (id)buzzColor;
+ (id)hammColor;
+ (id)hangGliderColor;
+ (id)jessieColor;
+ (id)rexColor;
+ (id)spotlightColor;
+ (id)supportingCastColor;
+ (id)woodyColor;
- (id)initForDevice:(id)a3;
- (id)listingsForCharacter:(unint64_t)a3;
- (id)listingsForCharacter:(unint64_t)a3 ofTypes:(id)a4 withAttributes:(id)a5 recentlyUsed:(id)a6;
- (id)listingsOfTypes:(id)a3 withAttributes:(id)a4 recentlyUsed:(id)a5;
- (int64_t)numberOfTotalActions;
- (int64_t)numberOfTotalMagicMoments;
- (void)_countListings;
- (void)_loadCharacters;
- (void)setNumberOfTotalActions:(int64_t)a3;
- (void)setNumberOfTotalMagicMoments:(int64_t)a3;
@end

@implementation NTKInfinityDataSource

+ (id)buzzColor
{
  if (qword_118A0 != -1) {
    dispatch_once(&qword_118A0, &stru_C2F8);
  }
  v2 = (void *)qword_11898;

  return v2;
}

+ (id)woodyColor
{
  if (qword_118B0 != -1) {
    dispatch_once(&qword_118B0, &stru_C318);
  }
  v2 = (void *)qword_118A8;

  return v2;
}

+ (id)jessieColor
{
  if (qword_118C0 != -1) {
    dispatch_once(&qword_118C0, &stru_C338);
  }
  v2 = (void *)qword_118B8;

  return v2;
}

+ (id)ballColor
{
  if (qword_118D0 != -1) {
    dispatch_once(&qword_118D0, &stru_C358);
  }
  v2 = (void *)qword_118C8;

  return v2;
}

+ (id)hangGliderColor
{
  if (qword_118E0 != -1) {
    dispatch_once(&qword_118E0, &stru_C378);
  }
  v2 = (void *)qword_118D8;

  return v2;
}

+ (id)bullseyeColor
{
  if (qword_118F0 != -1) {
    dispatch_once(&qword_118F0, &stru_C398);
  }
  v2 = (void *)qword_118E8;

  return v2;
}

+ (id)supportingCastColor
{
  if (qword_11900 != -1) {
    dispatch_once(&qword_11900, &stru_C3B8);
  }
  v2 = (void *)qword_118F8;

  return v2;
}

+ (id)rexColor
{
  if (qword_11910 != -1) {
    dispatch_once(&qword_11910, &stru_C3D8);
  }
  v2 = (void *)qword_11908;

  return v2;
}

+ (id)hammColor
{
  if (qword_11920 != -1) {
    dispatch_once(&qword_11920, &stru_C3F8);
  }
  v2 = (void *)qword_11918;

  return v2;
}

+ (id)alienColor
{
  if (qword_11930 != -1) {
    dispatch_once(&qword_11930, &stru_C418);
  }
  v2 = (void *)qword_11928;

  return v2;
}

+ (id)spotlightColor
{
  if (qword_11940 != -1) {
    dispatch_once(&qword_11940, &stru_C438);
  }
  v2 = (void *)qword_11938;

  return v2;
}

- (id)initForDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKInfinityDataSource;
  v6 = [(NTKInfinityDataSource *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    [(NTKInfinityDataSource *)v7 _loadCharacters];
    [(NTKInfinityDataSource *)v7 _countListings];
  }

  return v7;
}

- (id)listingsForCharacter:(unint64_t)a3
{
  CFStringRef v16 = @"character";
  v4 = +[NSNumber numberWithUnsignedInteger:a3];
  v17 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v6 = +[NTKInfinityListingAttributes attributesWithDictionary:v5];

  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_38BC;
  v14 = &unk_C460;
  id v15 = v6;
  id v7 = v6;
  v8 = +[NSPredicate predicateWithBlock:&v11];
  objc_super v9 = -[NSArray filteredArrayUsingPredicate:](self->_listings, "filteredArrayUsingPredicate:", v8, v11, v12, v13, v14);

  return v9;
}

- (id)listingsForCharacter:(unint64_t)a3 ofTypes:(id)a4 withAttributes:(id)a5 recentlyUsed:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [(NTKInfinityDataSource *)self listingsForCharacter:a3];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_3A4C;
  v20[3] = &unk_C488;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  v17 = +[NSPredicate predicateWithBlock:v20];
  v18 = [v13 filteredArrayUsingPredicate:v17];

  return v18;
}

- (id)listingsOfTypes:(id)a3 withAttributes:(id)a4 recentlyUsed:(id)a5
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_3C28;
  v14[3] = &unk_C488;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v8 = v17;
  id v9 = v16;
  id v10 = v15;
  id v11 = +[NSPredicate predicateWithBlock:v14];
  id v12 = [(NSArray *)self->_listings filteredArrayUsingPredicate:v11];

  return v12;
}

- (void)_loadCharacters
{
  self->_listings = +[NSMutableArray array];

  _objc_release_x1();
}

- (void)_countListings
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_listings;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    p_numberOfTotalActions = &self->_numberOfTotalActions;
    p_numberOfTotalMagicMoments = &self->_numberOfTotalMagicMoments;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v10 = (int *)objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v9), "type", (void)v12);
        if ((unint64_t)v10 - 1 >= 3)
        {
          id v11 = p_numberOfTotalMagicMoments;
          if (v10 != &dword_4) {
            goto LABEL_10;
          }
        }
        else
        {
          id v11 = p_numberOfTotalActions;
        }
        ++*v11;
LABEL_10:
        id v9 = (char *)v9 + 1;
      }
      while (v5 != v9);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (int64_t)numberOfTotalActions
{
  return self->_numberOfTotalActions;
}

- (void)setNumberOfTotalActions:(int64_t)a3
{
  self->_numberOfTotalActions = a3;
}

- (int64_t)numberOfTotalMagicMoments
{
  return self->_numberOfTotalMagicMoments;
}

- (void)setNumberOfTotalMagicMoments:(int64_t)a3
{
  self->_numberOfTotalMagicMoments = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listings, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end