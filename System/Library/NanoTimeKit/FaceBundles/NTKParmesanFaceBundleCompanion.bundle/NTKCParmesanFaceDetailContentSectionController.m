@interface NTKCParmesanFaceDetailContentSectionController
- (BOOL)_dynamicEditorHasSelection;
- (BOOL)_handleDidSelectOption:(id)a3;
- (BOOL)_manualEditorHasPhotos;
- (BOOL)canAddFace;
- (BOOL)hasChanges;
- (NSArray)externalAssets;
- (NTKCParmesanAlbumEditor)albumEditor;
- (NTKCParmesanAlbumEditor)albumPhotosEditor;
- (NTKCParmesanFaceDetailContentSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7 externalAssets:(id)a8;
- (NTKCParmesanPhotosEditor)parmesanPhotosEditor;
- (NTKParmesanImageEditor)imageEditor;
- (UIViewController)parentViewController;
- (id)_currentEditor;
- (id)_previewNavigationControllerForCurrentEditor;
- (id)cellForEditOption:(id)a3;
- (void)_reloadEditOptionCellContent;
- (void)_setContentForCell:(id)a3 withEditOption:(id)a4;
- (void)_setPhotos:(id)a3;
- (void)_updateSection;
- (void)didSelectRow:(int64_t)a3;
- (void)faceDidChange;
- (void)faceDidChangeResourceDirectory;
- (void)saveChangesWithCompletion:(id)a3;
- (void)setAlbumPhotosEditor:(id)a3;
- (void)setExternalAssets:(id)a3;
- (void)setImageEditor:(id)a3;
- (void)setParentViewController:(id)a3;
- (void)setParmesanPhotosEditor:(id)a3;
- (void)setSelectedOptions:(id)a3;
- (void)shuffleSelectionViewController:(id)a3 didFinishWithSelection:(id)a4;
@end

@implementation NTKCParmesanFaceDetailContentSectionController

- (NTKCParmesanFaceDetailContentSectionController)initWithTableViewController:(id)a3 face:(id)a4 inGallery:(BOOL)a5 editOptionCollection:(id)a6 faceView:(id)a7 externalAssets:(id)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v20 = a8;
  if (v20)
  {
    objc_msgSend_filteredCollectionWithObjectsPassingTest_(v16, v18, (uint64_t)&unk_26FB1C160, v19);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v21 = v16;
  }
  v22 = v21;
  v28.receiver = self;
  v28.super_class = (Class)NTKCParmesanFaceDetailContentSectionController;
  v23 = [(NTKCFaceDetailEditOptionVerticalSectionController *)&v28 initWithTableViewController:v14 face:v15 inGallery:v11 editOptionCollection:v21 faceView:v17];
  v26 = v23;
  if (v23) {
    objc_msgSend_setExternalAssets_(v23, v24, (uint64_t)v20, v25);
  }

  return v26;
}

- (BOOL)canAddFace
{
  v5 = objc_msgSend_selectedOptions(self, a2, v2, v3);
  v6 = NSNumber;
  v10 = objc_msgSend_collection(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_mode(v10, v11, v12, v13);
  id v17 = objc_msgSend_numberWithInteger_(v6, v15, v14, v16);
  id v20 = objc_msgSend_objectForKeyedSubscript_(v5, v18, (uint64_t)v17, v19);

  uint64_t v24 = objc_msgSend_content(v20, v21, v22, v23);
  if (v24)
  {
    if (v24 != 1)
    {
      BOOL v29 = 0;
      goto LABEL_7;
    }
    char HasPhotos = objc_msgSend__manualEditorHasPhotos(self, v25, v26, v27);
  }
  else
  {
    char HasPhotos = objc_msgSend__dynamicEditorHasSelection(self, v25, v26, v27);
  }
  BOOL v29 = HasPhotos;
LABEL_7:

  return v29;
}

- (void)_reloadEditOptionCellContent
{
  v5 = objc_msgSend_collection(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_options(v5, v6, v7, v8);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_246B54A9C;
  v12[3] = &unk_2651FB868;
  v12[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(v9, v10, (uint64_t)v12, v11);
}

- (void)_setContentForCell:(id)a3 withEditOption:(id)a4
{
  id v43 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    unint64_t currentContent = self->_currentContent;
    uint64_t v12 = objc_msgSend_content(v7, v9, v10, v11);
    if (objc_msgSend_content(v7, v13, v14, v15) == 1)
    {
      id v17 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v16, @"PARMESAN_CONTENT_EDIT_OPTION_MANUAL", @"Manual content option");
      objc_msgSend_setTitleText_(v43, v18, (uint64_t)v17, v19);

      parmesanPhotosEditor = self->_parmesanPhotosEditor;
      if (parmesanPhotosEditor || (parmesanPhotosEditor = self->_imageEditor) != 0)
      {
        uint64_t v24 = objc_msgSend_photosCount(parmesanPhotosEditor, v20, v21, v22);
        if (v24 >= 1)
        {
          uint64_t v25 = v24;
          uint64_t v26 = NTKCCustomizationLocalizedFormat();
          BOOL v29 = objc_msgSend_stringWithFormat_(NSString, v27, (uint64_t)v26, v28, v25);
          objc_msgSend_setValueText_(v43, v30, (uint64_t)v29, v31);

LABEL_10:
          objc_msgSend_setActive_(v43, v41, currentContent == v12, v42);

          goto LABEL_11;
        }
      }
      uint64_t v38 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v20, @"PARMESAN_CONTENT_EDIT_OPTION_MANUAL_ACTION", @"Manual content action");
    }
    else
    {
      v32 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v16, @"PARMESAN_CONTENT_EDIT_OPTION_DYNAMIC", @"Dynamic content title");
      objc_msgSend_setTitleText_(v43, v33, (uint64_t)v32, v34);

      uint64_t v38 = objc_msgSend_localizedShuffleDescription(self->_albumEditor, v35, v36, v37);
    }
    uint64_t v26 = (void *)v38;
    objc_msgSend_setValueText_(v43, v39, v38, v40);
    goto LABEL_10;
  }
