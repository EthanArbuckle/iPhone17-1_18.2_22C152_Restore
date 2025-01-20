@interface MAMapsSnippetViewController
- (id)viewControllerForSnippet:(id)a3;
@end

@implementation MAMapsSnippetViewController

- (id)viewControllerForSnippet:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = +[MKMapService sharedService];
    [v4 captureUserAction:8001 onTarget:801 eventValue:0];

    id v5 = v3;
    v6 = [v5 items];
    id v7 = [v6 count];

    if ((unint64_t)v7 >= 2 && [v5 selectedItemIndex] == (id)0x7FFFFFFFFFFFFFFFLL) {
      v8 = &off_2C358;
    }
    else {
      v8 = off_2C350;
    }
    v10 = (MAMapsDisambiguationController *)[objc_alloc(*v8) initWithMapItemSnippet:v5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = +[MKMapService sharedService];
      [v9 captureUserAction:8002 onTarget:801 eventValue:0];

      v10 = [[MAMapsDisambiguationController alloc] initWithDisambiguationSnippet:v3];
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

@end