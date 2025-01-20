@interface TKDefaultImageServices
+ (void)setup;
@end

@implementation TKDefaultImageServices

+ (void)setup
{
  v3 = (dispatch_once_t *)&setup_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_2);
  if (*v3 != -1) {
    dispatch_once(v3, location);
  }
  objc_storeStrong(&location, 0);
}

uint64_t __31__TKDefaultImageServices_setup__block_invoke()
{
  return +[TKAdaptiveImageAPI registerService:@"cloudinary" handler:&__block_literal_global_107];
}

id __31__TKDefaultImageServices_setup__block_invoke_2(void *a1, void *a2, void *a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  location[6] = *(id *)&a4;
  location[7] = *(id *)&a5;
  location[2] = *(id *)&a6;
  location[3] = *(id *)&a7;
  location[4] = *(id *)&a8;
  location[5] = *(id *)&a9;
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v12 = 0;
  objc_storeStrong(&v12, a3);
  id v11 = location[0];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v11;
}

id __31__TKDefaultImageServices_setup__block_invoke_3(void *a1, void *a2, void *a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, double a10)
{
  double v30 = a4;
  double v31 = a5;
  v29.origin.x = a6;
  v29.origin.y = a7;
  v29.size.width = a8;
  v29.size.height = a9;
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v27 = 0;
  objc_storeStrong(&v27, a3);
  double v26 = a10;
  v25[1] = a1;
  v25[0] = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v33.origin.x = 0.0;
  v33.origin.y = 0.0;
  v33.size.width = 1.0;
  v33.size.height = 1.0;
  if (!CGRectEqualToRect(v29, v33))
  {
    id v19 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%f,%f,%f,%f", *(void *)&v29.origin.x, *(void *)&v29.origin.y, *(void *)&v29.size.width, *(void *)&v29.size.height);
    objc_msgSend(v25[0], "setObject:forKeyedSubscript:");
  }
  uint64_t v24 = (uint64_t)v30;
  if ((uint64_t)v30 > 0)
  {
    id v18 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%li", v24);
    objc_msgSend(v25[0], "setObject:forKeyedSubscript:");
  }
  uint64_t v23 = (uint64_t)v31;
  if ((uint64_t)v31 > 0)
  {
    id v17 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%li", v23);
    objc_msgSend(v25[0], "setObject:forKeyedSubscript:");
  }
  if (v24 <= 0 && v23 <= 0) {
    [v25[0] setObject:@"1" forKeyedSubscript:@"scl"];
  }
  else {
    [v25[0] setObject:@"constrain,0" forKeyedSubscript:@"fit"];
  }
  if (v27)
  {
    [v25[0] setObject:@"jpeg" forKeyedSubscript:@"fmt"];
    id v16 = +[TKUtils hexForColor:v27 withAlpha:0];
    objc_msgSend(v25[0], "setObject:forKeyedSubscript:");
  }
  else
  {
    [v25[0] setObject:@"png-alpha" forKeyedSubscript:@"fmt"];
  }
  id v11 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%li", (uint64_t)(v26 * 100.0));
  objc_msgSend(v25[0], "setObject:forKeyedSubscript:");

  id v12 = location[0];
  id v13 = v25[0];
  id v14 = (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"wid", @"hei", @"scl", 0);
  id v15 = +[TKUtils URL:withQueryParameters:addKeys:removeKeys:escape:](TKUtils, "URL:withQueryParameters:addKeys:removeKeys:escape:", v12, v13, &unk_26DD5EDA0);

  objc_storeStrong(v25, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  return v15;
}

id __31__TKDefaultImageServices_setup__block_invoke_4(void *a1, void *a2, void *a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, double a10)
{
  double v30 = a4;
  double v31 = a5;
  v29.origin.x = a6;
  v29.origin.y = a7;
  v29.size.width = a8;
  v29.size.height = a9;
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v27 = 0;
  objc_storeStrong(&v27, a3);
  double v26 = a10;
  v25[1] = a1;
  v25[0] = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v33.origin.x = 0.0;
  v33.origin.y = 0.0;
  v33.size.width = 1.0;
  v33.size.height = 1.0;
  if (!CGRectEqualToRect(v29, v33))
  {
    id v19 = objc_retainAutoreleasedReturnValue((id)objc_msgSend(NSString, "stringWithFormat:", @"%fxw:%fxh;%fxw,%fxh",
                                                   *(void *)&v29.size.width,
                                                   *(void *)&v29.size.height,
                                                   *(void *)&v29.origin.x,
                                                   *(void *)&v29.origin.y));
    objc_msgSend(v25[0], "setObject:forKeyedSubscript:");
  }
  uint64_t v24 = (uint64_t)v30;
  uint64_t v23 = (uint64_t)v31;
  if ((uint64_t)v30 <= 0 && v23 <= 0)
  {
    if (v24 > 0)
    {
      id v17 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%li:*", v24);
      objc_msgSend(v25[0], "setObject:forKeyedSubscript:");
    }
  }
  else
  {
    id v18 = (id)objc_msgSend(NSString, "stringWithFormat:", @"inside%%7C%li:%li", v24, v23);
    objc_msgSend(v25[0], "setObject:forKeyedSubscript:");
  }
  if (v27)
  {
    [v25[0] setObject:@"jpg" forKeyedSubscript:@"output-format"];
    id v16 = +[TKUtils hexForColor:v27 withAlpha:0];
    objc_msgSend(v25[0], "setObject:forKeyedSubscript:");
  }
  else
  {
    [v25[0] setObject:@"png" forKeyedSubscript:@"output-format"];
  }
  id v11 = (id)objc_msgSend(NSString, "stringWithFormat:", @"%li", (uint64_t)(v26 * 100.0));
  objc_msgSend(v25[0], "setObject:forKeyedSubscript:");

  [v25[0] setObject:@"progressive-bicubic" forKeyedSubscript:@"interpolation"];
  id v12 = location[0];
  id v13 = v25[0];
  id v14 = (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"fit", @"resize", 0);
  id v15 = +[TKUtils URL:withQueryParameters:addKeys:removeKeys:escape:](TKUtils, "URL:withQueryParameters:addKeys:removeKeys:escape:", v12, v13, &unk_26DD5EDB8);

  objc_storeStrong(v25, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  return v15;
}

id __31__TKDefaultImageServices_setup__block_invoke_5(void *a1, void *a2, void *a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  double v32 = a4;
  double v33 = a5;
  id location[2] = *(id *)&a6;
  location[3] = *(id *)&a7;
  location[4] = *(id *)&a8;
  location[5] = *(id *)&a9;
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v30 = 0;
  objc_storeStrong(&v30, a3);
  double v29 = a10;
  v28[1] = a1;
  v28[0] = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v27 = (uint64_t)v32;
  if ((uint64_t)v32 > 0)
  {
    id v21 = (id)objc_msgSend(NSString, "stringWithFormat:", @"w_%li", v27);
    objc_msgSend(v28[0], "addObject:");
  }
  uint64_t v26 = (uint64_t)v33;
  if ((uint64_t)v33 > 0)
  {
    id v20 = (id)objc_msgSend(NSString, "stringWithFormat:", @"h_%li", v26);
    objc_msgSend(v28[0], "addObject:");
  }
  if (v27 > 0 && v26 > 0) {
    [v28[0] addObject:@"c_limit"];
  }
  if (v30)
  {
    [v28[0] addObject:@"f_jpg"];
    id v17 = NSString;
    id v19 = +[TKUtils hexForColor:v30 withAlpha:0];
    id v18 = (id)[v17 stringWithFormat:@"b_rgb:%@", v19];
    objc_msgSend(v28[0], "addObject:");
  }
  else
  {
    [v28[0] addObject:@"f_png"];
  }
  id v11 = v28[0];
  id v12 = (id)objc_msgSend(NSString, "stringWithFormat:", @"q_%li", (uint64_t)(v29 * 100.0));
  objc_msgSend(v11, "addObject:");

  id v25 = (id)[v28[0] componentsJoinedByString:@","];
  id v15 = (id)[location[0] URLByDeletingLastPathComponent];
  id v14 = (id)[v15 URLByAppendingPathComponent:v25];
  id v13 = (id)[location[0] lastPathComponent];
  id v16 = (id)objc_msgSend(v14, "URLByAppendingPathComponent:");

  objc_storeStrong(&v25, 0);
  objc_storeStrong(v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  return v16;
}

@end