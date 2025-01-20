@interface NSTextContainer(CKBalloonTextView)
- (CGFloat)sizeThatFits:()CKBalloonTextView textAlignmentInsets:isSingleLine:;
@end

@implementation NSTextContainer(CKBalloonTextView)

- (CGFloat)sizeThatFits:()CKBalloonTextView textAlignmentInsets:isSingleLine:
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  v7 = [a1 layoutManager];
  v8 = [v7 textStorage];
  [v7 ensureLayoutForTextContainer:a1];
  [v7 glyphRangeForTextContainer:a1];
  [v7 usedRectForTextContainer:a1];
  size.width = v9;
  double v11 = v10;
  if (![v8 length] || !(a3 | a4)) {
    goto LABEL_42;
  }
  v72[0] = 0;
  v72[1] = 0;
  [v7 lineFragmentUsedRectForGlyphAtIndex:0 effectiveRange:v72];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  v20 = [MEMORY[0x1E4FB08D8] sharedSystemTypesetter];
  [v20 baselineOffsetInLayoutManager:v7 glyphIndex:0];
  double v22 = v21;

  v23 = [v8 attribute:*MEMORY[0x1E4FB0730] atIndex:0 effectiveRange:0];
  v24 = v23;
  if (v23)
  {
    id v25 = v23;
  }
  else
  {
    id v25 = [v8 attribute:*MEMORY[0x1E4FB06F8] atIndex:0 effectiveRange:0];
  }
  v26 = v25;

  v85.origin.x = v13;
  v85.origin.y = v15;
  v85.size.width = v17;
  v85.size.CGFloat height = v19;
  double MaxY = CGRectGetMaxY(v85);
  [v26 capHeight];
  double v29 = MaxY - v22 - v28;
  if (IMOSLoggingEnabled())
  {
    v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v86.origin.x = v13;
      v86.origin.y = v15;
      v86.size.width = v17;
      v86.size.CGFloat height = v19;
      NSStringFromCGRect(v86);
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      v87.origin.x = v13;
      v87.origin.y = v15;
      v87.size.width = v17;
      v87.size.CGFloat height = v19;
      CGFloat v32 = CGRectGetMaxY(v87);
      [v26 capHeight];
      *(_DWORD *)buf = 134219010;
      double v74 = v29;
      __int16 v75 = 2112;
      id v76 = v31;
      __int16 v77 = 2048;
      CGFloat v78 = v32;
      __int16 v79 = 2048;
      double v80 = v22;
      __int16 v81 = 2048;
      uint64_t v82 = v33;
      _os_log_impl(&dword_18EF18000, v30, OS_LOG_TYPE_INFO, "capOffsetFromBoundsTop (%f) = (CGRectGetMaxY(firstLine (%@)) (%f) - firstLineBaselineOffset (%f) - [font capHeight] (%f))", buf, 0x34u);
    }
  }
  unint64_t v34 = [v7 numberOfGlyphs];
  if (v34)
  {
    size.CGFloat height = 0.0;
    uint64_t v71 = 0;
    unint64_t v35 = [a1 maximumNumberOfLines];
    if (v35)
    {
      uint64_t v36 = 0;
      double v37 = *MEMORY[0x1E4F1DB28];
      double v38 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v39 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v40 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      double v41 = *MEMORY[0x1E4F1DB30];
      double v42 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      unint64_t v43 = 1;
      do
      {
        [v7 lineFragmentUsedRectForGlyphAtIndex:v36 effectiveRange:&size.height];
        if (v46 != v41 || v47 != v42)
        {
          double v37 = v44;
          double v38 = v45;
          double v39 = v46;
          double v40 = v47;
        }
        CGFloat height = size.height;
        uint64_t v36 = v71 + *(void *)&size.height;
      }
      while (v71 + *(void *)&size.height < v34 && v43++ < v35);
    }
    else
    {
      *(void *)&CGFloat height = v34 - 1;
      [v7 lineFragmentUsedRectForGlyphAtIndex:v34 - 1 effectiveRange:&size.height];
      double v37 = v52;
      double v38 = v53;
      double v39 = v54;
      double v40 = v55;
    }
    v56 = [MEMORY[0x1E4FB08D8] sharedSystemTypesetter];
    [v56 baselineOffsetInLayoutManager:v7 glyphIndex:*(void *)&height];
    double v58 = v57;

    v88.origin.x = v37;
    v88.origin.y = v38;
    v88.size.width = v39;
    v88.size.CGFloat height = v40;
    double v51 = CGRectGetMaxY(v88) - v58;
    if (IMOSLoggingEnabled())
    {
      v59 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        v89.origin.x = v37;
        v89.origin.y = v38;
        v89.size.width = v39;
        v89.size.CGFloat height = v40;
        NSStringFromCGRect(v89);
        id v60 = (id)objc_claimAutoreleasedReturnValue();
        v90.origin.x = v37;
        v90.origin.y = v38;
        v90.size.width = v39;
        v90.size.CGFloat height = v40;
        CGFloat v61 = CGRectGetMaxY(v90);
        *(_DWORD *)buf = 134218754;
        double v74 = v51;
        __int16 v75 = 2112;
        id v76 = v60;
        __int16 v77 = 2048;
        CGFloat v78 = v61;
        __int16 v79 = 2048;
        double v80 = v58;
        _os_log_impl(&dword_18EF18000, v59, OS_LOG_TYPE_INFO, "lastLineBaselineOffsetFromBoundsTop (%f) = (CGRectGetMaxY(lastLine (%@)) (%f) - lastLineBaselineOffset (%f))", buf, 0x2Au);
      }
    }
    LOBYTE(v34) = v71 == v34;
    if (!a3) {
      goto LABEL_36;
    }
    goto LABEL_32;
  }
  double v51 = 0.0;
  if (a3)
  {
LABEL_32:
    [a1 lineFragmentPadding];
    *(double *)a3 = v29;
    *(void *)(a3 + 8) = v62;
    *(double *)(a3 + 16) = v11 - v51;
    *(void *)(a3 + 24) = v62;
    if (IMOSLoggingEnabled())
    {
      v63 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
      {
        v64 = NSStringFromUIEdgeInsets(*(UIEdgeInsets *)a3);
        *(_DWORD *)buf = 138412290;
        double v74 = *(double *)&v64;
        _os_log_impl(&dword_18EF18000, v63, OS_LOG_TYPE_INFO, "-> textAlignmentInsets: %@", buf, 0xCu);
      }
    }
  }
LABEL_36:
  if (a4)
  {
    *(unsigned char *)a4 = v34;
    if (IMOSLoggingEnabled())
    {
      v65 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        int v66 = *(unsigned __int8 *)a4;
        *(_DWORD *)buf = 67109120;
        LODWORD(v74) = v66;
        _os_log_impl(&dword_18EF18000, v65, OS_LOG_TYPE_INFO, "-> isSingleLine: %d", buf, 8u);
      }
    }
  }

LABEL_42:
  if (IMOSLoggingEnabled())
  {
    v67 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
    {
      v84.width = size.width;
      v84.CGFloat height = v11;
      v68 = NSStringFromCGSize(v84);
      *(_DWORD *)buf = 138412290;
      double v74 = *(double *)&v68;
      _os_log_impl(&dword_18EF18000, v67, OS_LOG_TYPE_INFO, "-> sizeThatFits %@", buf, 0xCu);
    }
  }

  return size.width;
}

@end