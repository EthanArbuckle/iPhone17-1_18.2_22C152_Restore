@interface NTKCFaceDetailUltraCubeSectionController
+ (BOOL)hasUltraCubeSectionForFace:(id)a3 forEditMode:(int64_t)a4;
- (BOOL)_handleDidSelectActionRowForOption:(id)a3;
- (BOOL)canAddFace;
- (BOOL)hasChanges;
- (Class)actionRowCellClass;
- (NSArray)externalAssets;
- (NTKCFaceDetailUltraCubeSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7 externalAssets:(id)a8;
- (NTKCompanionUltraCubePhotosEditor)ultracubePhotosEditor;
- (UIViewController)parentViewController;
- (id)_actionNameForOption:(id)a3;
- (void)_customizeActionRow:(id)a3 withEditOption:(id)a4;
- (void)_setPhotos:(id)a3;
- (void)_updateUltraCubeSection;
- (void)customUltraCubeControllerDidFinish:(id)a3;
- (void)faceDidChange;
- (void)faceDidChangeResourceDirectory;
- (void)saveChangesWithCompletion:(id)a3;
- (void)setExternalAssets:(id)a3;
- (void)setParentViewController:(id)a3;
- (void)setSelectedOptions:(id)a3;
- (void)setUltracubePhotosEditor:(id)a3;
@end

@implementation NTKCFaceDetailUltraCubeSectionController

+ (BOOL)hasUltraCubeSectionForFace:(id)a3 forEditMode:(int64_t)a4
{
  id v5 = a3;
  v6 = +[NTKUltraCubeFaceBundle identifier];
  v7 = [v5 bundleIdentifier];

  unsigned __int8 v8 = [v7 isEqualToString:v6];
  if (a4 == 12) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (NTKCFaceDetailUltraCubeSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7 externalAssets:(id)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v18)
  {
    id v19 = [v16 filteredCollectionWithObjectsPassingTest:&stru_494D0];
  }
  else
  {
    id v19 = v16;
  }
  v20 = v19;
  v24.receiver = self;
  v24.super_class = (Class)NTKCFaceDetailUltraCubeSectionController;
  v21 = [(NTKCFaceDetailUltraCubeSectionController *)&v24 initWithTableViewController:v14 face:v15 inGallery:v11 editOptionCollection:v19 faceView:v17];
  v22 = v21;
  if (v21) {
    [(NTKCFaceDetailUltraCubeSectionController *)v21 setExternalAssets:v18];
  }

  return v22;
}

- (Class)actionRowCellClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canAddFace
{
  v3 = [(NTKCFaceDetailUltraCubeSectionController *)self selectedOptions];
  v4 = [(NTKCFaceDetailUltraCubeSectionController *)self collection];
  id v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 mode]);
  v6 = [v3 objectForKeyedSubscript:v5];

  if ([v6 ultracubeContent])
  {
    BOOL v7 = 0;
  }
  else
  {
    unsigned __int8 v8 = [(NTKCFaceDetailUltraCubeSectionController *)self face];
    unsigned __int8 v9 = [v8 hasSampleResourceDirectory];

    BOOL v7 = ([(NTKCompanionUltraCubePhotosEditor *)self->_ultracubePhotosEditor photosCount] != 0) & ~v9;
  }

  return v7;
}

- (void)faceDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCFaceDetailUltraCubeSectionController;
  [(NTKCFaceDetailUltraCubeSectionController *)&v3 faceDidChange];
  [(NTKCFaceDetailUltraCubeSectionController *)self _updateUltraCubeSection];
}

- (void)faceDidChangeResourceDirectory
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCFaceDetailUltraCubeSectionController;
  [(NTKCFaceDetailUltraCubeSectionController *)&v3 faceDidChangeResourceDirectory];
  [(NTKCFaceDetailUltraCubeSectionController *)self _updateUltraCubeSection];
}