LABEL_11:
}

- (void)faceDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCParmesanFaceDetailContentSectionController;
  [(NTKCFaceDetailEditOptionVerticalSectionController *)&v6 faceDidChange];
  objc_msgSend__updateSection(self, v3, v4, v5);
}

- (void)faceDidChangeResourceDirectory
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCParmesanFaceDetailContentSectionController;
  [(NTKCFaceDetailSectionController *)&v6 faceDidChangeResourceDirectory];
  objc_msgSend__updateSection(self, v3, v4, v5);
}

- (id)cellForEditOption:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_alloc(MEMORY[0x263F57970]);
    uint64_t v8 = objc_msgSend_initWithEditOption_(v5, v6, (uint64_t)v4, v7);
    objc_msgSend__setContentForCell_withEditOption_(self, v9, (uint64_t)v8, (uint64_t)v4);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)NTKCParmesanFaceDetailContentSectionController;
    uint64_t v8 = [(NTKCFaceDetailEditOptionVerticalSectionController *)&v11 cellForEditOption:v4];
  }

  return v8;
}

- (void)setSelectedOptions:(id)a3
{
  v267.receiver = self;
  v267.super_class = (Class)NTKCParmesanFaceDetailContentSectionController;
  id v4 = a3;
  [(NTKCFaceDetailEditOptionVerticalSectionController *)&v267 setSelectedOptions:v4];
  p_parmesanPhotosEditor = (void **)&self->_parmesanPhotosEditor;
  BOOL v106 = *(_OWORD *)&self->_parmesanPhotosEditor == 0 && self->_imageEditor == 0;
  uint64_t v9 = NSNumber;
  uint64_t v10 = objc_msgSend_collection(self, v5, v6, v7);
  uint64_t v14 = objc_msgSend_mode(v10, v11, v12, v13);
  id v17 = objc_msgSend_numberWithInteger_(v9, v15, v14, v16);
  id v20 = objc_msgSend_objectForKeyedSubscript_(v4, v18, (uint64_t)v17, v19);

  if (v106 || (unint64_t v24 = self->_currentContent, v24 != objc_msgSend_content(v20, v21, v22, v23)))
  {
    unint64_t v25 = objc_msgSend_content(v20, v21, v22, v23);
    self->_unint64_t currentContent = v25;
    if (self->_externalAssets) {
      unint64_t v29 = 1;
    }
    else {
      unint64_t v29 = v25;
    }
    self->_unint64_t currentContent = v29;
    v30 = objc_msgSend_logObject(NTKParmesanFaceBundle, v26, v27, v28);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      sub_246C29A98(v106, (uint64_t)v20, v30);
    }

    unint64_t currentContent = self->_currentContent;
    if (currentContent)
    {
      if (currentContent == 1)
      {
        if (NTKPeerDeviceHandlesWideLoads()) {
          objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v35, @"EDIT_MODE_LABEL_CONTENT_OPTION_DESCRIPTION_24", @"Choose xx photos");
        }
        else {
        uint64_t v36 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v35, @"EDIT_MODE_LABEL_CONTENT_OPTION_DESCRIPTION_06", @"Choose xx photos");
        }
        objc_msgSend_setFooter_(self, v37, (uint64_t)v36, v38);

        if (v106)
        {
          externalAssets = self->_externalAssets;
          if (externalAssets)
          {
            id v43 = objc_msgSend_firstObject(externalAssets, v39, v40, v41);
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              v45 = [NTKCParmesanPhotosEditor alloc];
              v49 = objc_msgSend_face(self, v46, v47, v48);
              v53 = objc_msgSend_device(v49, v50, v51, v52);
              uint64_t v55 = objc_msgSend_initWithResourceDirectory_forDevice_(v45, v54, 0, (uint64_t)v53);
              v56 = *p_parmesanPhotosEditor;
              *p_parmesanPhotosEditor = (void *)v55;

              objc_msgSend_addAssetsFromAssetList_(*p_parmesanPhotosEditor, v57, (uint64_t)self->_externalAssets, v58);
              v62 = objc_msgSend_delegate(self, v59, v60, v61);
              objc_msgSend_showLoadingIndicator(v62, v63, v64, v65);

              v69 = objc_msgSend_delegate(self, v66, v67, v68);
              objc_msgSend_showLoadingIndicatorWithProgress_(v69, v70, v71, v72, 1.0);

              v73 = *p_parmesanPhotosEditor;
              v266[0] = MEMORY[0x263EF8330];
              v266[1] = 3221225472;
              v266[2] = sub_246B55824;
              v266[3] = &unk_2651FB890;
              v266[4] = self;
              objc_msgSend_generateGalleryPreviewResourceDirectoryWithCompletion_(v73, v74, (uint64_t)v266, v75);
              goto LABEL_58;
            }
            v169 = self->_externalAssets;
            if (v169)
            {
              v170 = objc_msgSend_firstObject(v169, v39, v40, v41);
              objc_opt_class();
              char v171 = objc_opt_isKindOfClass();

              if (v171)
              {
                v172 = [NTKParmesanImageEditor alloc];
                v176 = objc_msgSend_face(self, v173, v174, v175);
                v180 = objc_msgSend_device(v176, v177, v178, v179);
                v183 = (NTKParmesanImageEditor *)objc_msgSend_initForDevice_(v172, v181, (uint64_t)v180, v182);
                imageEditor = self->_imageEditor;
                self->_imageEditor = v183;

                objc_msgSend_addImages_(self->_imageEditor, v185, (uint64_t)self->_externalAssets, v186);
                v187 = self->_imageEditor;
                v265[0] = MEMORY[0x263EF8330];
                v265[1] = 3221225472;
                v265[2] = sub_246B558A8;
                v265[3] = &unk_2651FB890;
                v265[4] = self;
                objc_msgSend_generateGalleryPreviewResourceDirectoryWithCompletion_(v187, v188, (uint64_t)v265, v189);
                goto LABEL_58;
              }
            }
          }
          v190 = objc_msgSend_face(self, v39, v40, v41);
          v194 = objc_msgSend_resourceDirectory(v190, v191, v192, v193);

          v195 = [NTKCParmesanPhotosEditor alloc];
          v199 = objc_msgSend_face(self, v196, v197, v198);
          v203 = objc_msgSend_device(v199, v200, v201, v202);
          uint64_t v205 = objc_msgSend_initWithResourceDirectory_forDevice_(v195, v204, (uint64_t)v194, (uint64_t)v203);
          v206 = *p_parmesanPhotosEditor;
          *p_parmesanPhotosEditor = (void *)v205;

          goto LABEL_58;
        }
        if (objc_msgSend_inGallery(self, v39, v40, v41))
        {
          v110 = *p_parmesanPhotosEditor;
          if (!*p_parmesanPhotosEditor)
          {
            v111 = [NTKCParmesanPhotosEditor alloc];
            v115 = objc_msgSend_face(self, v112, v113, v114);
            v119 = objc_msgSend_device(v115, v116, v117, v118);
            uint64_t v121 = objc_msgSend_initWithResourceDirectory_forDevice_(v111, v120, 0, (uint64_t)v119);
            v122 = *p_parmesanPhotosEditor;
            *p_parmesanPhotosEditor = (void *)v121;

            v110 = *p_parmesanPhotosEditor;
          }
          v123 = objc_msgSend_galleryPreviewResourceDirectory(v110, v107, v108, v109);

          v127 = *p_parmesanPhotosEditor;
          if (v123)
          {
            uint64_t v128 = objc_msgSend_galleryPreviewResourceDirectory(v127, v124, v125, v126);
          }
          else
          {
            v207 = objc_msgSend_resourceDirectory(v127, v124, v125, v126);

            v211 = *p_parmesanPhotosEditor;
            if (!v207)
            {
              v264[0] = MEMORY[0x263EF8330];
              v264[1] = 3221225472;
              v264[2] = sub_246B55908;
              v264[3] = &unk_2651FB890;
              v264[4] = self;
              objc_msgSend_generateGalleryPreviewResourceDirectoryWithCompletion_(v211, v208, (uint64_t)v264, v210);
LABEL_52:
              if ((objc_msgSend__manualEditorHasPhotos(self, v159, v160, v161) & 1) == 0) {
                objc_msgSend__handleDidSelectActionRowForOption_(self, v31, (uint64_t)v20, v33);
              }
              goto LABEL_58;
            }
            uint64_t v128 = objc_msgSend_resourceDirectory(v211, v208, v209, v210);
          }
          v212 = (void *)v128;
          v213 = objc_msgSend_face(self, v129, v130, v131);
          objc_msgSend_setResourceDirectory_(v213, v214, (uint64_t)v212, v215);
        }
        else
        {
          if (self->_externalAssets)
          {
            v158 = objc_msgSend_logObject(NTKParmesanFaceBundle, v107, v108, v109);
            if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR)) {
              sub_246C299EC((uint64_t *)&self->_parmesanPhotosEditor, (uint64_t)self, v158);
            }

            goto LABEL_52;
          }
          if (!*p_parmesanPhotosEditor)
          {
            v225 = [NTKCParmesanPhotosEditor alloc];
            v229 = objc_msgSend_face(self, v226, v227, v228);
            v233 = objc_msgSend_device(v229, v230, v231, v232);
            uint64_t v235 = objc_msgSend_initWithResourceDirectory_forDevice_(v225, v234, 0, (uint64_t)v233);
            v236 = *p_parmesanPhotosEditor;
            *p_parmesanPhotosEditor = (void *)v235;
          }
          v212 = objc_msgSend_face(self, v107, v108, v109);
          objc_msgSend_setResourceDirectory_(v212, v237, 0, v238);
        }

        goto LABEL_52;
      }
    }
    else
    {
      v76 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v31, @"PARMESAN_EDIT_MODE_SYNCED_ALBUM_OPTION_DESCRIPTION", @"Synced Album");
      objc_msgSend_setFooter_(self, v77, (uint64_t)v76, v78);

      if (v106)
      {
        v82 = [NTKCParmesanAlbumEditor alloc];
        v86 = objc_msgSend_face(self, v83, v84, v85);
        v90 = objc_msgSend_resourceDirectory(v86, v87, v88, v89);
        v94 = objc_msgSend_face(self, v91, v92, v93);
        v98 = objc_msgSend_device(v94, v95, v96, v97);
        uint64_t v102 = objc_msgSend_inGallery(self, v99, v100, v101);
        shouldFinalize = (NTKCParmesanAlbumEditor *)objc_msgSend_initWithResourceDirectory_forDevice_shouldFinalize_(v82, v103, (uint64_t)v90, (uint64_t)v98, v102);
        albumEditor = self->_albumEditor;
        self->_albumEditor = shouldFinalize;
      }
      else
      {
        int v135 = objc_msgSend_inGallery(self, v79, v80, v81);
        v136 = self->_albumEditor;
        if (!v135)
        {
          if (v136)
          {
            v162 = objc_msgSend_resourceDirectory(v136, v132, v133, v134);
            v166 = objc_msgSend_face(self, v163, v164, v165);
            objc_msgSend_setResourceDirectory_(v166, v167, (uint64_t)v162, v168);
          }
          else
          {
            v239 = [NTKCParmesanAlbumEditor alloc];
            v243 = objc_msgSend_face(self, v240, v241, v242);
            v247 = objc_msgSend_device(v243, v244, v245, v246);
            v249 = (NTKCParmesanAlbumEditor *)objc_msgSend_initWithResourceDirectory_forDevice_shouldFinalize_(v239, v248, 0, (uint64_t)v247, 1);
            v250 = self->_albumEditor;
            self->_albumEditor = v249;

            v254 = objc_msgSend_delegate(self, v251, v252, v253);
            objc_msgSend_showLoadingIndicator(v254, v255, v256, v257);

            v258 = self->_albumEditor;
            v262[0] = MEMORY[0x263EF8330];
            v262[1] = 3221225472;
            v262[2] = sub_246B55A94;
            v262[3] = &unk_2651FB8B8;
            v262[4] = self;
            v261[0] = MEMORY[0x263EF8330];
            v261[1] = 3221225472;
            v261[2] = sub_246B55AE8;
            v261[3] = &unk_2651FB890;
            v261[4] = self;
            objc_msgSend_finalizeWithProgress_completion_(v258, v259, (uint64_t)v262, (uint64_t)v261);
          }
          v260 = *p_parmesanPhotosEditor;
          *p_parmesanPhotosEditor = 0;

          goto LABEL_58;
        }
        if (!v136)
        {
          v137 = [NTKCParmesanAlbumEditor alloc];
          v141 = objc_msgSend_face(self, v138, v139, v140);
          v145 = objc_msgSend_device(v141, v142, v143, v144);
          v147 = (NTKCParmesanAlbumEditor *)objc_msgSend_initWithResourceDirectory_forDevice_shouldFinalize_(v137, v146, 0, (uint64_t)v145, 1);
          v148 = self->_albumEditor;
          self->_albumEditor = v147;

          v136 = self->_albumEditor;
        }
        v149 = objc_msgSend_galleryPreviewResourceDirectory(v136, v132, v133, v134);

        v153 = self->_albumEditor;
        if (v149)
        {
          uint64_t v154 = objc_msgSend_galleryPreviewResourceDirectory(v153, v150, v151, v152);
        }
        else
        {
          v216 = objc_msgSend_resourceDirectory(v153, v150, v151, v152);

          v220 = self->_albumEditor;
          if (!v216)
          {
            v263[0] = MEMORY[0x263EF8330];
            v263[1] = 3221225472;
            v263[2] = sub_246B55A34;
            v263[3] = &unk_2651FB890;
            v263[4] = self;
            objc_msgSend_generateGalleryPreviewResourceDirectoryWithCompletion_(v220, v217, (uint64_t)v263, v219);
            goto LABEL_58;
          }
          uint64_t v154 = objc_msgSend_resourceDirectory(v220, v217, v218, v219);
        }
        v221 = (void *)v154;
        v222 = objc_msgSend_face(self, v155, v156, v157);
        objc_msgSend_setResourceDirectory_(v222, v223, (uint64_t)v221, v224);
      }
    }
