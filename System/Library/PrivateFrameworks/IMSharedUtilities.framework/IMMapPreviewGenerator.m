@interface IMMapPreviewGenerator
+ (BOOL)supportsBlastDoor;
+ (BOOL)writesToDisk;
+ (CGImage)newPreviewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6;
+ (CGImage)newPreviewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 interfaceStyle:(int64_t)a6 error:(id *)a7;
+ (CGSize)mapThumbnailFillSizeForWidth:(double)a3;
+ (CLLocationCoordinate2D)_legacyCoordinateForvCardURL:(id)a3;
+ (CLLocationCoordinate2D)coordinateForvCardURL:(id)a3 senderContext:(id)a4;
+ (id)UTITypes;
+ (id)mapSnapshotterQueue;
+ (id)titleBarMaskImageForWidth:(double)a3 constraints:(IMPreviewConstraints *)a4 error:(id *)a5;
+ (id)vCardDataForURL:(id)a3;
+ (id)vCardURLSForData:(id)a3;
+ (id)valueForKey:(id)a3 forURLComponents:(id)a4;
@end

@implementation IMMapPreviewGenerator

+ (id)UTITypes
{
  v5[1] = *MEMORY[0x1E4F143B8];
  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x1E4F224F8], @"loc.vcf", (CFStringRef)*MEMORY[0x1E4F22718]);
  v5[0] = PreferredIdentifierForTag;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (CGImage)newPreviewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 error:(id *)a6
{
  long long v6 = *(_OWORD *)&a5->var1.height;
  v8[0] = *(_OWORD *)&a5->var0;
  v8[1] = v6;
  uint64_t v9 = *(void *)&a5->var3;
  return (CGImage *)[a1 newPreviewFromSourceURL:a3 senderContext:a4 withPreviewConstraints:v8 interfaceStyle:1 error:a6];
}

