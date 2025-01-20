@interface PHAudioCallControlArrangement
+ (id)defaultAlertControlTypes;
+ (id)defaultControlTypes;
+ (id)defaultMultipleCallControlTypes;
+ (id)features;
+ (id)simplifiedDefaultAlertControlTypes;
+ (id)simplifiedDefaultControlTypes;
+ (id)simplifiedDefaultMultipleCallControlTypes;
- (NSArray)controlTypes;
- (PHAudioCallControlArrangement)initWithControlTypes:(id)a3;
- (id)_replaceControlsOfType:(unint64_t)a3 withControlOfType:(unint64_t)a4;
- (unint64_t)columns;
- (unint64_t)controlTypeAtRow:(unint64_t)a3 column:(unint64_t)a4;
- (unint64_t)rows;
- (void)replaceControlsOfType:(unint64_t)a3 withControlOfType:(unint64_t)a4;
- (void)setControlTypes:(id)a3;
@end

@implementation PHAudioCallControlArrangement

+ (id)features
{
  return +[CNKFeatures sharedInstance];
}

+ (id)defaultControlTypes
{
  v2 = [a1 features];
  unsigned int v3 = [v2 isButtonLayoutEnabled];

  if (v3) {
    return &off_1002DF5C0;
  }
  else {
    return &off_1002DF608;
  }
}

+ (id)simplifiedDefaultControlTypes
{
  return &off_1002DF638;
}

+ (id)defaultMultipleCallControlTypes
{
  unsigned int v3 = [a1 features];
  unsigned int v4 = [v3 isButtonLayoutEnabled];

  if (v4)
  {
    v5 = [a1 features];
    if ([v5 callManagerEnabled]) {
      uint64_t v6 = 5;
    }
    else {
      uint64_t v6 = 9;
    }
    v7 = +[NSNumber numberWithUnsignedInteger:v6];
    v11[1] = v7;
    v11[2] = &off_1002DEDC0;
    v8 = +[NSArray arrayWithObjects:v11 count:3];
    v12[0] = v8;
    v12[1] = &off_1002DF650;
    v9 = +[NSArray arrayWithObjects:v12 count:2];
  }
  else
  {
    v9 = &off_1002DF698;
  }

  return v9;
}

+ (id)simplifiedDefaultMultipleCallControlTypes
{
  return &off_1002DF6C8;
}

+ (id)defaultAlertControlTypes
{
  return &off_1002DF710;
}

+ (id)simplifiedDefaultAlertControlTypes
{
  return &off_1002DF740;
}

- (PHAudioCallControlArrangement)initWithControlTypes:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHAudioCallControlArrangement;
  v5 = [(PHAudioCallControlArrangement *)&v9 init];
  if (v5)
  {
    uint64_t v6 = (NSArray *)[v4 copy];
    controlTypes = v5->_controlTypes;
    v5->_controlTypes = v6;
  }
  return v5;
}

- (unint64_t)rows
{
  v2 = [(PHAudioCallControlArrangement *)self controlTypes];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (unint64_t)columns
{
  unint64_t result = [(PHAudioCallControlArrangement *)self rows];
  if (result)
  {
    id v4 = [(PHAudioCallControlArrangement *)self controlTypes];
    v5 = [v4 objectAtIndex:0];
    id v6 = [v5 count];

    return (unint64_t)v6;
  }
  return result;
}

- (unint64_t)controlTypeAtRow:(unint64_t)a3 column:(unint64_t)a4
{
  id v6 = [(PHAudioCallControlArrangement *)self controlTypes];
  v7 = [v6 objectAtIndexedSubscript:a3];
  v8 = [v7 objectAtIndexedSubscript:a4];
  id v9 = [v8 unsignedIntegerValue];

  return (unint64_t)v9;
}

- (void)replaceControlsOfType:(unint64_t)a3 withControlOfType:(unint64_t)a4
{
  id v5 = [(PHAudioCallControlArrangement *)self _replaceControlsOfType:a3 withControlOfType:a4];
  [(PHAudioCallControlArrangement *)self setControlTypes:v5];
}

- (id)_replaceControlsOfType:(unint64_t)a3 withControlOfType:(unint64_t)a4
{
  id v21 = +[NSMutableArray array];
  v7 = [(PHAudioCallControlArrangement *)self controlTypes];

  if (v7)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = [(PHAudioCallControlArrangement *)self controlTypes];
    id v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v22)
    {
      uint64_t v20 = *(void *)v28;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v10 = +[NSMutableArray array];
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v11 = v9;
          id v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v24;
            do
            {
              for (j = 0; j != v13; j = (char *)j + 1)
              {
                if (*(void *)v24 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
                if ([v16 unsignedIntegerValue] == (id)a3)
                {
                  v17 = +[NSNumber numberWithUnsignedInteger:a4];
                  [v10 addObject:v17];
                }
                else
                {
                  [v10 addObject:v16];
                }
              }
              id v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
            }
            while (v13);
          }

          [v21 addObject:v10];
        }
        id v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v22);
    }
  }

  return v21;
}

- (NSArray)controlTypes
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setControlTypes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end