@interface NTKCUltraCubeFaceDetailViewController
- (BOOL)_isShareButtonEnabled;
- (NTKCFaceDetailUltraCubeSectionController)ultracubeSection;
- (id)_sectionForEditOptionCollection:(id)a3;
- (id)reasonFaceCanNotBeAddedToLibrary;
- (void)_addFace;
- (void)_reloadVisibleCellsForEditMode:(int64_t)a3;
- (void)setUltracubeSection:(id)a3;
- (void)ultracubeSectionDidUpdate:(id)a3;
@end

@implementation NTKCUltraCubeFaceDetailViewController

- (id)_sectionForEditOptionCollection:(id)a3
{
  id v4 = a3;
  v5 = [(NTKCUltraCubeFaceDetailViewController *)self face];
  id v6 = [(NTKCUltraCubeFaceDetailViewController *)self inGallery];
  v7 = [(NTKCUltraCubeFaceDetailViewController *)self faceVC];
  v8 = [v7 faceView];
  if (+[NTKCFaceDetailUltraCubeSectionController hasUltraCubeSectionForFace:forEditMode:](NTKCFaceDetailUltraCubeSectionController, "hasUltraCubeSectionForFace:forEditMode:", v5, [v4 mode]))
  {
    v9 = [(NTKCUltraCubeFaceDetailViewController *)self externalAssets];
    v10 = [[NTKCFaceDetailUltraCubeSectionController alloc] initWithTableViewController:self face:v5 inGallery:v6 editOptionCollection:v4 faceView:v8 externalAssets:v9];
    ultracubeSection = self->_ultracubeSection;
    self->_ultracubeSection = v10;

    [(NTKCFaceDetailUltraCubeSectionController *)self->_ultracubeSection setParentViewController:self];
    [(NTKCFaceDetailUltraCubeSectionController *)self->_ultracubeSection setDelegate:self];
    v12 = self->_ultracubeSection;
  }
  else if (+[NTKCFaceDetailUltraCubeStyleSectionController hasSectionForFace:forEditMode:](NTKCFaceDetailUltraCubeStyleSectionController, "hasSectionForFace:forEditMode:", v5, [v4 mode]))
  {
    v12 = [[NTKCFaceDetailUltraCubeStyleSectionController alloc] initWithTableViewController:self face:v5 inGallery:v6 editOptionCollection:v4 faceView:v8];
    [(NTKCFaceDetailUltraCubeSectionController *)v12 setDelegate:self];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)NTKCUltraCubeFaceDetailViewController;
    v12 = [(NTKCUltraCubeFaceDetailViewController *)&v14 _sectionForEditOptionCollection:v4];
  }

  return v12;
}

- (void)_addFace
{
  if ([(NTKCFaceDetailUltraCubeSectionController *)self->_ultracubeSection hasChanges])
  {
    v3 = [(NTKCUltraCubeFaceDetailViewController *)self addSpinner];
    [v3 startAnimating];
    id v4 = [(NTKCUltraCubeFaceDetailViewController *)self addButton];
    [v4 setHidden:1];
    ultracubeSection = self->_ultracubeSection;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_19CC4;
    v7[3] = &unk_49128;
    v7[4] = self;
    [(NTKCFaceDetailUltraCubeSectionController *)ultracubeSection saveChangesWithCompletion:v7];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NTKCUltraCubeFaceDetailViewController;
    [(NTKCUltraCubeFaceDetailViewController *)&v6 _addFace];
  }
}

- (id)reasonFaceCanNotBeAddedToLibrary
{
  if ([(NTKCFaceDetailUltraCubeSectionController *)self->_ultracubeSection canAddFace])
  {
    v5.receiver = self;
    v5.super_class = (Class)NTKCUltraCubeFaceDetailViewController;
    v3 = [(NTKCUltraCubeFaceDetailViewController *)&v5 reasonFaceCanNotBeAddedToLibrary];
  }
  else
  {
    v3 = NTKClockFaceLocalizedString();
  }

  return v3;
}

- (BOOL)_isShareButtonEnabled
{
  v3 = [(NTKCUltraCubeFaceDetailViewController *)self face];
  id v4 = [v3 resourceDirectory];
  objc_super v5 = +[NTKUltraCubePhotosReader readerForResourceDirectory:v4];

  if ([v5 count])
  {
    objc_super v6 = [(NTKCUltraCubeFaceDetailViewController *)self face];
    unsigned __int8 v7 = [v6 isValidConfigurationToAddToLibrary];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)ultracubeSectionDidUpdate:(id)a3
{
  id v4 = a3;
  [(NTKCUltraCubeFaceDetailViewController *)self _updateAddButton];
  [(NTKCUltraCubeFaceDetailViewController *)self _updateShareButton];
  objc_super v5 = [(NTKCUltraCubeFaceDetailViewController *)self face];
  unsigned __int8 v6 = [v5 hasSampleResourceDirectory];

  unsigned __int8 v7 = [v4 ultracubePhotosEditor];

  id v8 = [v7 photosCount];
  if ((v6 & 1) == 0 && (uint64_t)v8 >= 1)
  {
    v9 = [(NTKCUltraCubeFaceDetailViewController *)self faceVC];
    v10 = [v9 faceView];
    v11 = [(NTKCUltraCubeFaceDetailViewController *)self face];
    v12 = [v11 selectedOptionsForCustomEditModes];
    [v10 prepareSwatchImagesForSelectedOptions:v12];

    [(NTKCUltraCubeFaceDetailViewController *)self _reloadVisibleCellsForEditMode:13];
    [(NTKCUltraCubeFaceDetailViewController *)self _reloadVisibleCellsForEditMode:15];
  }
}

- (void)_reloadVisibleCellsForEditMode:(int64_t)a3
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v4 = [(NTKCUltraCubeFaceDetailViewController *)self editOptionSections];
  id v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v10 = [v9 collection];
        id v11 = [v10 mode];

        if (v11 == (id)a3)
        {
          id v12 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v13 = objc_msgSend(v12, "rows", 0);
  id v14 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v19 + 1) + 8 * (void)j);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v18 reloadVisibleCells];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v15);
  }
}

- (NTKCFaceDetailUltraCubeSectionController)ultracubeSection
{
  return self->_ultracubeSection;
}

- (void)setUltracubeSection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end