+ (CGImage)newPreviewFromSourceURL:(id)a3 senderContext:(id)a4 withPreviewConstraints:(IMPreviewConstraints *)a5 interfaceStyle:(int64_t)a6 error:(id *)a7
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  v14 = _os_activity_create(&dword_1A0772000, "com.apple.messages.AttachmentGeneratePreviewMap", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  if (v12)
  {
    if (qword_1E94FFB68 != -1) {
      dispatch_once(&qword_1E94FFB68, &unk_1EF2BFAE0);
    }
    uint64_t v15 = [a1 coordinateForvCardURL:v12 senderContext:v13];
    double v17 = v16;
    double v19 = v18;
    if (off_1E94FFB60(v15))
    {
      v20 = (objc_class *)MEMORY[0x1A6227910](@"MKMapSnapshotOptions", @"MapKit");
      if (v20)
      {
        id v21 = objc_alloc_init(v20);
        [v21 setMapType:0];
        v60 = objc_msgSend((id)MEMORY[0x1A6227910](@"UITraitCollection", @"UIKit"), "traitCollectionWithUserInterfaceStyle:", a6);
        [v21 setTraitCollection:v60];
        [v21 _setUseSnapshotService:1];
        [a1 mapThumbnailFillSizeForWidth:a5->var0];
        double v23 = v22;
        double v25 = v24;
        if (qword_1E94FFB78 != -1) {
          dispatch_once(&qword_1E94FFB78, &unk_1EF2C09C0);
        }
        off_1E94FFB70(v17, v19, 500.0, 500.0);
        objc_msgSend(v21, "setRegion:");
        objc_msgSend(v21, "setSize:", v23 * (1.0 / a5->var2), v25 * (1.0 / a5->var2));
        v26 = (objc_class *)MEMORY[0x1A6227910](@"MKMapSnapshotter", @"MapKit");
        if (!v26)
        {
          if (IMOSLoggingEnabled())
          {
            v45 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              v46 = objc_opt_class();
              *(_DWORD *)v74 = 138412802;
              *(void *)&v74[4] = v46;
              *(_WORD *)&v74[12] = 2112;
              *(void *)&v74[14] = @"MKMapSnapshotter";
              *(_WORD *)&v74[22] = 2112;
              v75 = (uint64_t (*)(uint64_t, uint64_t))@"MapKit";
              id v47 = v46;
              _os_log_impl(&dword_1A0772000, v45, OS_LOG_TYPE_INFO, "%@ = Failed weak linking %@ from %@.", v74, 0x20u);
            }
          }
          if (a7)
          {
            [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:10 userInfo:0];
            Copy = 0;
            *a7 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            Copy = 0;
          }
          goto LABEL_63;
        }
        v59 = (void *)[[v26 alloc] initWithOptions:v21];
        *(void *)v74 = 0;
        *(void *)&v74[8] = v74;
        *(void *)&v74[16] = 0x3032000000;
        v75 = sub_1A07778FC;
        v76 = sub_1A077776C;
        id v77 = 0;
        uint64_t v66 = 0;
        v67 = &v66;
        uint64_t v68 = 0x2020000000;
        char v69 = 0;
        v27 = dispatch_group_create();
        dispatch_group_enter(v27);
        v28 = [a1 mapSnapshotterQueue];
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = sub_1A0857198;
        v61[3] = &unk_1E5A14830;
        v64 = &v66;
        id v65 = a1;
        v63 = v74;
        v29 = v27;
        v62 = v29;
        [v59 startWithQueue:v28 completionHandler:v61];

        dispatch_time_t v30 = dispatch_time(0, 20000000000);
        if (dispatch_group_wait(v29, v30))
        {
          if (IMOSLoggingEnabled())
          {
            v31 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              v32 = objc_opt_class();
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v32;
              id v33 = v32;
              _os_log_impl(&dword_1A0772000, v31, OS_LOG_TYPE_INFO, "%@ - Map snapshot generation timed out", buf, 0xCu);
            }
          }
          if (a7)
          {
            *a7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:12 userInfo:0];
          }
          *((unsigned char *)v67 + 24) = 0;
        }
        else if (*((unsigned char *)v67 + 24))
        {
          v48 = (void *)MEMORY[0x1A6227910](@"_UIBackdropViewSettings", @"UIKit");
          if (v48)
          {
            if (a6 == 2) {
              uint64_t v49 = 2030;
            }
            else {
              uint64_t v49 = 2020;
            }
            long long v50 = *(_OWORD *)&a5->var1.height;
            *(_OWORD *)buf = *(_OWORD *)&a5->var0;
            long long v72 = v50;
            uint64_t v73 = *(void *)&a5->var3;
            v51 = objc_msgSend(a1, "titleBarMaskImageForWidth:constraints:error:", buf, a7, v23, v21);
            if (v51)
            {
              v52 = [v48 settingsForPrivateStyle:v49 graphicsQuality:100];
              [v52 setGrayscaleTintMaskImage:v51];
              [v52 setColorTintMaskImage:v51];
              [v52 setFilterMaskImage:v51];
              uint64_t v53 = [*(id *)(*(void *)&v74[8] + 40) _applyBackdropViewSettings:v52];
              v54 = *(void **)(*(void *)&v74[8] + 40);
              *(void *)(*(void *)&v74[8] + 40) = v53;

              Copy = CGImageCreateCopy((CGImageRef)[*(id *)(*(void *)&v74[8] + 40) CGImage]);
            }
            else
            {
              Copy = 0;
            }

            goto LABEL_62;
          }
          if (IMOSLoggingEnabled())
          {
            v55 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              v56 = objc_opt_class();
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v56;
              id v57 = v56;
              _os_log_impl(&dword_1A0772000, v55, OS_LOG_TYPE_INFO, "%@ - Failed to link __UIBackdropViewSettingsClass", buf, 0xCu);
            }
          }
          if (!a7 || *a7) {
            goto LABEL_19;
          }
          goto LABEL_52;
        }
        if (!a7 || *a7)
        {
LABEL_19:
          Copy = 0;
LABEL_62:

          _Block_object_dispose(&v66, 8);
          _Block_object_dispose(v74, 8);

LABEL_63:
          goto LABEL_66;
        }