LABEL_58:
    objc_msgSend__reloadEditOptionCellContent(self, v31, v32, v33);
  }
}

- (void)didSelectRow:(int64_t)a3
{
  uint64_t v6 = objc_msgSend_optionAtIndex_(self, a2, a3, v3);
  int v9 = objc_msgSend__handleDidSelectOption_(self, v7, (uint64_t)v6, v8);

  if (v9)
  {
    objc_msgSend_delegate(self, v10, v11, v12);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_editOptionSection_didSelectOptionAtIndex_(v14, v13, (uint64_t)self, a3);
  }
}

- (BOOL)_handleDidSelectOption:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_content(v4, v5, v6, v7)
    || self->_currentContent != 1
    || (objc_msgSend_inGallery(self, v8, v9, v10) & 1) != 0
    || self->_canDeleteCustomPhotos)
  {
    if (objc_msgSend_content(v4, v8, v9, v10) == 1)
    {
      if ((objc_msgSend__manualEditorHasPhotos(self, v11, v12, v13) & 1) == 0)
      {
        uint64_t v68 = (void *)MEMORY[0x263F57978];
        uint64_t v69 = NTKMaxParmesanPhotos();
        id v17 = objc_msgSend_parmesanConfigurationWithLimit_(v68, v70, v69, v71);
        uint64_t v72 = (void *)MEMORY[0x263F57978];
        v76 = objc_msgSend_parentViewController(self, v73, v74, v75);
        v108[0] = MEMORY[0x263EF8330];
        v108[1] = 3221225472;
        v108[2] = sub_246B561B4;
        v108[3] = &unk_2651FB908;
        v108[4] = self;
        objc_msgSend_presentPhotosAddControllerFromViewController_configuration_withCompletion_(v72, v77, (uint64_t)v76, (uint64_t)v17, v108);

        goto LABEL_16;
      }
      id v17 = objc_msgSend__previewNavigationControllerForCurrentEditor(self, v14, v15, v16);
      objc_msgSend_setPreviewDelegate_(v17, v18, (uint64_t)self, v19);
      uint64_t v23 = objc_msgSend_parentViewController(self, v20, v21, v22);
      objc_msgSend_presentViewController_animated_completion_(v23, v24, (uint64_t)v17, 1, 0);
    }
    else
    {
      if (objc_msgSend_content(v4, v11, v12, v13))
      {
LABEL_17:
        self->_canDeleteCustomPhotos = 0;
        objc_msgSend__reloadEditOptionCellContent(self, v25, v26, v27);
        BOOL v78 = 1;
        goto LABEL_18;
      }
      uint64_t v28 = objc_msgSend_logObject(NTKParmesanFaceBundle, v25, v26, v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v107 = 0;
        _os_log_impl(&dword_246B51000, v28, OS_LOG_TYPE_DEFAULT, "Settings up collection view controller", v107, 2u);
      }

      if (!self->_albumEditor)
      {
        unint64_t v29 = [NTKCParmesanAlbumEditor alloc];
        uint64_t v33 = objc_msgSend_face(self, v30, v31, v32);
        uint64_t v37 = objc_msgSend_device(v33, v34, v35, v36);
        shouldFinalize = (NTKCParmesanAlbumEditor *)objc_msgSend_initWithResourceDirectory_forDevice_shouldFinalize_(v29, v38, 0, (uint64_t)v37, 1);
        albumEditor = self->_albumEditor;
        self->_albumEditor = shouldFinalize;

        v44 = objc_msgSend_face(self, v41, v42, v43);
        objc_msgSend_setResourceDirectory_(v44, v45, 0, v46);
      }
      uint64_t v47 = [NTKParmesanShuffleSelectionFlowController alloc];
      uint64_t v48 = self->_albumEditor;
      uint64_t v52 = objc_msgSend_face(self, v49, v50, v51);
      uint64_t v56 = objc_msgSend_inGallery(self, v53, v54, v55);
      id v17 = objc_msgSend_initWithEditor_face_inGallery_(v47, v57, (uint64_t)v48, (uint64_t)v52, v56);

      objc_msgSend_setDelegate_(v17, v58, (uint64_t)self, v59);
      id v60 = objc_alloc(MEMORY[0x263F829B8]);
      uint64_t v23 = objc_msgSend_initWithRootViewController_(v60, v61, (uint64_t)v17, v62);
      v66 = objc_msgSend_parentViewController(self, v63, v64, v65);
      objc_msgSend_presentViewController_animated_completion_(v66, v67, (uint64_t)v23, 1, 0);
    }
LABEL_16:

    goto LABEL_17;
  }
  if (objc_msgSend_content(v4, v8, v9, v10))
  {
    uint64_t v81 = 0;
    objc_msgSend_alertControllerWithTitle_message_preferredStyle_(MEMORY[0x263F82418], v80, 0, 0, 0);
  }
  else
  {
    uint64_t v81 = objc_msgSend_localizedStringForKey_comment_(NTKParmesanFaceBundle, v80, @"PARMESAN_ALERT_WILL_DELETE_MANUAL_PHOTOS_MESSAGE", @"confirm delete prompt");
    objc_msgSend_alertControllerWithTitle_message_preferredStyle_(MEMORY[0x263F82418], v82, 0, (uint64_t)v81, 0);
  v83 = };
  if (objc_msgSend_photosCount(self->_parmesanPhotosEditor, v84, v85, v86) == 1) {
    objc_msgSend_stringByAppendingString_(@"PHOTOS_DELETE_BUTTON", v87, @"_SINGULAR", v88);
  }
  else {
  uint64_t v89 = objc_msgSend_stringByAppendingString_(@"PHOTOS_DELETE_BUTTON", v87, @"_PLURAL", v88);
  }
  v90 = NTKCCustomizationLocalizedString();

  v91 = (void *)MEMORY[0x263F82400];
  v109[0] = MEMORY[0x263EF8330];
  v109[1] = 3221225472;
  v109[2] = sub_246B560C4;
  v109[3] = &unk_2651FB8E0;
  v109[4] = self;
  id v110 = v4;
  uint64_t v93 = objc_msgSend_actionWithTitle_style_handler_(v91, v92, (uint64_t)v90, 2, v109);
  objc_msgSend_addAction_(v83, v94, (uint64_t)v93, v95);
  uint64_t v96 = (void *)MEMORY[0x263F82400];
  uint64_t v97 = NTKCCustomizationLocalizedString();
  v99 = objc_msgSend_actionWithTitle_style_handler_(v96, v98, (uint64_t)v97, 1, 0);

  objc_msgSend_addAction_(v83, v100, (uint64_t)v99, v101);
  v105 = objc_msgSend_parentViewController(self, v102, v103, v104);
  objc_msgSend_presentViewController_animated_completion_(v105, v106, (uint64_t)v83, 1, 0);

  BOOL v78 = 0;
