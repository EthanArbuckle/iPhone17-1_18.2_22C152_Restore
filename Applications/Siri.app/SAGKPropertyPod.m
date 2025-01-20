@interface SAGKPropertyPod
- (id)_convertedCardSections;
@end

@implementation SAGKPropertyPod

- (id)_convertedCardSections
{
  id v19 = objc_alloc_init((Class)NSMutableArray);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(SAGKPropertyPod *)self propertyList];
  id v3 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v7 = objc_alloc_init((Class)SFRowCardSection);
        id v8 = objc_alloc_init((Class)SFRichText);
        v9 = [v6 name];
        [v8 setText:v9];

        [v7 setLeadingText:v8];
        id v10 = objc_alloc_init((Class)SFRichText);
        v11 = [v6 valueAnnotation];

        [v6 value];
        if (v11) {
          v12 = {;
        }
          v13 = [v6 valueAnnotation];
          v14 = +[NSString stringWithFormat:@"%@ %@", v12, v13];
        }
        else {
          v14 = {;
        }
        }
        [v10 setText:v14];
        [v7 setTrailingText:v10];
        [v19 addObject:v7];
      }
      id v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v4);
  }

  id v15 = [v19 copy];

  return v15;
}

@end