LABEL_52:
        [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:1 userInfo:0];
        Copy = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_62;
      }
      if (IMOSLoggingEnabled())
      {
        v42 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          v43 = objc_opt_class();
          *(_DWORD *)v74 = 138412802;
          *(void *)&v74[4] = v43;
          *(_WORD *)&v74[12] = 2112;
          *(void *)&v74[14] = @"MKMapSnapshotOptions";
          *(_WORD *)&v74[22] = 2112;
          v75 = (uint64_t (*)(uint64_t, uint64_t))@"MapKit";
          id v44 = v43;
          _os_log_impl(&dword_1A0772000, v42, OS_LOG_TYPE_INFO, "%@ = Failed weak linking %@ from %@.", v74, 0x20u);
        }
      }
      if (a7)
      {
        id v38 = [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:10 userInfo:0];
        goto LABEL_38;
      }
LABEL_65:
      Copy = 0;
      goto LABEL_66;
    }
    if (IMOSLoggingEnabled())
    {
      v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v40 = objc_opt_class();
        *(_DWORD *)v74 = 138412546;
        *(void *)&v74[4] = v40;
        *(_WORD *)&v74[12] = 2112;
        *(void *)&v74[14] = v12;
        id v41 = v40;
        _os_log_impl(&dword_1A0772000, v39, OS_LOG_TYPE_INFO, "%@ - Unable to parse coordinate for for %@", v74, 0x16u);
      }
    }
    if (!a7) {
      goto LABEL_65;
    }
    id v38 = [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:11 userInfo:0];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        v36 = objc_opt_class();
        *(_DWORD *)v74 = 138412290;
        *(void *)&v74[4] = v36;
        id v37 = v36;
        _os_log_impl(&dword_1A0772000, v35, OS_LOG_TYPE_INFO, "%@ - sourceURL is nil", v74, 0xCu);
      }
    }
    if (!a7) {
      goto LABEL_65;
    }
    id v38 = [MEMORY[0x1E4F28C58] errorWithDomain:@"__kIMPreviewGenerationErrorDomain" code:5 userInfo:0];
  }
LABEL_38:
  Copy = 0;
  *a7 = v38;
LABEL_66:
  os_activity_scope_leave(&state);

  return Copy;
}

+ (BOOL)writesToDisk
{
  return 0;
}

+ (id)mapSnapshotterQueue
{
  if (qword_1E94FFB88 != -1) {
    dispatch_once(&qword_1E94FFB88, &unk_1EF2C0A80);
  }
  v2 = (void *)qword_1E94FFB80;

  return v2;
}

+ (CGSize)mapThumbnailFillSizeForWidth:(double)a3
{
  double v3 = a3 / 1.33333333;
  double v4 = round(a3);
  double v5 = round(v3);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (id)vCardDataForURL:(id)a3
{
  if (a3)
  {
    double v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3 options:8 error:0];
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

+ (id)vCardURLSForData:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    double v4 = (void *)MEMORY[0x1A6227910](@"CNContactVCardSerialization", @"Contacts");
    if (v4)
    {
      id v12 = 0;
      double v5 = [v4 contactsWithData:v3 error:&v12];
      id v6 = v12;
      if (!v6 && v5 && [v5 count])
      {
        v7 = [v5 firstObject];
        v8 = [v7 urlAddresses];

        goto LABEL_17;
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v14 = v6;
          _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "IMMapPreviewGenerator - Unable to extract contact for data. Error %@", buf, 0xCu);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "IMMapPreviewGenerator - Unable to weaklink CNContactVCardSerialization", buf, 2u);
      }
    }
  }
  v8 = 0;
LABEL_17:

  return v8;
}

+ (BOOL)supportsBlastDoor
{
  return 1;
}

