@interface CKMessagesComplicationDataContext
- (BOOL)isEqual:(id)a3;
- (CGPoint)bubbleTextOrigin;
- (CGRect)_scaledImageFramePerAspectRatioForFamily:(int64_t)a3 specs:(id)a4 imageSize:(CGSize)a5;
- (CGRect)backgroundFrame;
- (CGRect)bubbleFrame;
- (CGRect)imageFrame;
- (CGRect)textFrame;
- (CKMessagesComplicationDataContext)init;
- (CKMessagesComplicationDataContext)initWithUnreadCount:(unint64_t)a3 family:(int64_t)a4 template:(id)a5 specs:(id)a6 imageSize:(CGSize)a7;
- (NSDictionary)textAttributes;
- (NSString)bubbleText;
- (int64_t)family;
- (unint64_t)hash;
- (unint64_t)unreadCount;
- (void)setBackgroundFrame:(CGRect)a3;
- (void)setBubbleFrame:(CGRect)a3;
- (void)setBubbleText:(id)a3;
- (void)setBubbleTextOrigin:(CGPoint)a3;
- (void)setFamily:(int64_t)a3;
- (void)setImageFrame:(CGRect)a3;
- (void)setTextAttributes:(id)a3;
- (void)setTextFrame:(CGRect)a3;
- (void)setUnreadCount:(unint64_t)a3;
@end

@implementation CKMessagesComplicationDataContext

- (CKMessagesComplicationDataContext)init
{
}

