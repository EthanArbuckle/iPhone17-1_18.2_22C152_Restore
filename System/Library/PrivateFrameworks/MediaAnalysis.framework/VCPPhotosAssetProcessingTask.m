@interface VCPPhotosAssetProcessingTask
+ (id)taskWithProcessingTypes:(unint64_t)a3 forAssetsWithLocalIdentifiers:(id)a4 fromPhotoLibraryWithURL:(id)a5 withProgressHandler:(id)a6 andCompletionHandler:(id)a7;
- (BOOL)run:(id *)a3;
- (VCPPhotosAssetProcessingTask)initWithProcessingTypes:(unint64_t)a3 forAssetsWithLocalIdentifiers:(id)a4 fromPhotoLibraryWithURL:(id)a5 withProgressHandler:(id)a6 andCompletionHandler:(id)a7;
@end

@implementation VCPPhotosAssetProcessingTask

- (VCPPhotosAssetProcessingTask)initWithProcessingTypes:(unint64_t)a3 forAssetsWithLocalIdentifiers:(id)a4 fromPhotoLibraryWithURL:(id)a5 withProgressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v21.receiver = self;
  v21.super_class = (Class)VCPPhotosAssetProcessingTask;
  v16 = [(VCPPhotosAssetProcessingTask *)&v21 initWithCompletionHandler:a7];
  v17 = v16;
  if (v16)
  {
    v16->_processingTypes = a3;
    objc_storeStrong((id *)&v16->_localIdentifiers, a4);
    objc_storeStrong((id *)&v17->_photoLibraryURL, a5);
    id v18 = objc_retainBlock(v15);
    id progressHandler = v17->_progressHandler;
    v17->_id progressHandler = v18;
  }
  return v17;
}

+ (id)taskWithProcessingTypes:(unint64_t)a3 forAssetsWithLocalIdentifiers:(id)a4 fromPhotoLibraryWithURL:(id)a5 withProgressHandler:(id)a6 andCompletionHandler:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = [objc_alloc((Class)objc_opt_class()) initWithProcessingTypes:a3 forAssetsWithLocalIdentifiers:v14 fromPhotoLibraryWithURL:v13 withProgressHandler:v12 andCompletionHandler:v11];

  return v15;
}