- (void)setSelectedOptions:(id)a3
{
  v56.receiver = self;
  v56.super_class = (Class)NTKCFaceDetailUltraCubeSectionController;
  id v4 = a3;
  [(NTKCFaceDetailUltraCubeSectionController *)&v56 setSelectedOptions:v4];
  ultracubePhotosEditor = self->_ultracubePhotosEditor;
  v6 = [(NTKCFaceDetailUltraCubeSectionController *)self collection];
  BOOL v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 mode]);
  unsigned __int8 v8 = [v4 objectForKeyedSubscript:v7];

  if (!ultracubePhotosEditor
    || (id currentContent = self->_currentContent, currentContent != [v8 ultracubeContent]))
  {
    id v10 = [v8 ultracubeContent];
    self->_id currentContent = (unint64_t)v10;
    if (v10)
    {
LABEL_4:
      [(NTKCFaceDetailUltraCubeSectionController *)self reloadActionRow];
      goto LABEL_5;
    }
    BOOL v11 = +[NTKUltraCubeFaceBundle localizedStringForKey:@"EDIT_MODE_LABEL_CONTENT_OPTION_DESCRIPTION" comment:@"Choose xx photos"];
    [(NTKCFaceDetailUltraCubeSectionController *)self setFooter:v11];

    if (!ultracubePhotosEditor)
    {
      externalAssets = self->_externalAssets;
      if (externalAssets
        && ([(NSArray *)externalAssets firstObject],
            v23 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char isKindOfClass = objc_opt_isKindOfClass(),
            v23,
            (isKindOfClass & 1) != 0))
      {
        v25 = [NTKCompanionUltraCubePhotosEditor alloc];
        v26 = [(NTKCFaceDetailUltraCubeSectionController *)self face];
        v27 = [v26 device];
        v28 = [(NTKCompanionUltraCubePhotosEditor *)v25 initWithResourceDirectory:0 forDevice:v27];
        v29 = self->_ultracubePhotosEditor;
        self->_ultracubePhotosEditor = v28;

        [(NTKCompanionUltraCubePhotosEditor *)self->_ultracubePhotosEditor addAssetsFromAssetList:self->_externalAssets];
        v30 = self->_ultracubePhotosEditor;
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_28DBC;
        v55[3] = &unk_494F8;
        v55[4] = self;
        [(NTKCompanionUltraCubePhotosEditor *)v30 generateGalleryPreviewResourceDirectoryWithCompletion:v55];
      }
      else
      {
        v37 = [(NTKCFaceDetailUltraCubeSectionController *)self face];
        v38 = [v37 resourceDirectory];

        v39 = [(NTKCFaceDetailUltraCubeSectionController *)self face];
        unsigned int v40 = [v39 hasSampleResourceDirectory];

        if (v40)
        {
          v41 = _NTKLoggingObjectForDomain();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            v42 = [(NTKCFaceDetailUltraCubeSectionController *)self face];
            *(_DWORD *)buf = 138412290;
            v58 = v42;
            _os_log_impl(&dword_0, v41, OS_LOG_TYPE_DEFAULT, "setSelectedOptions: face %@ has sample resource directory; switching to nil for directory editor",
              buf,
              0xCu);
          }
          v43 = [(NTKCFaceDetailUltraCubeSectionController *)self face];
          v44 = [v43 resourceDirectory];
          savedGalleryResourceDirectory = self->_savedGalleryResourceDirectory;
          self->_savedGalleryResourceDirectory = v44;

          v38 = 0;
        }
        v46 = [NTKCompanionUltraCubePhotosEditor alloc];
        v47 = [(NTKCFaceDetailUltraCubeSectionController *)self face];
        v48 = [v47 device];
        v49 = [(NTKCompanionUltraCubePhotosEditor *)v46 initWithResourceDirectory:v38 forDevice:v48];
        v50 = self->_ultracubePhotosEditor;
        self->_ultracubePhotosEditor = v49;
      }
      goto LABEL_4;
    }
    unsigned int v12 = [(NTKCFaceDetailUltraCubeSectionController *)self inGallery];
    v13 = self->_ultracubePhotosEditor;
    if (v12)
    {
      if (!v13)
      {
        id v14 = [NTKCompanionUltraCubePhotosEditor alloc];
        id v15 = [(NTKCFaceDetailUltraCubeSectionController *)self face];
        id v16 = [v15 device];
        id v17 = [(NTKCompanionUltraCubePhotosEditor *)v14 initWithResourceDirectory:0 forDevice:v16];
        id v18 = self->_ultracubePhotosEditor;
        self->_ultracubePhotosEditor = v17;

        v13 = self->_ultracubePhotosEditor;
      }
      id v19 = [(NTKCompanionUltraCubePhotosEditor *)v13 galleryPreviewResourceDirectory];

      v20 = self->_ultracubePhotosEditor;
      if (v19)
      {
        uint64_t v21 = [(NTKCompanionUltraCubePhotosEditor *)v20 galleryPreviewResourceDirectory];
      }
      else
      {
        v51 = [(NTKCompanionUltraCubePhotosEditor *)v20 resourceDirectory];

        v52 = self->_ultracubePhotosEditor;
        if (!v51)
        {
          v54[0] = _NSConcreteStackBlock;
          v54[1] = 3221225472;
          v54[2] = sub_28E1C;
          v54[3] = &unk_494F8;
          v54[4] = self;
          [(NTKCompanionUltraCubePhotosEditor *)v52 generateGalleryPreviewResourceDirectoryWithCompletion:v54];
LABEL_27:
          if (![(NTKCompanionUltraCubePhotosEditor *)self->_ultracubePhotosEditor photosCount]) {
            [(NTKCFaceDetailUltraCubeSectionController *)self _handleDidSelectActionRowForOption:v8];
          }
          goto LABEL_4;
        }
        uint64_t v21 = [(NTKCompanionUltraCubePhotosEditor *)v52 resourceDirectory];
      }
      v36 = (void *)v21;
      v53 = [(NTKCFaceDetailUltraCubeSectionController *)self face];
      [v53 setResourceDirectory:v36];
    }
    else
    {
      if (!v13)
      {
        v31 = [NTKCompanionUltraCubePhotosEditor alloc];
        v32 = [(NTKCFaceDetailUltraCubeSectionController *)self face];
        v33 = [v32 device];
        v34 = [(NTKCompanionUltraCubePhotosEditor *)v31 initWithResourceDirectory:0 forDevice:v33];
        v35 = self->_ultracubePhotosEditor;
        self->_ultracubePhotosEditor = v34;
      }
      v36 = [(NTKCFaceDetailUltraCubeSectionController *)self face];
      [v36 setResourceDirectory:0];
    }

    goto LABEL_27;
  }