- (CKMessagesComplicationDataContext)initWithUnreadCount:(unint64_t)a3 family:(int64_t)a4 template:(id)a5 specs:(id)a6 imageSize:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  uint64_t v195 = *MEMORY[0x263EF8340];
  id v13 = a5;
  id v14 = a6;
  v186.receiver = self;
  v186.super_class = (Class)CKMessagesComplicationDataContext;
  v15 = [(CKMessagesComplicationDataContext *)&v186 init];
  if (v15)
  {
    v16 = os_log_create("com.apple.Messages", "CKMessagesComplicationDataContext");
    *((void *)v15 + 1) = a4;
    *((void *)v15 + 2) = a3;
    if ((objc_msgSend_unreadCountShouldBeDrawnOnBubbleForFamily_(v14, v17, v18, v19, v20, v21, a4) & 1) == 0) {
      *((void *)v15 + 2) = 0;
    }
    objc_msgSend_canvasSizeForFamily_andTemplate_(v14, v22, v23, v24, v25, v26, a4, v13);
    double v31 = v30;
    double v32 = *MEMORY[0x263F001B0];
    double v33 = *(double *)(MEMORY[0x263F001B0] + 8);
    if (v28 == *MEMORY[0x263F001B0] && v31 == v33) {
      sub_238840D04();
    }
    *((void *)v15 + 7) = 0;
    *((void *)v15 + 8) = 0;
    v35 = v15 + 56;
    *((double *)v15 + 9) = v28;
    *((double *)v15 + 10) = v31;
    objc_msgSend_imageFramePaddingForFamily_(v14, v27, v28, v32, v33, v29, a4);
    if (v37 <= 0.0)
    {
      long long v43 = *(_OWORD *)(v15 + 72);
      *(_OWORD *)(v15 + 88) = *v35;
      *(_OWORD *)(v15 + 104) = v43;
    }
    else
    {
      CGFloat v40 = floor(v31 * v37);
      *(CGRect *)(&v38 - 2) = CGRectInset(*(CGRect *)(v15 + 56), v40, v40);
      *((void *)v15 + 11) = v41;
      *((void *)v15 + 12) = v42;
      *((double *)v15 + 13) = v38;
      *((double *)v15 + 14) = v39;
    }
    objc_msgSend__scaledImageFramePerAspectRatioForFamily_specs_imageSize_(v15, v36, width, height, v38, v39, a4, v14);
    *((double *)v15 + 11) = v44;
    *((double *)v15 + 12) = v45;
    v46 = v15 + 88;
    *((double *)v15 + 13) = v47;
    *((double *)v15 + 14) = v48;
    if (objc_msgSend_needToScaleToFillForFamily_(v14, v49, v44, v45, v47, v48, a4))
    {
      long long v50 = *(_OWORD *)(v15 + 104);
      _OWORD *v35 = *v46;
      *(_OWORD *)(v15 + 72) = v50;
    }
    if (*((void *)v15 + 2))
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349312;
        unint64_t v192 = a3;
        __int16 v193 = 2050;
        int64_t v194 = a4;
        _os_log_impl(&dword_23883B000, v16, OS_LOG_TYPE_DEFAULT, "drawing unread count %{public}lu onto image for family %{public}lu", buf, 0x16u);
      }
      if (a3 >= 0x63) {
        objc_msgSend_numberWithUnsignedInteger_(NSNumber, v51, v52, v53, v54, v55, 99);
      }
      else {
      uint64_t v56 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v51, v52, v53, v54, v55, a3);
      }
      v184 = (void *)v56;
      id v185 = v13;
      if (a3 < 0x64)
      {
        uint64_t v92 = objc_msgSend_localizedStringFromNumber_numberStyle_(MEMORY[0x263F08A30], v57, v58, v59, v60, v61, v56, 0);
        v82 = (void *)*((void *)v15 + 3);
        *((void *)v15 + 3) = v92;
      }
      else
      {
        v62 = NSString;
        v63 = (void *)MEMORY[0x263F086E0];
        uint64_t v64 = objc_opt_class();
        v70 = objc_msgSend_bundleForClass_(v63, v65, v66, v67, v68, v69, v64);
        v76 = objc_msgSend_localizedStringForKey_value_table_(v70, v71, v72, v73, v74, v75, @"99+_UNREAD", &stru_26EB841C8, @"MessagesComplication");
        v82 = objc_msgSend_stringWithFormat_(v62, v77, v78, v79, v80, v81, v76, 99);

        uint64_t v88 = objc_msgSend_stringWithFormat_(NSString, v83, v84, v85, v86, v87, @"\u200E%@", v82);
        v89 = (void *)*((void *)v15 + 3);
        *((void *)v15 + 3) = v88;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v96 = *((void *)v15 + 3);
        *(_DWORD *)buf = 138543362;
        unint64_t v192 = v96;
        _os_log_impl(&dword_23883B000, v16, OS_LOG_TYPE_DEFAULT, "got formatted unread count: %{public}@", buf, 0xCu);
      }
      double v97 = *MEMORY[0x263F1D340];
      v98 = objc_msgSend_systemFontOfSize_weight_(MEMORY[0x263F1C658], v93, 12.0, *MEMORY[0x263F1D340], v94, v95);
      v99 = v16;
      uint64_t v189 = *MEMORY[0x263F1C238];
      uint64_t v100 = v189;
      v190 = v98;
      v106 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v101, v102, v103, v104, v105, &v190, &v189, 1);
      objc_msgSend_sizeWithAttributes_(*((void **)v15 + 3), v107, v108, v109, v110, v111, v106);
      double v113 = 12.0 / v112;
      CGFloat v114 = CGRectGetHeight(*(CGRect *)(v15 + 88));
      v118 = objc_msgSend_systemFontOfSize_weight_(MEMORY[0x263F1C658], v115, ceil(v113 * v114 * 0.5), v97, v116, v117);

      objc_msgSend_pointSize(v118, v119, v120, v121, v122, v123);
      v188[0] = v118;
      uint64_t v125 = *MEMORY[0x263F1C248];
      v187[0] = v100;
      v187[1] = v125;
      v129 = objc_msgSend_numberWithDouble_(NSNumber, v126, v124 * -30.0 / 1000.0, 1000.0, v127, v128);
      v188[1] = v129;
      v187[2] = *MEMORY[0x263F1C240];
      v135 = objc_msgSend_blackColor(MEMORY[0x263F1C550], v130, v131, v132, v133, v134);
      v188[2] = v135;
      uint64_t v141 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v136, v137, v138, v139, v140, v188, v187, 3);
      v142 = (void *)*((void *)v15 + 4);
      *((void *)v15 + 4) = v141;

      v16 = v99;
      long long v143 = *v46;
      *(_OWORD *)(v15 + 136) = *(_OWORD *)(v15 + 104);
      *(_OWORD *)(v15 + 120) = v143;
      double v144 = *((double *)v15 + 17);
      double v145 = *((double *)v15 + 18);
      *(double *)&long long v143 = floor(v145 / 1.12);
      *((void *)v15 + 18) = v143;
      objc_msgSend_boundingRectWithSize_options_attributes_context_(*((void **)v15 + 3), v146, v144, *(double *)&v143, v145, v147, 1, *((void *)v15 + 4), 0);
      v153 = objc_msgSend_mainScreen(MEMORY[0x263F1C920], v148, v149, v150, v151, v152);
      objc_msgSend_scale(v153, v154, v155, v156, v157, v158);
      UIRectIntegralWithScale();

      v164 = objc_msgSend_mainScreen(MEMORY[0x263F1C920], v159, v160, v161, v162, v163);
      objc_msgSend_scale(v164, v165, v166, v167, v168, v169);
      uint64_t v183 = v170;
      UIRectCenteredIntegralRectScale();
      *((void *)v15 + 19) = v171;
      *((void *)v15 + 20) = v172;
      *((void *)v15 + 21) = v173;
      *((void *)v15 + 22) = v174;

      uint64_t v90 = *((void *)v15 + 19);
      double v175 = *((double *)v15 + 20);
      objc_msgSend_verticalTextOffsetForFamily_(v14, v176, v177, v178, v179, v180, a4, v183);
      double v91 = v175 + v181;

      id v13 = v185;
    }
    else
    {
      uint64_t v90 = *((void *)v15 + 11);
      double v91 = *((double *)v15 + 12);
    }
    *((void *)v15 + 5) = v90;
    *((double *)v15 + 6) = v91;
  }
  return (CKMessagesComplicationDataContext *)v15;
}