+ (CLLocationCoordinate2D)coordinateForvCardURL:(id)a3 senderContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[IMMapPreviewGenerator supportsBlastDoor])
  {
    if (qword_1E94FFB98 != -1) {
      dispatch_once(&qword_1E94FFB98, &unk_1EF2C0C20);
    }
    v8 = [a1 vCardDataForURL:v6];
    uint64_t v21 = 0;
    double v22 = (double *)&v21;
    uint64_t v23 = 0x3010000000;
    double v25 = 0.0;
    uint64_t v26 = 0;
    double v24 = &unk_1A0A86C2F;
    double v25 = sub_1A0857834();
    uint64_t v26 = v9;
    if (v8)
    {
      v10 = dispatch_group_create();
      dispatch_group_enter(v10);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = sub_1A085787C;
      v18[3] = &unk_1E5A10768;
      v20 = &v21;
      v11 = v10;
      double v19 = v11;
      +[IMAttachmentBlastdoor sendData:v8 senderContext:v7 forPreviewType:0 withCompletionBlock:v18];
      dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      double v12 = v22[4];
      double v13 = v22[5];
    }
    else
    {
      double v12 = v22[4];
      double v13 = v22[5];
    }
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    [a1 _legacyCoordinateForvCardURL:v6];
    double v12 = v14;
    double v13 = v15;
  }

  double v16 = v12;
  double v17 = v13;
  result.longitude = v17;
  result.latitude = v16;
  return result;
}

+ (CLLocationCoordinate2D)_legacyCoordinateForvCardURL:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (qword_1E94FFBA8 != -1) {
    dispatch_once(&qword_1E94FFBA8, &unk_1EF2BFD40);
  }
  double v5 = [a1 vCardDataForURL:v4];
  id v6 = [a1 vCardURLSForData:v5];
  double v7 = sub_1A0857834();
  double v9 = v8;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (!v10) {
    goto LABEL_25;
  }
  uint64_t v11 = v10;
  v43 = v5;
  id v44 = v4;
  uint64_t v12 = *(void *)v48;
  double v13 = obj;
  id v46 = a1;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v48 != v12) {
        objc_enumerationMutation(v13);
      }
      double v15 = (void *)MEMORY[0x1E4F1CB10];
      double v16 = objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * i), "value", v43, v44);
      double v17 = [v15 URLWithString:v16];

      double v18 = [v17 host];
      double v19 = [MEMORY[0x1E4F29088] componentsWithURL:v17 resolvingAgainstBaseURL:0];
      if ([v18 isEqualToString:@"maps.apple.com"])
      {
        v20 = [a1 valueForKey:@"sll" forURLComponents:v19];
        uint64_t v21 = v20;
        if (v20)
        {
          id v22 = v20;
        }
        else
        {
          id v22 = [a1 valueForKey:@"ll" forURLComponents:v19];
        }
        uint64_t v23 = v22;

        double v24 = [v23 componentsSeparatedByString:@","];
        if ([v24 count] == 2)
        {
          v27 = (double (*)(uint64_t, double, double))off_1E94FFBA0;
          double v25 = [v24 objectAtIndex:0];
          [v25 doubleValue];
          double v29 = v28;
          uint64_t v26 = [v24 objectAtIndex:1];
          uint64_t v30 = [v26 doubleValue];
          double v7 = v27(v30, v29, v31);
          double v9 = v32;
LABEL_23:

          goto LABEL_24;
        }
      }
      else
      {
        if (![v18 isEqualToString:@"maps.google.com"]) {
          goto LABEL_18;
        }
        uint64_t v23 = [a1 valueForKey:@"q" forURLComponents:v19];
        double v24 = [v23 componentsSeparatedByString:@" "];
        if ([v24 count])
        {
          double v25 = [v24 objectAtIndex:0];
          uint64_t v26 = [v25 componentsSeparatedByString:@","];
          if ([v26 count] == 2)
          {
            id v33 = (double (*)(uint64_t, double, double))off_1E94FFBA0;
            v34 = [v26 objectAtIndex:0];
            [v34 doubleValue];
            double v36 = v35;
            id v37 = [v26 objectAtIndex:1];
            uint64_t v38 = [v37 doubleValue];
            double v7 = v33(v38, v36, v39);
            double v9 = v40;

            goto LABEL_23;
          }

          double v13 = obj;
        }
      }

      a1 = v46;
LABEL_18:
    }
    uint64_t v11 = [v13 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v11) {
      continue;
    }
    break;
  }
LABEL_24:
  double v5 = v43;
  id v4 = v44;
LABEL_25:

  double v41 = v7;
  double v42 = v9;
  result.longitude = v42;
  result.latitude = v41;
  return result;
}