LABEL_18:

  return v78;
}

- (id)_previewNavigationControllerForCurrentEditor
{
  if (self->_parmesanPhotosEditor)
  {
    id v5 = [NTKCParmesanFacePreviewNavigationController alloc];
    uint64_t v9 = objc_msgSend_face(self, v6, v7, v8);
    uint64_t v13 = objc_msgSend_faceView(self, v10, v11, v12);
    parmesanPhotosEditor = self->_parmesanPhotosEditor;
    uint64_t v18 = objc_msgSend_inGallery(self, v15, v16, v17);
    uint64_t v20 = objc_msgSend_initWithFace_faceView_editor_inGallery_(v5, v19, (uint64_t)v9, (uint64_t)v13, parmesanPhotosEditor, v18);
LABEL_5:
    uint64_t v34 = (void *)v20;

    goto LABEL_6;
  }
  if (self->_imageEditor)
  {
    uint64_t v21 = [NTKCParmesanFacePreviewNavigationController alloc];
    uint64_t v9 = objc_msgSend_face(self, v22, v23, v24);
    uint64_t v13 = objc_msgSend_faceView(self, v25, v26, v27);
    imageEditor = self->_imageEditor;
    uint64_t v32 = objc_msgSend_inGallery(self, v29, v30, v31);
    uint64_t v20 = objc_msgSend_initWithFace_faceView_imageEditor_inGallery_(v21, v33, (uint64_t)v9, (uint64_t)v13, imageEditor, v32);
    goto LABEL_5;
  }
  uint64_t v36 = objc_msgSend_logObject(NTKParmesanFaceBundle, a2, v2, v3);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    sub_246C29B24(v36);
  }

  uint64_t v34 = 0;
