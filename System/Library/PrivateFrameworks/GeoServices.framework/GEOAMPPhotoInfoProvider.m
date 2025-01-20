@interface GEOAMPPhotoInfoProvider
- (GEOAMPPhotoInfoProvider)initWithPhotoContent:(id)a3;
- (double)sizeRatio;
- (id)bestPhotoForSize:(CGSize)a3 options:(id)a4;
- (id)largestPhoto;
- (int)designatedURLType;
@end

@implementation GEOAMPPhotoInfoProvider

- (id)bestPhotoForSize:(CGSize)a3 options:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v8 = a4;
  v10 = v8;
  templatePhotoContent = self->_templatePhotoContent;
  if (!templatePhotoContent)
  {
    if (width > 0.0)
    {
      unsigned int v12 = 0;
      goto LABEL_4;
    }
LABEL_9:
    [v8 allowSmaller];
    goto LABEL_10;
  }
  LODWORD(v9) = templatePhotoContent->_width;
  if (width <= (double)v9) {
    goto LABEL_9;
  }
  unsigned int v12 = templatePhotoContent->_height;
LABEL_4:
  if (([v8 allowSmaller] & 1) == 0 && height > (double)v12)
  {
    v13 = 0;
    goto LABEL_45;
  }
LABEL_10:
  switch([v10 preferredCropStyle])
  {
    case 0:
      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x2020000000;
      v14 = &qword_1EB2A0000;
      v15 = (id *)_MergedGlobals_332;
      uint64_t v42 = _MergedGlobals_332;
      if (_MergedGlobals_332) {
        goto LABEL_22;
      }
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      v36 = __getAMSMediaArtworkCropStyleBoundedBoxSymbolLoc_block_invoke;
      v37 = &unk_1E53DB3C8;
      v38 = &v39;
      v16 = (void *)AppleMediaServicesLibrary();
      v40[3] = (uint64_t)dlsym(v16, "AMSMediaArtworkCropStyleBoundedBox");
      _MergedGlobals_332 = *(void *)(v38[1] + 24);
      break;
    case 1:
      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x2020000000;
      v14 = &qword_1EB2A0000;
      v15 = (id *)qword_1EB2A0710;
      uint64_t v42 = qword_1EB2A0710;
      if (qword_1EB2A0710) {
        goto LABEL_22;
      }
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      v36 = __getAMSMediaArtworkCropStyleConstrainedHeightSymbolLoc_block_invoke;
      v37 = &unk_1E53DB3C8;
      v38 = &v39;
      v20 = (void *)AppleMediaServicesLibrary();
      v40[3] = (uint64_t)dlsym(v20, "AMSMediaArtworkCropStyleConstrainedHeight");
      qword_1EB2A0710 = *(void *)(v38[1] + 24);
      break;
    case 2:
      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x2020000000;
      v14 = &qword_1EB2A0000;
      v15 = (id *)qword_1EB2A0718;
      uint64_t v42 = qword_1EB2A0718;
      if (qword_1EB2A0718) {
        goto LABEL_22;
      }
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      v36 = __getAMSMediaArtworkCropStyleConstrainedWidthSymbolLoc_block_invoke;
      v37 = &unk_1E53DB3C8;
      v38 = &v39;
      v17 = (void *)AppleMediaServicesLibrary();
      v40[3] = (uint64_t)dlsym(v17, "AMSMediaArtworkCropStyleConstrainedWidth");
      qword_1EB2A0718 = *(void *)(v38[1] + 24);
      break;
    case 3:
      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x2020000000;
      v14 = &qword_1EB2A0000;
      v15 = (id *)qword_1EB2A0720;
      uint64_t v42 = qword_1EB2A0720;
      if (qword_1EB2A0720) {
        goto LABEL_22;
      }
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      v36 = __getAMSMediaArtworkCropStyleSquareCenterCropSymbolLoc_block_invoke;
      v37 = &unk_1E53DB3C8;
      v38 = &v39;
      v18 = (void *)AppleMediaServicesLibrary();
      v40[3] = (uint64_t)dlsym(v18, "AMSMediaArtworkCropStyleSquareCenterCrop");
      qword_1EB2A0720 = *(void *)(v38[1] + 24);
      break;
    case 4:
      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x2020000000;
      v14 = &qword_1EB2A0000;
      v15 = (id *)qword_1EB2A0728;
      uint64_t v42 = qword_1EB2A0728;
      if (qword_1EB2A0728) {
        goto LABEL_22;
      }
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      v36 = __getAMSMediaArtworkCropStyleSpecificRectangleSymbolLoc_block_invoke;
      v37 = &unk_1E53DB3C8;
      v38 = &v39;
      v19 = (void *)AppleMediaServicesLibrary();
      v40[3] = (uint64_t)dlsym(v19, "AMSMediaArtworkCropStyleSpecificRectangle");
      qword_1EB2A0728 = *(void *)(v38[1] + 24);
      break;
    case 5:
      getAMSMediaArtworkCropStyleSourceSize();
      v21 = (uint64_t *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    default:
      goto LABEL_48;
  }
  v15 = (id *)v40[3];
LABEL_22:
  _Block_object_dispose(&v39, 8);
  if (!v15) {
    goto LABEL_52;
  }
  v21 = (uint64_t *)*v15;
LABEL_24:
  v14 = v21;
  if (!v21)
  {
LABEL_48:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: ampCropStyle != ((void *)0)", buf, 2u);
    }
    getAMSMediaArtworkCropStyleSourceSize();
    v14 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v22 = [v10 preferredFormat];
  switch(v22)
  {
    case 2:
      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x2020000000;
      v15 = (id *)&qword_1EB2A0000;
      v4 = (id *)qword_1EB2A0738;
      uint64_t v42 = qword_1EB2A0738;
      if (qword_1EB2A0738) {
        goto LABEL_34;
      }
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      v36 = __getAMSMediaArtworkFormatPNGSymbolLoc_block_invoke;
      v37 = &unk_1E53DB3C8;
      v38 = &v39;
      v24 = (void *)AppleMediaServicesLibrary();
      v25 = dlsym(v24, "AMSMediaArtworkFormatPNG");
      *(void *)(v38[1] + 24) = v25;
      qword_1EB2A0738 = *(void *)(v38[1] + 24);
      goto LABEL_33;
    case 1:
      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x2020000000;
      v15 = (id *)&qword_1EB2A0000;
      v4 = (id *)qword_1EB2A0730;
      uint64_t v42 = qword_1EB2A0730;
      if (qword_1EB2A0730) {
        goto LABEL_34;
      }
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v35 = 3221225472;
      v36 = __getAMSMediaArtworkFormatJPGSymbolLoc_block_invoke;
      v37 = &unk_1E53DB3C8;
      v38 = &v39;
      v26 = (void *)AppleMediaServicesLibrary();
      v27 = dlsym(v26, "AMSMediaArtworkFormatJPG");
      *(void *)(v38[1] + 24) = v27;
      qword_1EB2A0730 = *(void *)(v38[1] + 24);
LABEL_33:
      v4 = (id *)v40[3];
LABEL_34:
      _Block_object_dispose(&v39, 8);
      if (v4)
      {
        v23 = (id *)*v4;
LABEL_36:
        v15 = v23;
        if (v23) {
          goto LABEL_40;
        }
        break;
      }
LABEL_52:
      dlerror();
      abort_report_np();
      goto LABEL_53;
    case 0:
      getAMSMediaArtworkFormatHEIC();
      v23 = (id *)objc_claimAutoreleasedReturnValue();
      goto LABEL_36;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: ampFormat != ((void *)0)", buf, 2u);
  }
  getAMSMediaArtworkFormatHEIC();
  v15 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_40:
  -[AMSMediaArtwork URLWithSize:cropStyle:format:](self->_artwork, "URLWithSize:cropStyle:format:", v14, v15, width, height);
  v4 = (id *)objc_claimAutoreleasedReturnValue();
  v30 = self->_templatePhotoContent;
  if (!v30)
  {
LABEL_53:
    double v31 = 0.0;
    double v32 = 0.0;
    goto LABEL_42;
  }
  LODWORD(v28) = v30->_width;
  double v31 = (double)v28;
  LODWORD(v29) = v30->_height;
  double v32 = (double)v29;
LABEL_42:
  if (width > v31 && height > v32)
  {
    double width = v31;
    double height = v32;
  }
  v13 = [[_GEOPlaceDataPhotoInfo alloc] initWithURL:v4 width:width height:height];

LABEL_45:

  return v13;
}