- (CGRect)_scaledImageFramePerAspectRatioForFamily:(int64_t)a3 specs:(id)a4 imageSize:(CGSize)a5
{
  CGFloat x = self->_imageFrame.origin.x;
  double y = self->_imageFrame.origin.y;
  double width = self->_imageFrame.size.width;
  double height = self->_imageFrame.size.height;
  double v11 = a5.width / a5.height;
  if (a5.width / a5.height > 1.0)
  {
    if (objc_msgSend_needToScaleToFillForFamily_(a4, a2, 1.0, a5.height, v5, v6, a3))
    {
      double width = ceil(v11 * self->_imageFrame.size.width);
    }
    else
    {
      double v13 = self->_imageFrame.size.height;
      double height = floor(v13 / v11);
      double y = self->_imageFrame.origin.y + (v13 - height) * 0.5;
    }
  }
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    famildouble y = self->_family;
    if (family != objc_msgSend_family(v5, v7, v8, v9, v10, v11)) {
      goto LABEL_8;
    }
    unint64_t unreadCount = self->_unreadCount;
    if (unreadCount != objc_msgSend_unreadCount(v5, v12, v13, v14, v15, v16)) {
      goto LABEL_8;
    }
    objc_msgSend_backgroundFrame(v5, v18, v19, v20, v21, v22);
    v47.origin.CGFloat x = v23;
    v47.origin.double y = v24;
    v47.size.double width = v25;
    v47.size.double height = v26;
    if (!CGRectEqualToRect(self->_backgroundFrame, v47)) {
      goto LABEL_8;
    }
    objc_msgSend_bubbleFrame(v5, v27, v28, v29, v30, v31);
    v48.origin.CGFloat x = v32;
    v48.origin.double y = v33;
    v48.size.double width = v34;
    v48.size.double height = v35;
    if (CGRectEqualToRect(self->_bubbleFrame, v48))
    {
      objc_msgSend_imageFrame(v5, v36, v37, v38, v39, v40);
      v49.origin.CGFloat x = v41;
      v49.origin.double y = v42;
      v49.size.double width = v43;
      v49.size.double height = v44;
      BOOL v45 = CGRectEqualToRect(self->_imageFrame, v49);
    }
    else
    {
LABEL_8:
      BOOL v45 = 0;
    }
  }
  else
  {
    BOOL v45 = 0;
  }

  return v45;
}