+ (id)valueForKey:(id)a3 forURLComponents:(id)a4
{
  id v5 = a3;
  id v6 = [a4 queryItems];
  double v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"name=%@", v5];

  double v8 = [v6 filteredArrayUsingPredicate:v7];
  double v9 = [v8 firstObject];

  uint64_t v10 = [v9 value];

  return v10;
}

+ (id)titleBarMaskImageForWidth:(double)a3 constraints:(IMPreviewConstraints *)a4 error:(id *)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v38 = 0;
  double v39 = &v38;
  uint64_t v40 = 0x2050000000;
  double v9 = (void *)qword_1E94FFBC8;
  uint64_t v41 = qword_1E94FFBC8;
  if (!qword_1E94FFBC8)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = sub_1A0858634;
    v43 = (__CFString *)&unk_1E5A10130;
    id v44 = &v38;
    sub_1A0858634((uint64_t)buf);
    double v9 = (void *)v39[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v38, 8);
  if (!v10 && IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = @"UIColor";
      *(_WORD *)&buf[22] = 2112;
      v43 = @"UIKit";
      id v13 = v12;
      _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "%@ = Failed soft linking %@ from %@.", buf, 0x20u);
    }
  }
  if ((!sub_1A08586E8() || !sub_1A085882C()) && IMOSLoggingEnabled())
  {
    double v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      double v15 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = @"UIGraphicsBeginImageContextWithOptions";
      *(_WORD *)&buf[22] = 2112;
      v43 = @"UIKit";
      id v16 = v15;
      _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "%@ = Failed soft linking %@ from %@.", buf, 0x20u);
    }
  }
  if ((!sub_1A08586E8() || !sub_1A085896C()) && IMOSLoggingEnabled())
  {
    double v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      double v18 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = @"UIGraphicsGetImageFromCurrentImageContext";
      *(_WORD *)&buf[22] = 2112;
      v43 = @"UIKit";
      id v19 = v18;
      _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "%@ = Failed soft linking %@ from %@.", buf, 0x20u);
    }
  }
  if ((!sub_1A08586E8() || !sub_1A0858AAC()) && IMOSLoggingEnabled())
  {
    v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = @"UIRectFill";
      *(_WORD *)&buf[22] = 2112;
      v43 = @"UIKit";
      id v22 = v21;
      _os_log_impl(&dword_1A0772000, v20, OS_LOG_TYPE_INFO, "%@ = Failed soft linking %@ from %@.", buf, 0x20u);
    }
  }
  if ((!sub_1A08586E8() || !sub_1A0858BEC()) && IMOSLoggingEnabled())
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      double v24 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v24;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = @"UIGraphicsEndImageContext";
      *(_WORD *)&buf[22] = 2112;
      v43 = @"UIKit";
      id v25 = v24;
      _os_log_impl(&dword_1A0772000, v23, OS_LOG_TYPE_INFO, "%@ = Failed soft linking %@ from %@.", buf, 0x20u);
    }
  }
  if (v10
    && sub_1A08586E8()
    && sub_1A085882C()
    && sub_1A08586E8()
    && sub_1A085896C()
    && sub_1A08586E8()
    && sub_1A0858AAC()
    && sub_1A08586E8()
    && sub_1A0858BEC())
  {
    objc_msgSend(a1, "mapThumbnailFillSizeForWidth:", a3, v38);
    double v27 = v26;
    double v29 = v28;
    double var2 = a4->var2;
    double v31 = (void (*)(void, double, double, double))sub_1A085882C();
    if (!v31) {
      goto LABEL_46;
    }
    v31(0, v27, v29, 0.0);
    double v32 = [v10 blackColor];
    [v32 set];

    id v33 = (void (*)(double, double, double))sub_1A0858AAC();
    if (!v33
      || (v33(0.0, v29 - var2 * 37.5, v27), (v34 = (void (*)(void))sub_1A085896C()) == 0)
      || (v34(), double v35 = objc_claimAutoreleasedReturnValue(), (v36 = (void (*)(void))sub_1A0858BEC()) == 0))
    {
LABEL_46:
      sub_1A09EEB7C();
      __break(1u);
      JUMPOUT(0x1A08584B0);
    }
    v36();
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"__kIMPreviewGenerationErrorDomain", 10, 0, v38);
    double v35 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v35 = 0;
  }

  return v35;
}

@end