LABEL_6:

  return v34;
}

- (void)_setPhotos:(id)a3
{
  objc_msgSend_addAssetsFromUIImagePicker_(self->_parmesanPhotosEditor, a2, (uint64_t)a3, v3);
  objc_msgSend__updateSection(self, v5, v6, v7);
  if (objc_msgSend_inGallery(self, v8, v9, v10))
  {
    id v14 = objc_msgSend_delegate(self, v11, v12, v13);
    objc_msgSend_showLoadingIndicator(v14, v15, v16, v17);

    uint64_t v21 = objc_msgSend_delegate(self, v18, v19, v20);
    objc_msgSend_showLoadingIndicatorWithProgress_(v21, v22, v23, v24, 1.0);

    parmesanPhotosEditor = self->_parmesanPhotosEditor;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = sub_246B56430;
    v28[3] = &unk_2651FB890;
    v28[4] = self;
    objc_msgSend_generateGalleryPreviewResourceDirectoryWithCompletion_(parmesanPhotosEditor, v26, (uint64_t)v28, v27);
  }
  else
  {
    MEMORY[0x270F9A6D0](self, sel_saveChangesWithCompletion_, 0, v13);
  }
}

- (BOOL)_dynamicEditorHasSelection
{
  id v4 = objc_msgSend_shuffleSelection(self->_albumEditor, a2, v2, v3);
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)_manualEditorHasPhotos
{
  return objc_msgSend_photosCount(self->_parmesanPhotosEditor, a2, v2, v3) > 0
      || objc_msgSend_photosCount(self->_imageEditor, v5, v6, v7) > 0;
}

