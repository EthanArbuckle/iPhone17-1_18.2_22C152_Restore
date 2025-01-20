@interface INUIPortableImageLoaderHelper
+ (BOOL)supportsSecureCoding;
- (INUIPortableImageLoaderHelper)initWithCoder:(id)a3;
- (UITraitCollection)traitCollection;
- (void)encodeWithCoder:(id)a3;
- (void)loadImageDataFromBundle:(id)a3 withImageName:(id)a4 accessSpecifier:(id)a5 completion:(id)a6;
- (void)loadImageSizeFromData:(id)a3 completion:(id)a4;
- (void)setTraitCollection:(id)a3;
@end

@implementation INUIPortableImageLoaderHelper

- (void).cxx_destruct
{
}

- (void)setTraitCollection:(id)a3
{
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (INUIPortableImageLoaderHelper)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INUIPortableImageLoaderHelper;
  v5 = [(INUIPortableImageLoaderHelper *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"traitCollection"];
    traitCollection = v5->_traitCollection;
    v5->_traitCollection = (UITraitCollection *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(INUIPortableImageLoaderHelper *)self traitCollection];
  [v4 encodeObject:v5 forKey:@"traitCollection"];
}

- (void)loadImageDataFromBundle:(id)a3 withImageName:(id)a4 accessSpecifier:(id)a5 completion:(id)a6
{
  v72[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void *, uint64_t, id, double, double))a6;
  if (!v13) {
    goto LABEL_31;
  }
  if (!v12)
  {
    id v12 = [MEMORY[0x263F0FB58] accessSpecifierWithNoAccess];
  }
  if ([v10 bundleType] == 2)
  {
    v14 = [MEMORY[0x263F1C6C8] configurationWithPointSize:44.0];
    v15 = [(INUIPortableImageLoaderHelper *)self traitCollection];
    if ([v15 userInterfaceStyle] == 1) {
      [MEMORY[0x263F1C550] labelColor];
    }
    else {
    uint64_t v30 = [MEMORY[0x263F1C550] whiteColor];
    }

    v31 = [MEMORY[0x263F1C6B0] systemImageNamed:v11 withConfiguration:v14];
    v62 = (void *)v30;
    v32 = [v31 imageWithTintColor:v30];

    [v32 size];
    double v34 = v33;
    [v32 size];
    if (v34 < v35) {
      double v34 = v35;
    }
    id v36 = objc_alloc(MEMORY[0x263F1C680]);
    v37 = (void *)MEMORY[0x263F1C688];
    v38 = [(INUIPortableImageLoaderHelper *)self traitCollection];
    v39 = [v37 formatForTraitCollection:v38];
    v26 = objc_msgSend(v36, "initWithSize:format:", v39, v34, v34);

    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3221225472;
    v65[2] = __98__INUIPortableImageLoaderHelper_loadImageDataFromBundle_withImageName_accessSpecifier_completion___block_invoke;
    v65[3] = &unk_263FD6918;
    v66 = v32;
    double v67 = v34;
    double v68 = v34;
    id v40 = v32;
    v29 = [v26 imageWithActions:v65];
    id v28 = 0;
    v41 = v66;
LABEL_18:

    goto LABEL_27;
  }
  v16 = [v10 bundleIdentifier];

  if (!v16) {
    goto LABEL_9;
  }
  v17 = (void *)MEMORY[0x263F01888];
  v18 = [v10 bundleIdentifier];
  v19 = [v17 bundleProxyForIdentifier:v18];

  v20 = [v19 bundleURL];
  v14 = [v20 path];

  if (!v14)
  {
LABEL_9:
    v14 = [v10 bundlePath];
  }
  id v21 = objc_alloc(MEMORY[0x263F087E8]);
  uint64_t v22 = *MEMORY[0x263F0F768];
  uint64_t v60 = *MEMORY[0x263F07F80];
  uint64_t v71 = *MEMORY[0x263F07F80];
  v23 = [NSString stringWithFormat:@"Loader client does not have sufficient permissions to load bundle image %@ %@", v11, v14];
  v72[0] = v23;
  v24 = [NSDictionary dictionaryWithObjects:v72 forKeys:&v71 count:1];
  v25 = (void *)[v21 initWithDomain:v22 code:6010 userInfo:v24];

  v26 = [MEMORY[0x263F086E0] bundleWithPath:v14];
  uint64_t v27 = [v12 accessLevel];
  uint64_t v61 = v22;
  v62 = v25;
  if (v27 != 1)
  {
    if (!v27)
    {
      id v28 = v25;
      if (v28) {
        goto LABEL_13;
      }
    }
LABEL_25:
    v48 = (void *)MEMORY[0x263F1C6B0];
    v49 = [(INUIPortableImageLoaderHelper *)self traitCollection];
    v29 = [v48 imageNamed:v11 inBundle:v26 compatibleWithTraitCollection:v49];

    if (v29)
    {
      id v28 = 0;
      goto LABEL_27;
    }
    id v57 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v69 = v60;
    id v40 = [NSString stringWithFormat:@"Failed to load image from bundle %@", v14];
    id v70 = v40;
    v41 = [NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
    id v28 = (id)[v57 initWithDomain:v61 code:6000 userInfo:v41];
    v29 = 0;
    goto LABEL_18;
  }
  v42 = (void *)MEMORY[0x263F01888];
  v43 = [v12 associatedAppBundleIdentifier];
  v44 = [v42 bundleProxyForIdentifier:v43];

  v45 = [v26 bundleURL];
  v59 = v44;
  if (!v45)
  {
    id v28 = 0;
    goto LABEL_23;
  }
  unint64_t v64 = 2;
  v58 = [MEMORY[0x263F08850] defaultManager];
  v46 = [v44 bundleURL];
  id v63 = 0;
  [v58 getRelationship:&v64 ofDirectoryAtURL:v46 toItemAtURL:v45 error:&v63];
  id v28 = v63;

  if (v64 >= 2)
  {
LABEL_23:
    id v47 = v62;

    id v28 = v47;
  }

  if (!v28) {
    goto LABEL_25;
  }
LABEL_13:
  v29 = 0;
LABEL_27:

  [(UIImage *)v29 size];
  double v51 = v50;
  double v53 = v52;
  uint64_t v54 = [(UIImage *)v29 renderingMode];
  if (v54 == 2) {
    uint64_t v55 = 2;
  }
  else {
    uint64_t v55 = v54 == 1;
  }
  v56 = UIImagePNGRepresentation(v29);
  v13[2](v13, v56, v55, v28, v51, v53);

LABEL_31:
}

uint64_t __98__INUIPortableImageLoaderHelper_loadImageDataFromBundle_withImageName_accessSpecifier_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) size];
  CGFloat v3 = v2 + -14.0;
  [*(id *)(a1 + 32) size];
  v8.size.height = v4 + -14.0;
  id v5 = *(void **)(a1 + 32);
  v8.origin.x = (*(double *)(a1 + 40) - v3) * 0.5;
  v8.origin.y = (*(double *)(a1 + 48) - (v4 + -14.0)) * 0.5;
  v8.size.width = v3;
  CGRect v9 = CGRectIntegral(v8);

  return objc_msgSend(v5, "drawInRect:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
}

- (void)loadImageSizeFromData:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void))a4;
  if (v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithData:v5];
    CGRect v8 = v7;
    if (v7)
    {
      [v7 size];
      v6[2](v6, 0);
    }
    else
    {
      CGRect v9 = (void *)*MEMORY[0x263F0F810];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
      {
        v13 = v9;
        v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        int v16 = 136315650;
        v17 = "-[INUIPortableImageLoaderHelper loadImageSizeFromData:completion:]";
        __int16 v18 = 2114;
        v19 = v15;
        __int16 v20 = 2048;
        uint64_t v21 = [v5 length];
        _os_log_error_impl(&dword_20A3EB000, v13, OS_LOG_TYPE_ERROR, "%s Failed to load image size from data: %{public}@, %lu bytes", (uint8_t *)&v16, 0x20u);
      }
      double v10 = *MEMORY[0x263F001B0];
      double v11 = *(double *)(MEMORY[0x263F001B0] + 8);
      id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F0F768] code:6003 userInfo:0];
      ((void (*)(void (**)(id, void), void *, double, double))v6[2])(v6, v12, v10, v11);
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end