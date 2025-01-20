@interface AAUIUpdateMyPhotoRequest
+ (id)_downsampleImage:(id)a3 fromStartingQuality:(double)a4 toEndingQuality:(double)a5 increment:(double)a6 maxLength:(unint64_t)a7;
+ (id)_fullScreen2ImageFromImage:(id)a3 cropRect:(id)a4 fullScreenCropRect:(id *)a5;
- (AAUIUpdateMyPhotoRequest)initWithAccount:(id)a3 photo:(id)a4 cropRect:(id)a5;
- (NSValue)cropRect;
- (UIImage)photo;
- (id)urlRequest;
- (id)urlString;
@end

@implementation AAUIUpdateMyPhotoRequest

- (AAUIUpdateMyPhotoRequest)initWithAccount:(id)a3 photo:(id)a4 cropRect:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AAUIUpdateMyPhotoRequest;
  v12 = [(AAUIUpdateMyPhotoRequest *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    objc_storeStrong((id *)&v13->_photo, a4);
    objc_storeStrong((id *)&v13->_cropRect, a5);
  }

  return v13;
}

- (id)urlString
{
  v2 = [MEMORY[0x263F259C0] urlConfiguration];
  v3 = [v2 updateMyPhotoURL];

  return v3;
}

- (id)urlRequest
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)AAUIUpdateMyPhotoRequest;
  v3 = [(AARequest *)&v27 urlRequest];
  v4 = (void *)[v3 mutableCopy];

  [v4 setHTTPMethod:@"POST"];
  objc_msgSend(v4, "aa_addBasicAuthorizationHeaderWithAccount:preferUsingPassword:", self->_account, 0);
  [v4 setValue:@"text/plain" forHTTPHeaderField:@"Content-Type"];
  v5 = self->_cropRect;
  uint64_t v6 = +[AAUIUpdateMyPhotoRequest _downsampleImage:self->_photo fromStartingQuality:86016 toEndingQuality:1.0 increment:0.59 maxLength:0.2];
  if (v6)
  {
    v7 = (void *)v6;
  }
  else
  {
    if (v5)
    {
      photo = self->_photo;
      id v26 = 0;
      id v9 = +[AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage:photo cropRect:v5 fullScreenCropRect:&v26];
      id v10 = (AAUIProfilePictureStore *)v26;
      id v11 = v10;
      if (v10)
      {
        id v11 = v10;

        v5 = (NSValue *)v11;
      }
    }
    else
    {
      v12 = _AAUILogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209754000, v12, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest: Both photoData and cropRect are nil i.e photo is nil. Setting the picture as the default monogram.", buf, 2u);
      }

      id v11 = objc_alloc_init(AAUIProfilePictureStore);
      id v9 = [(AAUIProfilePictureStore *)v11 monogramForCurrentAccount];
      v5 = 0;
    }

    v7 = +[AAUIUpdateMyPhotoRequest _downsampleImage:v9 fromStartingQuality:86016 toEndingQuality:1.0 increment:0.19 maxLength:0.2];
  }
  v13 = [v7 base64EncodedDataWithOptions:0];
  v14 = _AAUILogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "length"));
    v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "length"));
    *(_DWORD *)buf = 138412546;
    v29 = v15;
    __int16 v30 = 2112;
    v31 = v16;
    _os_log_impl(&dword_209754000, v14, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest setting HTTPBody to base64 data of length %@ from photo data of length %@", buf, 0x16u);
  }
  [v4 setHTTPBody:v13];
  v17 = NSString;
  v18 = [v4 HTTPBody];
  v19 = objc_msgSend(v17, "stringWithFormat:", @"%lu", objc_msgSend(v18, "length"));

  [v4 setValue:v19 forHTTPHeaderField:@"Content-Length"];
  if (v7 && v5)
  {
    [(NSValue *)v5 CGRectValue];
    v24 = objc_msgSend(NSString, "stringWithFormat:", @"%lu,%lu,%lu,%lu", (unint64_t)v22, (unint64_t)v23, (unint64_t)v20, (unint64_t)v21);
    [v4 setValue:v24 forHTTPHeaderField:@"X-MMe-Setup-Family-Photo"];
  }
  return v4;
}