- (GEOAMPPhotoInfoProvider)initWithPhotoContent:(id)a3
{
  v31[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (AppleMediaServicesLibraryCore())
  {
    int v5 = [(GEOAMPPhotoInfoProvider *)self designatedURLType];
    v6 = (void *)MEMORY[0x1E4F28F60];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = ___photoContentForURLType_block_invoke;
    v28[3] = &__block_descriptor_36_e44_B24__0__GEOPDPhotoContent_8__NSDictionary_16l;
    int v29 = v5;
    id v7 = v4;
    id v8 = [v6 predicateWithBlock:v28];
    unint64_t v9 = [v7 filteredArrayUsingPredicate:v8];

    if ([v9 count])
    {
      v27.receiver = self;
      v27.super_class = (Class)GEOAMPPhotoInfoProvider;
      self = [(GEOAMPPhotoInfoProvider *)&v27 init];
      if (!self)
      {
LABEL_11:
        self = self;
        v25 = self;
LABEL_15:

        goto LABEL_16;
      }
      v10 = [v9 firstObject];
      templatePhotoContent = self->_templatePhotoContent;
      self->_templatePhotoContent = v10;

      unsigned int v12 = -[GEOPDPhotoContent url]((id *)&self->_templatePhotoContent->super.super.isa);
      if ([v12 length])
      {
        [(GEOAMPPhotoInfoProvider *)self sizeRatio];
        double v14 = v13;

        if (v14 != 0.0)
        {
          v30[0] = @"url";
          v15 = -[GEOPDPhotoContent url]((id *)&self->_templatePhotoContent->super.super.isa);
          v31[0] = v15;
          v30[1] = @"width";
          v16 = self->_templatePhotoContent;
          if (v16) {
            uint64_t width = v16->_width;
          }
          else {
            uint64_t width = 0;
          }
          v18 = [NSNumber numberWithUnsignedInt:width];
          v31[1] = v18;
          v30[2] = @"height";
          v19 = self->_templatePhotoContent;
          if (v19) {
            uint64_t height = v19->_height;
          }
          else {
            uint64_t height = 0;
          }
          v21 = [NSNumber numberWithUnsignedInt:height];
          v31[2] = v21;
          uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];

          v23 = (AMSMediaArtwork *)[objc_alloc((Class)getAMSMediaArtworkClass()) initWithDictionary:v22];
          artwork = self->_artwork;
          self->_artwork = v23;

          goto LABEL_11;
        }
      }
      else
      {
      }
    }
    v25 = 0;
    goto LABEL_15;
  }
  v25 = 0;
LABEL_16:

  return v25;
}

- (int)designatedURLType
{
  return 1;
}

- (double)sizeRatio
{
  templatePhotoContent = self->_templatePhotoContent;
  double result = 0.0;
  if (templatePhotoContent)
  {
    unsigned int height = templatePhotoContent->_height;
    if (height)
    {
      LODWORD(result) = templatePhotoContent->_width;
      return (double)*(unint64_t *)&result / (double)height;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templatePhotoContent, 0);

  objc_storeStrong((id *)&self->_artwork, 0);
}

- (id)largestPhoto
{
  templatePhotoContent = self->_templatePhotoContent;
  if (templatePhotoContent)
  {
    LODWORD(v2) = templatePhotoContent->_width;
    double v5 = (double)v2;
    LODWORD(v2) = templatePhotoContent->_height;
    double v6 = (double)v2;
  }
  else
  {
    double v5 = 0.0;
    double v6 = 0.0;
  }
  id v7 = +[GEOMapItemPhotoOptions defaultPhotoOptionsWithAllowSmaller:1];
  id v8 = -[GEOAMPPhotoInfoProvider bestPhotoForSize:options:](self, "bestPhotoForSize:options:", v7, v5, v6);

  return v8;
}

@end