LABEL_5:
}

- (BOOL)_handleDidSelectActionRowForOption:(id)a3
{
  id v4 = [a3 ultracubeContent];
  if (!v4)
  {
    if ([(NTKCompanionUltraCubePhotosEditor *)self->_ultracubePhotosEditor photosCount])
    {
      id v5 = [NTKCUltraCubePhotoListViewController alloc];
      ultracubePhotosEditor = self->_ultracubePhotosEditor;
      BOOL v7 = [(NTKCFaceDetailUltraCubeSectionController *)self face];
      id v8 = [(NTKCFaceDetailUltraCubeSectionController *)self inGallery];
      unsigned __int8 v9 = [(NTKCFaceDetailUltraCubeSectionController *)self faceView];
      id v10 = [(NTKCUltraCubePhotoListViewController *)v5 initWithUltraCubePhotosEditor:ultracubePhotosEditor forFace:v7 inGallery:v8 faceView:v9];

      [(NTKCUltraCubePhotoListViewController *)v10 setDelegate:self];
      BOOL v11 = [(NTKCFaceDetailUltraCubeSectionController *)self parentViewController];
      [v11 presentViewController:v10 animated:1 completion:0];
    }
    else
    {
      id v10 = +[NTKCPhotosAddController ultraCubeConfigurationWithLimit:24];
      unsigned int v12 = [(NTKCFaceDetailUltraCubeSectionController *)self parentViewController];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_290E8;
      v14[3] = &unk_48EB0;
      v14[4] = self;
      +[NTKCPhotosAddController presentPhotosAddControllerFromViewController:v12 configuration:v10 withCompletion:v14];
    }
  }
  return v4 != 0;
}

- (id)_actionNameForOption:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 ultracubeContent])
    {
      v6 = 0;
    }
    else
    {
      int64_t v7 = [(NTKCompanionUltraCubePhotosEditor *)self->_ultracubePhotosEditor photosCount];
      if (v7)
      {
        int64_t v8 = v7;
        unsigned __int8 v9 = NTKCCustomizationLocalizedFormat();
        v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v8);
      }
      else
      {
        v11.receiver = self;
        v11.super_class = (Class)NTKCFaceDetailUltraCubeSectionController;
        v6 = [(NTKCFaceDetailUltraCubeSectionController *)&v11 _actionNameForOption:v5];
      }
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NTKCFaceDetailUltraCubeSectionController;
    v6 = [(NTKCFaceDetailUltraCubeSectionController *)&v12 _actionNameForOption:v4];
  }

  return v6;
}