- (BOOL)run:(id *)a3
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v5, v6))
    {
      unsigned int v7 = [(NSArray *)self->_localIdentifiers count];
      photoLibraryURL = self->_photoLibraryURL;
      *(_DWORD *)buf = 67109378;
      unsigned int v151 = v7;
      __int16 v152 = 2112;
      v153 = photoLibraryURL;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Performing on-demand processing for %d assets from %@", buf, 0x12u);
    }
  }
  v9 = VCPMADBackgroundService;
  v10 = +[VCPPhotoLibraryManager sharedManager];
  uint64_t v11 = [v10 photoLibraryWithURL:self->_photoLibraryURL];

  v115 = (void *)v11;
  if (!v11)
  {
    if (a3)
    {
      NSErrorUserInfoKey v148 = NSLocalizedDescriptionKey;
      v29 = +[NSString stringWithFormat:@"Failed to open specified Photo Library (%@)", self->_photoLibraryURL];
      v149 = v29;
      v30 = +[NSDictionary dictionaryWithObjects:&v149 forKeys:&v148 count:1];
      v31 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v30];
      id v32 = *a3;
      *a3 = v31;
    }
    goto LABEL_84;
  }
  unint64_t processingTypes = self->_processingTypes;
  double v13 = 0.0;
  if (processingTypes) {
    double v14 = 1.0;
  }
  else {
    double v14 = 0.0;
  }
  unint64_t v15 = self->_processingTypes & 2;
  if ((processingTypes & 2) != 0) {
    double v14 = v14 + 1.0;
  }
  if ((processingTypes & 8) != 0) {
    double v14 = v14 + 1.0;
  }
  if ((processingTypes & 0x10) != 0) {
    double v14 = v14 + 1.0;
  }
  if ((processingTypes & 0x20) != 0) {
    double v16 = v14 + 1.0;
  }
  else {
    double v16 = v14;
  }
  v114 = a3;
  if (processingTypes)
  {
    v125[0] = _NSConcreteStackBlock;
    v125[1] = 3221225472;
    v125[2] = sub_1000F559C;
    v125[3] = &unk_10021DF38;
    v125[4] = self;
    *(double *)&v125[5] = 0.0 / v16;
    *(double *)&v125[6] = v16;
    id v18 = objc_retainBlock(v125);
    v19 = [VCPMADSceneAssetProcessingTask alloc];
    localIdentifiers = self->_localIdentifiers;
    objc_super v21 = self->_photoLibraryURL;
    v124[0] = _NSConcreteStackBlock;
    v124[1] = 3221225472;
    v124[2] = sub_1000F55C8;
    v124[3] = &unk_10021CAE0;
    v124[4] = self;
    v22 = [(VCPMADSceneAssetProcessingTask *)v19 initWithLocalIdentifiers:localIdentifiers fromPhotoLibraryWithURL:v21 cancelBlock:v124 progressHandler:v18 completionHandler:&stru_10021DF58];
    signed int v23 = [(VCPMADSceneAssetProcessingTask *)v22 run];
    if (v23 == -128)
    {
      if (a3)
      {
        NSErrorUserInfoKey v146 = NSLocalizedDescriptionKey;
        v24 = +[NSString stringWithFormat:@"Scene asset processing cancelled"];
        v147 = v24;
        v25 = +[NSDictionary dictionaryWithObjects:&v147 forKeys:&v146 count:1];
        v26 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v25];
        id v27 = *a3;
        *a3 = v26;

        v9 = VCPMADBackgroundService;
      }
      LODWORD(v28) = 0;
    }
    else
    {
      signed int v33 = v23;
      LODWORD(v28) = v23 == 0;
      if (a3 && v23)
      {
        uint64_t v111 = v23;
        NSErrorUserInfoKey v144 = NSLocalizedDescriptionKey;
        +[NSString stringWithFormat:@"Scene asset processing failed"];
        v34 = v112 = v17;
        v145 = v34;
        v35 = +[NSDictionary dictionaryWithObjects:&v145 forKeys:&v144 count:1];
        v36 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v111 userInfo:v35];
        id v37 = *a3;
        *a3 = v36;

        v9 = VCPMADBackgroundService;
        v17 = v112;
      }
      if (v33) {
        double v13 = 0.0;
      }
      else {
        double v13 = 1.0;
      }
    }

    if (!v28) {
      goto LABEL_85;
    }
    unint64_t processingTypes = self->_processingTypes;
    unint64_t v15 = processingTypes & 2;
  }
  if (v15)
  {
    v123[0] = _NSConcreteStackBlock;
    v123[1] = 3221225472;
    v123[2] = sub_1000F55D4;
    v123[3] = &unk_10021DF38;
    v123[4] = self;
    *(double *)&v123[5] = v13 * 100.0 / v16;
    *(double *)&v123[6] = v16;
    v39 = objc_retainBlock(v123);
    v40 = [VCPMADOCRAssetProcessingTask alloc];
    v41 = self->_localIdentifiers;
    v42 = self->_photoLibraryURL;
    v122[0] = _NSConcreteStackBlock;
    v122[1] = 3221225472;
    v122[2] = sub_1000F5600;
    v122[3] = &unk_10021CAE0;
    v122[4] = self;
    v43 = [(VCPMADPhotoAssetProcessingTask *)v40 initWithLocalIdentifiers:v41 fromPhotoLibraryWithURL:v42 cancelBlock:v122 progressHandler:v39 completionHandler:&stru_10021DF78];
    unsigned int v44 = [(VCPMADOCRAssetProcessingTask *)v43 run];
    if (v44 == -128)
    {
      v28 = a3;
      if (a3)
      {
        NSErrorUserInfoKey v142 = NSLocalizedDescriptionKey;
        v45 = +[NSString stringWithFormat:@"OCR asset processing cancelled"];
        v143 = v45;
        v46 = +[NSDictionary dictionaryWithObjects:&v143 forKeys:&v142 count:1];
        uint64_t v47 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v46];
        id v48 = *v28;
        id *v28 = (id)v47;

        LODWORD(v28) = 0;
      }
    }
    else
    {
      signed int v49 = v44;
      LODWORD(v28) = v44 == 0;
      if (a3 && v44)
      {
        NSErrorUserInfoKey v140 = NSLocalizedDescriptionKey;
        v50 = +[NSString stringWithFormat:@"OCR asset processing failed"];
        v141 = v50;
        v51 = +[NSDictionary dictionaryWithObjects:&v141 forKeys:&v140 count:1];
        v52 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v49 userInfo:v51];
        id v53 = *a3;
        *a3 = v52;

        v9 = VCPMADBackgroundService;
      }
      if (!v49) {
        double v13 = v13 + 1.0;
      }
    }

    if (!v28) {
      goto LABEL_85;
    }
    unint64_t processingTypes = self->_processingTypes;
    a3 = v114;
  }
  if ((processingTypes & 8) == 0) {
    goto LABEL_55;
  }
  v121[0] = _NSConcreteStackBlock;
  v121[1] = 3221225472;
  v121[2] = sub_1000F560C;
  v121[3] = &unk_10021DF38;
  v121[4] = self;
  *(double *)&v121[5] = v13 * 100.0 / v16;
  *(double *)&v121[6] = v16;
  v55 = objc_retainBlock(v121);
  v56 = [VCPMADQuickFaceIDAssetProcessingTask alloc];
  v57 = self->_localIdentifiers;
  v58 = self->_photoLibraryURL;
  v120[0] = _NSConcreteStackBlock;
  v120[1] = 3221225472;
  v120[2] = sub_1000F5638;
  v120[3] = &unk_10021CAE0;
  v120[4] = self;
  v59 = [(VCPMADQuickFaceIDAssetProcessingTask *)v56 initWithLocalIdentifiers:v57 fromPhotoLibraryWithURL:v58 cancelBlock:v120 progressHandler:v55 completionHandler:&stru_10021DF98];
  unsigned int v60 = [(VCPMADQuickFaceIDAssetProcessingTask *)v59 run];
  if (v60 == -128)
  {
    v28 = a3;
    if (a3)
    {
      NSErrorUserInfoKey v138 = NSLocalizedDescriptionKey;
      v61 = +[NSString stringWithFormat:@"Face asset processing cancelled"];
      v139 = v61;
      v62 = +[NSDictionary dictionaryWithObjects:&v139 forKeys:&v138 count:1];
      uint64_t v63 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v62];
      id v64 = *v28;
      id *v28 = (id)v63;

      LODWORD(v28) = 0;
    }
  }
  else
  {
    signed int v65 = v60;
    LODWORD(v28) = v60 == 0;
    if (a3 && v60)
    {
      NSErrorUserInfoKey v136 = NSLocalizedDescriptionKey;
      v66 = +[NSString stringWithFormat:@"Face asset processing failed"];
      v137 = v66;
      v67 = +[NSDictionary dictionaryWithObjects:&v137 forKeys:&v136 count:1];
      uint64_t v68 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v65 userInfo:v67];
      id v69 = *v114;
      id *v114 = (id)v68;

      v9 = VCPMADBackgroundService;
    }
    if (!v65) {
      double v13 = v13 + 1.0;
    }
  }

  if (v28)
  {
    unint64_t processingTypes = self->_processingTypes;
    a3 = v114;
LABEL_55:
    if ((processingTypes & 0x10) == 0) {
      goto LABEL_74;
    }
    v119[0] = _NSConcreteStackBlock;
    v119[1] = 3221225472;
    v119[2] = sub_1000F5644;
    v119[3] = &unk_10021DF38;
    v119[4] = self;
    *(double *)&v119[5] = v13 * 100.0 / v16;
    *(double *)&v119[6] = v16;
    v71 = objc_retainBlock(v119);
    v72 = [&v9[44] sharedManager];
    v73 = [v72 photoLibraryWithURL:self->_photoLibraryURL];

    if (v73)
    {
      v113 = v70;
      v74 = +[VCPMADFullAssetProcessingTask taskWithPhotoLibrary:v73 localIdentifiers:self->_localIdentifiers];
      v118[0] = _NSConcreteStackBlock;
      v118[1] = 3221225472;
      v118[2] = sub_1000F5670;
      v118[3] = &unk_10021CAE0;
      v118[4] = self;
      [v74 setCancel:v118];
      [v74 setProgressHandler:v71];
      [v74 start];
      if ([v74 error] == -128)
      {
        if (a3)
        {
          NSErrorUserInfoKey v132 = NSLocalizedDescriptionKey;
          v75 = +[NSString stringWithFormat:@"Full asset processing cancelled"];
          v133 = v75;
          v76 = +[NSDictionary dictionaryWithObjects:&v133 forKeys:&v132 count:1];
          a3 = v114;
          uint64_t v77 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v76];
          id v78 = *v114;
          id *v114 = (id)v77;
        }
        BOOL v79 = 1;
      }
      else
      {
        unsigned int v84 = [v74 error];
        v85 = a3;
        signed int v86 = v84;
        if (v85 && v84)
        {
          NSErrorUserInfoKey v130 = NSLocalizedDescriptionKey;
          v87 = +[NSString stringWithFormat:@"Full asset processing failed"];
          v131 = v87;
          v88 = +[NSDictionary dictionaryWithObjects:&v131 forKeys:&v130 count:1];
          uint64_t v89 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v86 userInfo:v88];
          id v90 = *v114;
          id *v114 = (id)v89;
        }
        BOOL v79 = v86 != 0;
        if (!v86) {
          double v13 = v13 + 1.0;
        }
        a3 = v114;
      }
    }
    else
    {
      if (!a3)
      {
        BOOL v79 = 1;
LABEL_72:

        if (v79) {
          goto LABEL_84;
        }
        unint64_t processingTypes = self->_processingTypes;
LABEL_74:
        if ((processingTypes & 0x20) == 0)
        {
LABEL_75:
          v91 = [(VCPPhotosAssetProcessingTask *)self completionHandler];
          v91[2](v91, 0, 0);

          LOBYTE(v28) = 1;
          goto LABEL_85;
        }
        v117[0] = _NSConcreteStackBlock;
        v117[1] = 3221225472;
        v117[2] = sub_1000F5678;
        v117[3] = &unk_10021DF38;
        v117[4] = self;
        *(double *)&v117[5] = v13 * 100.0 / v16;
        *(double *)&v117[6] = v16;
        v93 = objc_retainBlock(v117);
        v94 = [VCPMADVisualSearchAssetProcessingTask alloc];
        v95 = self->_localIdentifiers;
        v96 = self->_photoLibraryURL;
        v116[0] = _NSConcreteStackBlock;
        v116[1] = 3221225472;
        v116[2] = sub_1000F56A4;
        v116[3] = &unk_10021CAE0;
        v116[4] = self;
        v97 = [(VCPMADVisualSearchAssetProcessingTask *)v94 initWithLocalIdentifiers:v95 fromPhotoLibraryWithURL:v96 cancelBlock:v116 progressHandler:v93 completionHandler:&stru_10021DFB8];
        unsigned int v98 = [(VCPMADVisualSearchAssetProcessingTask *)v97 run];
        if (v98 == -128)
        {
          if (a3)
          {
            NSErrorUserInfoKey v128 = NSLocalizedDescriptionKey;
            v99 = +[NSString stringWithFormat:@"VisualSearch asset processing cancelled"];
            v129 = v99;
            +[NSDictionary dictionaryWithObjects:&v129 forKeys:&v128 count:1];
            v101 = v100 = a3;
            uint64_t v102 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v101];
            id v103 = *v100;
            id *v100 = (id)v102;
          }
        }
        else
        {
          signed int v104 = v98;
          if (a3 && v98)
          {
            NSErrorUserInfoKey v126 = NSLocalizedDescriptionKey;
            v105 = +[NSString stringWithFormat:@"VisualSearch asset processing failed"];
            v127 = v105;
            +[NSDictionary dictionaryWithObjects:&v127 forKeys:&v126 count:1];
            v107 = v106 = v92;
            v108 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v104 userInfo:v107];
            id v109 = *a3;
            *a3 = v108;

            v92 = v106;
          }

          if (!v104) {
            goto LABEL_75;
          }
        }
LABEL_84:
        LOBYTE(v28) = 0;
        goto LABEL_85;
      }
      v113 = v70;
      NSErrorUserInfoKey v134 = NSLocalizedDescriptionKey;
      v74 = [(NSURL *)self->_photoLibraryURL path];
      v80 = +[NSString stringWithFormat:@"[OnDemandFull] Failed to open Photo Library (%@)", v74];
      v135 = v80;
      BOOL v79 = 1;
      v81 = +[NSDictionary dictionaryWithObjects:&v135 forKeys:&v134 count:1];
      a3 = v114;
      uint64_t v82 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-23 userInfo:v81];
      id v83 = *v114;
      id *v114 = (id)v82;
    }
    v70 = v113;
    goto LABEL_72;
  }
LABEL_85:

  return (char)v28;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_photoLibraryURL, 0);
  objc_storeStrong((id *)&self->_localIdentifiers, 0);
}

@end