@interface NTKCompanionUltraCubeTimePlacementDataSource
+ (id)_imageForOption:(int64_t)a3;
+ (id)_labelTextForOption:(int64_t)a3 disambiguateLayers:(BOOL)a4;
- (NTKCompanionUltraCubeTimePlacementDataSource)initWithOptions:(id)a3;
- (id)indexPathForOption:(int64_t)a3;
- (id)infoForItemAtIndexPath:(id)a3;
- (int64_t)numberOfItemsInSection:(int64_t)a3;
- (int64_t)numberOfSections;
- (void)resetInfoAtIndexPath:(id)a3;
@end

@implementation NTKCompanionUltraCubeTimePlacementDataSource

- (NTKCompanionUltraCubeTimePlacementDataSource)initWithOptions:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NTKCompanionUltraCubeTimePlacementDataSource;
  v5 = [(NTKCompanionUltraCubeTimePlacementDataSource *)&v24 init];
  if (v5)
  {
    if ([v4 containsObject:&off_4B980]) {
      unsigned __int8 v6 = 1;
    }
    else {
      unsigned __int8 v6 = [v4 containsObject:&off_4B998];
    }
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_29DE0;
    v22[3] = &unk_49540;
    unsigned __int8 v23 = v6;
    v7 = objc_retainBlock(v22);
    v8 = +[NSMutableArray array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v25 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = ((void (*)(void *, void))v7[2])(v7, *(void *)(*((void *)&v18 + 1) + 8 * (void)v13));
          if (v14) {
            objc_msgSend(v8, "addObject:", v14, (void)v18);
          }

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v25 count:16];
      }
      while (v11);
    }

    v15 = (NSArray *)[v8 copy];
    infos = v5->_infos;
    v5->_infos = v15;
  }
  return v5;
}

- (id)indexPathForOption:(int64_t)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_infos;
  v5 = (char *)[(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    unsigned __int8 v6 = v5;
    v7 = 0;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      id v9 = 0;
      id v10 = &v6[(void)v7];
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v9), "ntk_option", (void)v13) == (id)a3)
        {
          id v11 = +[NSIndexPath indexPathForItem:&v9[(void)v7] inSection:0];
          goto LABEL_11;
        }
        ++v9;
      }
      while (v6 != v9);
      unsigned __int8 v6 = (char *)[(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      v7 = v10;
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:

  return v11;
}

+ (id)_imageForOption:(int64_t)a3
{
  id v4 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:1 scale:28.0];
  v5 = 0;
  CFStringRef v6 = @"platter.top.applewatch.case";
  switch(a3)
  {
    case 1:
      goto LABEL_4;
    case 2:
      CFStringRef v6 = @"platter.filled.top.applewatch.case";
      goto LABEL_4;
    case 3:
      CFStringRef v6 = @"platter.filled.bottom.applewatch.case";
LABEL_4:
      v5 = +[UIImage systemImageNamed:v6 withConfiguration:v4];
      goto LABEL_5;
    case 4:
LABEL_5:
      uint64_t v7 = [v5 imageWithRenderingMode:2];

      v5 = (void *)v7;
      break;
    default:
      break;
  }

  return v5;
}

+ (id)_labelTextForOption:(int64_t)a3 disambiguateLayers:(BOOL)a4
{
  if (a4)
  {
    switch(a3)
    {
      case 1:
        CFStringRef v4 = @"TOP_BEHIND";
        CFStringRef v5 = @"Top Behind";
        goto LABEL_12;
      case 2:
        CFStringRef v4 = @"TOP_FRONT";
        CFStringRef v5 = @"Top Front";
        goto LABEL_12;
      case 3:
        CFStringRef v4 = @"BOTTOM_FRONT";
        CFStringRef v5 = @"Bottom Front";
        goto LABEL_12;
      case 4:
        CFStringRef v4 = @"BOTTOM_BEHIND";
        CFStringRef v5 = @"Bottom Behind";
        goto LABEL_12;
      default:
        goto LABEL_8;
    }
  }
  if ((unint64_t)(a3 - 3) < 2)
  {
    CFStringRef v4 = @"BOTTOM";
    CFStringRef v5 = @"Bottom";
  }
  else
  {
    if ((unint64_t)(a3 - 1) > 1)
    {
LABEL_8:
      CFStringRef v6 = &stru_49630;
      goto LABEL_13;
    }
    CFStringRef v4 = @"TOP";
    CFStringRef v5 = @"Top";
  }
LABEL_12:
  CFStringRef v6 = +[NTKUltraCubeFaceBundle localizedStringForKey:v4 comment:v5];
LABEL_13:

  return v6;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return [(NSArray *)self->_infos count];
}

- (int64_t)numberOfSections
{
  return 1;
}

- (id)infoForItemAtIndexPath:(id)a3
{
  id v4 = [a3 item];
  if (v4 >= (id)[(NSArray *)self->_infos count])
  {
    CFStringRef v5 = 0;
  }
  else
  {
    CFStringRef v5 = [(NSArray *)self->_infos objectAtIndex:v4];
  }

  return v5;
}

- (void)resetInfoAtIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end