- (void)_customizeActionRow:(id)a3 withEditOption:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v7 = [(NTKCFaceDetailUltraCubeSectionController *)self _actionNameForOption:v6];
    int64_t v8 = [v12 textLabel];
    [v8 setText:v7];

    if ([(NTKCompanionUltraCubePhotosEditor *)self->_ultracubePhotosEditor photosCount])
    {
      unsigned __int8 v9 = +[UIColor secondaryLabelColor];
      uint64_t v10 = 1;
    }
    else
    {
      unsigned __int8 v9 = NTKCActionColor();
      uint64_t v10 = 0;
    }
    objc_super v11 = [v12 textLabel];
    [v11 setTextColor:v9];

    [v12 setAccessoryType:v10];
  }
}

- (void)_setPhotos:(id)a3
{
  [(NTKCompanionUltraCubePhotosEditor *)self->_ultracubePhotosEditor addPhotosFromUIImagePicker:a3];
  [(NTKCFaceDetailUltraCubeSectionController *)self _updateUltraCubeSection];
  if ([(NTKCFaceDetailUltraCubeSectionController *)self inGallery])
  {
    ultracubePhotosEditor = self->_ultracubePhotosEditor;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_29424;
    v5[3] = &unk_494F8;
    v5[4] = self;
    [(NTKCompanionUltraCubePhotosEditor *)ultracubePhotosEditor generateGalleryPreviewResourceDirectoryWithCompletion:v5];
  }
  else
  {
    [(NTKCFaceDetailUltraCubeSectionController *)self saveChangesWithCompletion:0];
  }
}

- (void)_updateUltraCubeSection
{
  if (!self->_currentContent)
  {
    objc_super v3 = [(NTKCFaceDetailUltraCubeSectionController *)self actionRow];

    if (v3)
    {
      if (self->_externalAssets
        && ![(NTKCompanionUltraCubePhotosEditor *)self->_ultracubePhotosEditor photosCount])
      {
        [(NTKCFaceDetailUltraCubeSectionController *)self reloadActionRow];
      }
      else
      {
        [(NTKCFaceDetailUltraCubeSectionController *)self _refreshActionRowContent];
      }
    }
  }
  id v4 = [(NTKCFaceDetailUltraCubeSectionController *)self delegate];
  [v4 ultracubeSectionDidUpdate:self];
}

- (BOOL)hasChanges
{
  return [(NTKCompanionUltraCubePhotosEditor *)self->_ultracubePhotosEditor state] == (char *)&dword_0 + 2;
}

- (void)saveChangesWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(NTKCFaceDetailUltraCubeSectionController *)self hasChanges]
    && (ultracubePhotosEditor = self->_ultracubePhotosEditor) != 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_29790;
    v6[3] = &unk_49520;
    v6[4] = self;
    int64_t v7 = v4;
    [(NTKCompanionUltraCubePhotosEditor *)ultracubePhotosEditor finalizeWithCompletion:v6];
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

- (void)customUltraCubeControllerDidFinish:(id)a3
{
  id v4 = a3;
  [(NTKCFaceDetailUltraCubeSectionController *)self _updateUltraCubeSection];
  if (![(NTKCompanionUltraCubePhotosEditor *)self->_ultracubePhotosEditor photosCount])
  {
    savedGalleryResourceDirectory = self->_savedGalleryResourceDirectory;
    if (savedGalleryResourceDirectory)
    {
      id v6 = [(NTKCFaceDetailUltraCubeSectionController *)self face];
      [v6 setResourceDirectory:savedGalleryResourceDirectory];

      int64_t v7 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v8 = self->_savedGalleryResourceDirectory;
        int v9 = 138412290;
        uint64_t v10 = v8;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "customUltraCubeControllerDidFinish: empty editor; resetting the resource directory back to the saved gallery version (%@)",
          (uint8_t *)&v9,
          0xCu);
      }
    }
  }
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (UIViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (NTKCompanionUltraCubePhotosEditor)ultracubePhotosEditor
{
  return self->_ultracubePhotosEditor;
}

- (void)setUltracubePhotosEditor:(id)a3
{
}

- (NSArray)externalAssets
{
  return self->_externalAssets;
}

- (void)setExternalAssets:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalAssets, 0);
  objc_storeStrong((id *)&self->_ultracubePhotosEditor, 0);
  objc_destroyWeak((id *)&self->_parentViewController);

  objc_storeStrong((id *)&self->_savedGalleryResourceDirectory, 0);
}

@end