+ (id)_downsampleImage:(id)a3 fromStartingQuality:(double)a4 toEndingQuality:(double)a5 increment:(double)a6 maxLength:(unint64_t)a7
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v11 = (UIImage *)a3;
  if (a4 > a5)
  {
    v13 = 0;
    *(void *)&long long v12 = 138412546;
    long long v20 = v12;
    do
    {
      v14 = v13;
      v13 = UIImageJPEGRepresentation(v11, a4);

      objc_super v15 = _AAUILogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = [NSNumber numberWithDouble:a4];
        v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v13, "length"));
        *(_DWORD *)buf = v20;
        double v22 = v16;
        __int16 v23 = 2112;
        v24 = v17;
        _os_log_impl(&dword_209754000, v15, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest compressed image to quality %@ down to length %@", buf, 0x16u);
      }
      if ([v13 length] <= a7) {
        break;
      }
      a4 = a4 - a6;
    }
    while (a4 > a5);
    if (objc_msgSend(v13, "length", v20) <= a7)
    {
      if (v13) {
        goto LABEL_15;
      }
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  v13 = 0;
  if ([0 length] > a7) {
LABEL_11:
  }

LABEL_12:
  v18 = _AAUILogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    +[AAUIUpdateMyPhotoRequest _downsampleImage:fromStartingQuality:toEndingQuality:increment:maxLength:](v18);
  }

  v13 = 0;
LABEL_15:

  return v13;
}