- (id)_currentEditor
{
  unint64_t currentContent = self->_currentContent;
  if (!currentContent)
  {
    id v4 = &OBJC_IVAR___NTKCParmesanFaceDetailContentSectionController__albumEditor;
    goto LABEL_6;
  }
  if (currentContent == 1)
  {
    parmesanPhotosEditor = self->_parmesanPhotosEditor;
    if (parmesanPhotosEditor)
    {
LABEL_7:
      BOOL v5 = parmesanPhotosEditor;
      goto LABEL_9;
    }
    id v4 = &OBJC_IVAR___NTKCParmesanFaceDetailContentSectionController__imageEditor;
LABEL_6:
    parmesanPhotosEditor = *(NTKCParmesanPhotosEditor **)((char *)&self->super.super.super.super.isa + *v4);
    goto LABEL_7;
  }
  BOOL v5 = 0;
LABEL_9:

  return v5;
}

- (void)_updateSection
{
  objc_msgSend__reloadEditOptionCellContent(self, a2, v2, v3);
  objc_msgSend_delegate(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sectionDidUpdate_(v10, v8, (uint64_t)self, v9);
}

- (BOOL)hasChanges
{
  id v4 = objc_msgSend__currentEditor(self, a2, v2, v3);
  BOOL v8 = objc_msgSend_state(v4, v5, v6, v7) == 2;

  return v8;
}

- (void)saveChangesWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (objc_msgSend_hasChanges(self, v5, v6, v7))
  {
    id v14 = objc_msgSend__currentEditor(self, v8, v9, v10);
    if (v14)
    {
      uint64_t v15 = objc_msgSend_delegate(self, v11, v12, v13);
      objc_msgSend_showLoadingIndicator(v15, v16, v17, v18);

      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = sub_246B568D8;
      v22[3] = &unk_2651FB8B8;
      v22[4] = self;
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = sub_246B5692C;
      v20[3] = &unk_2651FB930;
      v20[4] = self;
      uint64_t v21 = v4;
      objc_msgSend_finalizeWithProgress_completion_(v14, v19, (uint64_t)v22, (uint64_t)v20);
    }
    else if (v4)
    {
      v4[2](v4);
    }
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

- (void)shuffleSelectionViewController:(id)a3 didFinishWithSelection:(id)a4
{
  uint64_t v117 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_logObject(NTKParmesanFaceBundle, v8, v9, v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = objc_msgSend_description(v7, v12, v13, v14);
    *(_DWORD *)buf = 138412290;
    id v116 = v15;
    _os_log_impl(&dword_246B51000, v11, OS_LOG_TYPE_DEFAULT, "Shuffle selection did finish with user selection =  %@", buf, 0xCu);
  }
  uint64_t v19 = objc_msgSend_manualSelection(v7, v16, v17, v18);
  uint64_t v23 = objc_msgSend_count(v19, v20, v21, v22);

  if (v23)
  {
    uint64_t v27 = objc_msgSend_logObject(NTKParmesanFaceBundle, v24, v25, v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v116 = v7;
      _os_log_impl(&dword_246B51000, v27, OS_LOG_TYPE_DEFAULT, "shuffleSelection:didFinish: selected manual photos, switching editors: %@", buf, 0xCu);
    }

    self->_unint64_t currentContent = 1;
    uint64_t v28 = [NTKCParmesanPhotosEditor alloc];
    uint64_t v32 = objc_msgSend_face(self, v29, v30, v31);
    uint64_t v36 = objc_msgSend_device(v32, v33, v34, v35);
    uint64_t v38 = (NTKCParmesanPhotosEditor *)objc_msgSend_initWithResourceDirectory_forDevice_(v28, v37, 0, (uint64_t)v36);
    parmesanPhotosEditor = self->_parmesanPhotosEditor;
    self->_parmesanPhotosEditor = v38;

    uint64_t v40 = (void *)MEMORY[0x263F14D18];
    id v105 = v7;
    v44 = objc_msgSend_manualSelection(v7, v41, v42, v43);
    uint64_t v46 = objc_msgSend_fetchAssetsWithLocalIdentifiers_options_(v40, v45, (uint64_t)v44, 0);

    long long v111 = 0u;
    long long v112 = 0u;
    long long v110 = 0u;
    long long v109 = 0u;
    uint64_t v47 = v46;
    uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v48, (uint64_t)&v109, (uint64_t)v114, 16);
    if (v49)
    {
      uint64_t v51 = v49;
      uint64_t v52 = *(void *)v110;
      do
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v110 != v52) {
            objc_enumerationMutation(v47);
          }
          uint64_t v54 = self->_parmesanPhotosEditor;
          uint64_t v113 = *(void *)(*((void *)&v109 + 1) + 8 * i);
          uint64_t v55 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v50, (uint64_t)&v113, 1);
          objc_msgSend_addAssetsFromAssetList_(v54, v56, (uint64_t)v55, v57);
        }
        uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v50, (uint64_t)&v109, (uint64_t)v114, 16);
      }
      while (v51);
    }

    uint64_t v58 = self->_parmesanPhotosEditor;
    id v7 = v105;
  }
  else
  {
    uint64_t v59 = objc_msgSend_editor(v6, v24, v25, v26);
    self->_unint64_t currentContent = 0;
    uint64_t v47 = v59;
    v63 = objc_msgSend_logObject(NTKParmesanFaceBundle, v60, v61, v62);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v67 = objc_msgSend_shuffleSelection(v47, v64, v65, v66);
      *(_DWORD *)buf = 138412290;
      id v116 = v67;
      _os_log_impl(&dword_246B51000, v63, OS_LOG_TYPE_DEFAULT, "shuffleSelection:didFinish: album editor updated with selection: %@", buf, 0xCu);
    }
    uint64_t v58 = v47;
  }

  uint64_t v71 = objc_msgSend_face(self, v68, v69, v70);
  unint64_t currentContent = self->_currentContent;
  v76 = objc_msgSend_currentDevice(MEMORY[0x263EFD180], v73, v74, v75);
  BOOL v78 = objc_msgSend_optionWithContent_device_(NTKParmesanContentEditOption, v77, currentContent, (uint64_t)v76);
  objc_msgSend_selectOption_forCustomEditMode_slot_(v71, v79, (uint64_t)v78, 12, 0);

  if (objc_msgSend_state(v58, v80, v81, v82) != 1)
  {
    int v86 = objc_msgSend_inGallery(self, v83, v84, v85);
    v90 = objc_msgSend_delegate(self, v87, v88, v89);
    objc_msgSend_showLoadingIndicator(v90, v91, v92, v93);

    if (v86)
    {
      uint64_t v97 = objc_msgSend_delegate(self, v94, v95, v96);
      objc_msgSend_showLoadingIndicatorWithProgress_(v97, v98, v99, v100, 1.0);

      v108[0] = MEMORY[0x263EF8330];
      v108[1] = 3221225472;
      v108[2] = sub_246B56FB4;
      v108[3] = &unk_2651FB890;
      v108[4] = self;
      objc_msgSend_generateGalleryPreviewResourceDirectoryWithCompletion_(v58, v101, (uint64_t)v108, v102);
    }
    else
    {
      v107[0] = MEMORY[0x263EF8330];
      v107[1] = 3221225472;
      v107[2] = sub_246B57034;
      v107[3] = &unk_2651FB8B8;
      v107[4] = self;
      v106[0] = MEMORY[0x263EF8330];
      v106[1] = 3221225472;
      v106[2] = sub_246B57088;
      v106[3] = &unk_2651FB890;
      v106[4] = self;
      objc_msgSend_finalizeWithProgress_completion_(v58, v94, (uint64_t)v107, (uint64_t)v106);
    }
  }
  uint64_t v103 = objc_msgSend_parentViewController(self, v83, v84, v85);
  objc_msgSend_dismissViewControllerAnimated_completion_(v103, v104, 1, 0);
}

- (UIViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (NTKCParmesanPhotosEditor)parmesanPhotosEditor
{
  return self->_parmesanPhotosEditor;
}

- (void)setParmesanPhotosEditor:(id)a3
{
}

- (NTKCParmesanAlbumEditor)albumEditor
{
  return self->_albumEditor;
}

- (NTKCParmesanAlbumEditor)albumPhotosEditor
{
  return self->_albumPhotosEditor;
}

- (void)setAlbumPhotosEditor:(id)a3
{
}

- (NTKParmesanImageEditor)imageEditor
{
  return self->_imageEditor;
}

- (void)setImageEditor:(id)a3
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
  objc_storeStrong((id *)&self->_imageEditor, 0);
  objc_storeStrong((id *)&self->_albumPhotosEditor, 0);
  objc_storeStrong((id *)&self->_albumEditor, 0);
  objc_storeStrong((id *)&self->_parmesanPhotosEditor, 0);
  objc_destroyWeak((id *)&self->_parentViewController);

  objc_storeStrong((id *)&self->_savedGalleryResourceDirectory, 0);
}

@end