- (unint64_t)hash
{
  return self->_unreadCount ^ self->_family ^ ((*(void *)&self->_backgroundFrame.size.height ^ (*(void *)&self->_backgroundFrame.size.width << 10))
                                             + (*(void *)&self->_backgroundFrame.origin.y ^ (*(void *)&self->_backgroundFrame.origin.x << 10))) ^ ((*(void *)&self->_bubbleFrame.size.height ^ (*(void *)&self->_bubbleFrame.size.width << 10)) + (*(void *)&self->_bubbleFrame.origin.y ^ (*(void *)&self->_bubbleFrame.origin.x << 10))) ^ ((*(void *)&self->_imageFrame.size.height ^ (*(void *)&self->_imageFrame.size.width << 10)) + (*(void *)&self->_imageFrame.origin.y ^ (*(void *)&self->_imageFrame.origin.x << 10)));
}

- (int64_t)family
{
  return self->_family;
}

- (void)setFamily:(int64_t)a3
{
  self->_famildouble y = a3;
}

- (unint64_t)unreadCount
{
  return self->_unreadCount;
}

- (void)setUnreadCount:(unint64_t)a3
{
  self->_unint64_t unreadCount = a3;
}

- (CGRect)backgroundFrame
{
  double x = self->_backgroundFrame.origin.x;
  double y = self->_backgroundFrame.origin.y;
  double width = self->_backgroundFrame.size.width;
  double height = self->_backgroundFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBackgroundFrame:(CGRect)a3
{
  self->_backgroundFrame = a3;
}

- (CGRect)imageFrame
{
  double x = self->_imageFrame.origin.x;
  double y = self->_imageFrame.origin.y;
  double width = self->_imageFrame.size.width;
  double height = self->_imageFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setImageFrame:(CGRect)a3
{
  self->_imageFrame = a3;
}

- (CGRect)bubbleFrame
{
  double x = self->_bubbleFrame.origin.x;
  double y = self->_bubbleFrame.origin.y;
  double width = self->_bubbleFrame.size.width;
  double height = self->_bubbleFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBubbleFrame:(CGRect)a3
{
  self->_bubbleFrame = a3;
}

- (CGRect)textFrame
{
  double x = self->_textFrame.origin.x;
  double y = self->_textFrame.origin.y;
  double width = self->_textFrame.size.width;
  double height = self->_textFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTextFrame:(CGRect)a3
{
  self->_textFrame = a3;
}

- (CGPoint)bubbleTextOrigin
{
  double x = self->_bubbleTextOrigin.x;
  double y = self->_bubbleTextOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBubbleTextOrigin:(CGPoint)a3
{
  self->_bubbleTextOrigin = a3;
}

- (NSString)bubbleText
{
  return self->_bubbleText;
}

- (void)setBubbleText:(id)a3
{
}

- (NSDictionary)textAttributes
{
  return self->_textAttributes;
}

- (void)setTextAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textAttributes, 0);

  objc_storeStrong((id *)&self->_bubbleText, 0);
}

@end