+ (id)_fullScreen2ImageFromImage:(id)a3 cropRect:(id)a4 fullScreenCropRect:(id *)a5
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = _AAUILogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)MEMORY[0x263F08D40];
    [v7 size];
    id v11 = objc_msgSend(v10, "valueWithCGSize:");
    *(_DWORD *)buf = 138412546;
    id v79 = v11;
    __int16 v80 = 2112;
    id v81 = v8;
    _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage: of size %@ cropRect: %@", buf, 0x16u);
  }
  if (v8)
  {
    [v8 CGRectValue];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
  }
  else
  {
    [v7 size];
    double v17 = v20;
    [v7 size];
    double v19 = v21;
    double v13 = 0.0;
    double v15 = 0.0;
  }
  double v22 = _AAUILogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v23 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v13, v15, v17, v19);
    *(_DWORD *)buf = 138412290;
    id v79 = v23;
    _os_log_impl(&dword_209754000, v22, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage using importantArea %@", buf, 0xCu);
  }
  v24 = _AAUILogSystem();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  double v75 = v13;
  double v76 = v17;
  double v73 = v15;
  double v74 = v19;
  if (v17 / v19 <= 0.666666667)
  {
    if (v25)
    {
      v44 = [NSNumber numberWithDouble:v17 / v19];
      *(_DWORD *)buf = 138412290;
      id v79 = v44;
      _os_log_impl(&dword_209754000, v24, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage detected narrow importantAreaAspectRatio %@", buf, 0xCu);
    }
    double v77 = 960.0 / v19;
    v45 = _AAUILogSystem();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = [NSNumber numberWithDouble:v77];
      *(_DWORD *)buf = 138412290;
      id v79 = v46;
      _os_log_impl(&dword_209754000, v45, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage using scale %@", buf, 0xCu);
    }
    [v7 size];
    if (v19 * 0.666666667 >= v47) {
      double v48 = v47;
    }
    else {
      double v48 = v19 * 0.666666667;
    }
    double v43 = v13 - floor((v48 - v17) * 0.5);
    v49 = _AAUILogSystem();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v43, v15, v48, v19);
      *(_DWORD *)buf = 138412290;
      id v79 = v50;
      _os_log_impl(&dword_209754000, v49, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage got preliminary sourcePortionOfBaseImage %@", buf, 0xCu);
    }
    if (v43 < 0.0)
    {
      v51 = _AAUILogSystem();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        v52 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", 0.0, v15, v48, v19);
        *(_DWORD *)buf = 138412290;
        id v79 = v52;
        _os_log_impl(&dword_209754000, v51, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage constrained sourcePortionOfBaseImage left => %@", buf, 0xCu);
      }
      double v43 = 0.0;
    }
    [v7 size];
    if (v48 + v43 > v53)
    {
      [v7 size];
      double v43 = v54 - v48;
      v55 = _AAUILogSystem();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v56 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v43, v15, v48, v19);
        *(_DWORD *)buf = 138412290;
        id v79 = v56;
        _os_log_impl(&dword_209754000, v55, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage constrained sourcePortionOfBaseImage right => %@", buf, 0xCu);
      }
    }
    double v40 = 960.0;
    double v39 = floor(v48 * 960.0 / v19);
    v41 = _AAUILogSystem();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      double v40 = 960.0;
      v57 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", v39, 960.0);
      *(_DWORD *)buf = 138412290;
      id v79 = v57;
      _os_log_impl(&dword_209754000, v41, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage using contextSize %@", buf, 0xCu);
    }
  }
  else
  {
    if (v25)
    {
      id v26 = [NSNumber numberWithDouble:v17 / v19];
      *(_DWORD *)buf = 138412290;
      id v79 = v26;
      _os_log_impl(&dword_209754000, v24, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage detected squat importantAreaAspectRatio %@", buf, 0xCu);
    }
    double v77 = 640.0 / v17;
    objc_super v27 = _AAUILogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = [NSNumber numberWithDouble:v77];
      *(_DWORD *)buf = 138412290;
      id v79 = v28;
      _os_log_impl(&dword_209754000, v27, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage using scale %@", buf, 0xCu);
    }
    [v7 size];
    if (v17 / 0.666666667 >= v29) {
      double v30 = v29;
    }
    else {
      double v30 = v17 / 0.666666667;
    }
    double v15 = v15 - floor((v30 - v19) * 0.5);
    v31 = _AAUILogSystem();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v13, v15, v17, v30);
      *(_DWORD *)buf = 138412290;
      id v79 = v32;
      _os_log_impl(&dword_209754000, v31, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage got preliminary sourcePortionOfBaseImage %@", buf, 0xCu);
    }
    if (v15 < 0.0)
    {
      v33 = _AAUILogSystem();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v13, 0.0, v17, v30);
        *(_DWORD *)buf = 138412290;
        id v79 = v34;
        _os_log_impl(&dword_209754000, v33, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage constrained sourcePortionOfBaseImage top => %@", buf, 0xCu);
      }
      double v15 = 0.0;
    }
    [v7 size];
    if (v30 + v15 > v35)
    {
      [v7 size];
      double v15 = v36 - v30;
      v37 = _AAUILogSystem();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v13, v15, v17, v30);
        *(_DWORD *)buf = 138412290;
        id v79 = v38;
        _os_log_impl(&dword_209754000, v37, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage constrained sourcePortionOfBaseImage bottom => %@", buf, 0xCu);
      }
    }
    double v39 = 640.0;
    double v40 = floor(v30 * 640.0 / v17);
    v41 = _AAUILogSystem();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      double v39 = 640.0;
      v42 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", 640.0, v40);
      *(_DWORD *)buf = 138412290;
      id v79 = v42;
      _os_log_impl(&dword_209754000, v41, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage using contextSize %@", buf, 0xCu);
    }
    double v43 = v13;
  }

  double v58 = -(v43 * v77);
  [v7 size];
  double v60 = v77 * v59;
  double v61 = -(v15 * v77);
  [v7 size];
  double v63 = v77 * v62;
  v64 = _AAUILogSystem();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    v65 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v58, v61, v60, v63);
    *(_DWORD *)buf = 138412290;
    id v79 = v65;
    _os_log_impl(&dword_209754000, v64, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage using drawRect %@", buf, 0xCu);
  }
  v84.width = v39;
  v84.height = v40;
  UIGraphicsBeginImageContext(v84);
  objc_msgSend(v7, "drawInRect:", v58, v61, v60, v63);
  v66 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v67 = _AAUILogSystem();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    v68 = (void *)MEMORY[0x263F08D40];
    [v66 size];
    v69 = objc_msgSend(v68, "valueWithCGSize:");
    *(_DWORD *)buf = 138412290;
    id v79 = v69;
    _os_log_impl(&dword_209754000, v67, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage created fullScreen2Image with size %@", buf, 0xCu);
  }
  if (v8 && a5)
  {
    objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", ceil((v75 - v43) * v77), ceil((v73 - v15) * v77), floor(v76 * v77), floor(v74 * v77));
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v70 = _AAUILogSystem();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      id v71 = *a5;
      *(_DWORD *)buf = 138412290;
      id v79 = v71;
      _os_log_impl(&dword_209754000, v70, OS_LOG_TYPE_DEFAULT, "AAUIUpdateMyPhotoRequest _fullScreen2ImageFromImage created fullScreenCropRect %@", buf, 0xCu);
    }
  }
  return v66;
}

- (UIImage)photo
{
  return self->_photo;
}

- (NSValue)cropRect
{
  return self->_cropRect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cropRect, 0);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

+ (void)_downsampleImage:(os_log_t)log fromStartingQuality:toEndingQuality:increment:maxLength:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_209754000, log, OS_LOG_TYPE_DEBUG, "AAUIUpdateMyPhotoRequest we tried to compress and failed to get a small enough image.", v1, 2u);
}

@end