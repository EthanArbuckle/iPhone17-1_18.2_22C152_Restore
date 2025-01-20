@interface CHTextCorrectionRecognizer
+ (_NSRange)defaultTextAffectedRangeForTargetContentInfo:(id)a3;
+ (id)_improvedSingleCharacterOneColumnTextResult:(id)a3 targetContentInfo:(id)a4 insertionRange:(_NSRange)a5 locale:(id)a6 affectedRange:(_NSRange *)a7;
- (BOOL)isRemoteRecognition;
- (CHTextCorrectionRecognizer)initWithLocales:(id)a3 remoteRecognition:(BOOL)a4 priority:(int64_t)a5;
- (NSArray)locales;
- (id)textCorrectionResultForDrawing:(id)a3 targetContentInfo:(id)a4 originalDrawing:(id)a5 lastStroke:(id)a6 localTypedContextBounds:(CGRect)a7 normalizedDrawingScaleFactor:(double)a8 previousCorrectionResult:(id)a9 declaredVariables:(id)a10;
@end

@implementation CHTextCorrectionRecognizer

- (CHTextCorrectionRecognizer)initWithLocales:(id)a3 remoteRecognition:(BOOL)a4 priority:(int64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CHTextCorrectionRecognizer;
  v14 = [(CHTextCorrectionRecognizer *)&v38 init];
  if (v14)
  {
    uint64_t v15 = objc_msgSend_copy(v8, v9, v10, v11, v12, v13);
    locales = v14->_locales;
    v14->_locales = (NSArray *)v15;

    v14->_isRemoteRecognition = v6;
    uint64_t RecognizerForLocales_sessionMode_remote_priority = objc_msgSend_createRecognizerForLocales_sessionMode_remote_priority_(CHRecognitionSession, v17, (uint64_t)v8, 1, v6, a5);
    textRecognizer = v14->__textRecognizer;
    v14->__textRecognizer = (CHRecognizingText *)RecognizerForLocales_sessionMode_remote_priority;

    if (v6)
    {
      v20 = [CHRemoteSketchRecognizer alloc];
      v25 = (CHSketchRecognizer *)objc_msgSend_initWithPriority_(v20, v21, a5, v22, v23, v24);
    }
    else
    {
      v25 = objc_alloc_init(CHSketchRecognizer);
    }
    shapeRecognizer = v14->__shapeRecognizer;
    v14->__shapeRecognizer = (CHRecognizingSketch *)v25;

    objc_msgSend_setMaxRecognitionResultCount_(v14->__shapeRecognizer, v27, 3, v28, v29, v30);
    v31 = objc_alloc_init(CHCornerDetector);
    cornerDetector = v14->__cornerDetector;
    v14->__cornerDetector = v31;

    objc_msgSend_setShouldUseDynamicSampling_(v14->__cornerDetector, v33, 0, v34, v35, v36);
  }

  return v14;
}

- (id)textCorrectionResultForDrawing:(id)a3 targetContentInfo:(id)a4 originalDrawing:(id)a5 lastStroke:(id)a6 localTypedContextBounds:(CGRect)a7 normalizedDrawingScaleFactor:(double)a8 previousCorrectionResult:(id)a9 declaredVariables:(id)a10
{
  double height = a7.size.height;
  CGFloat rect = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat rect1_8 = a7.origin.x;
  uint64_t v1164 = *MEMORY[0x1E4F143B8];
  id v1147 = a3;
  id v1136 = a4;
  id v19 = a5;
  id rect1_24 = a6;
  id v1123 = a9;
  id v1128 = a10;
  v1146 = v19;
  uint64_t v25 = objc_msgSend_strokeCount(v19, v20, v21, v22, v23, v24);
  if (v25 != objc_msgSend_strokeCount(v1147, v26, v27, v28, v29, v30))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    uint64_t v36 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v36, OS_LOG_TYPE_FAULT, "The original and rescaled drawings should have equal stroke counts", buf, 2u);
    }
  }
  uint64_t v37 = objc_msgSend_pointCount(v19, v31, v32, v33, v34, v35);
  if (v37 != objc_msgSend_pointCount(v1147, v38, v39, v40, v41, v42))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v48 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C492D000, v48, OS_LOG_TYPE_FAULT, "The original and rescaled drawings should have equal total point counts", buf, 2u);
    }
  }
  if (objc_msgSend_strokeCount(v1147, v43, v44, v45, v46, v47) != 1) {
    goto LABEL_97;
  }
  v54 = objc_msgSend_locales(self, v49, v50, v51, v52, v53);
  v60 = objc_msgSend_firstObject(v54, v55, v56, v57, v58, v59);
  int shouldAllowSpaceInsertionGestureForLocale = objc_msgSend_shouldAllowSpaceInsertionGestureForLocale_(CHRecognizerConfiguration, v61, (uint64_t)v60, v62, v63, v64);

  if (!shouldAllowSpaceInsertionGestureForLocale) {
    goto LABEL_29;
  }
  id v66 = v1147;
  id v67 = v19;
  id v73 = v1136;
  if (!self) {
    goto LABEL_27;
  }
  if (objc_msgSend_strokeCount(v67, v68, v69, v70, v71, v72) != 1) {
    goto LABEL_27;
  }
  if ((unint64_t)objc_msgSend_pointCountForStrokeIndex_(v67, v74, 0, v75, v76, v77) < 2) {
    goto LABEL_27;
  }
  objc_msgSend_bounds(v67, v78, v79, v80, v81, v82);
  if (v88 >= 10.0) {
    goto LABEL_27;
  }
  objc_msgSend_bounds(v67, v83, v84, v85, v86, v87);
  if (v94 <= 10.0) {
    goto LABEL_27;
  }
  objc_msgSend_bounds(v67, v89, v90, v91, v92, v93);
  CGFloat v96 = v95;
  CGFloat v98 = v97;
  CGFloat v100 = v99;
  CGFloat v102 = v101;
  v103 = objc_opt_class();
  uint64_t v108 = objc_msgSend_defaultTextAffectedRangeForTargetContentInfo_(v103, v104, (uint64_t)v73, v105, v106, v107);
  buf[0] = 0;
  char v110 = sub_1C4BB7E40(v73, v108, v109, (BOOL *)buf, 0, 0, v96, v98, v100, v102, rect1_8, y, rect, height);
  char v114 = buf[0] ? 0 : v110;
  if (v114)
  {
    v115 = objc_msgSend_sketchRecognitionResultsForDrawing_options_(self->__shapeRecognizer, v111, (uint64_t)v66, 0, v112, v113);
    v123 = objc_msgSend_firstObject(v115, v116, v117, v118, v119, v120);
    if (v123
      && objc_msgSend_isVerticalBarShapeFromLineResult_originalDrawing_isDirectionDownward_(CHTextInputGesture, v121, (uint64_t)v123, (uint64_t)v67, 0, v122))
    {
      v1141 = objc_msgSend_indexSetWithIndex_(MEMORY[0x1E4F28D60], v124, 0, v125, v126, v127);
      objc_msgSend_boundsForStrokeIndexes_(v66, v128, (uint64_t)v1141, v129, v130, v131);
      v133 = objc_msgSend_tokenizedTextResultWithString_strokeIndexes_bounds_trailingSeparator_recognizerGenerationIdentifier_defaultTokenScores_(CHTokenizedTextResult, v132, @" ", (uint64_t)v1141, (uint64_t)&stru_1F20141C8, 0);
      v134 = [CHTextCorrectionResult alloc];
      v140 = objc_msgSend_textInputTarget(v73, v135, v136, v137, v138, v139);
      isCharacterLevel_error = objc_msgSend_initWithInputTarget_affectedRange_textResult_resultType_isCharacterLevel_error_(v134, v141, (uint64_t)v140, v108, 0, (uint64_t)v133, 7, 1, 0);
    }
    else
    {
      isCharacterLevel_error = 0;
    }
  }
  else
  {
LABEL_27:
    isCharacterLevel_error = 0;
  }

  if (!isCharacterLevel_error)
  {
LABEL_29:
    id v148 = v1147;
    id v149 = v1146;
    id v150 = v1136;
    if (!self)
    {
      isCharacterLevel_error = 0;
LABEL_48:

      if (isCharacterLevel_error) {
        goto LABEL_204;
      }
      if (objc_msgSend_strokeCoveredTextRange(v150, v143, v144, v145, v146, v147) == 0x7FFFFFFFFFFFFFFFLL
        || (objc_msgSend_containsCommittedStrokes(v150, v219, v220, v221, v222, v223) & 1) != 0)
      {
        goto LABEL_97;
      }
      id v1144 = v148;
      id v1133 = v149;
      id v1129 = rect1_24;
      id v224 = v150;
      id v1137 = v1123;
      if (!self)
      {
        v336 = 0;
        goto LABEL_89;
      }
      if (objc_msgSend_strokeCoveredTextRange(v224, v225, v226, v227, v228, v229) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v235 = (id)qword_1EA3C9F90[0];
        if (os_log_type_enabled(v235, OS_LOG_TYPE_FAULT))
        {
          v1166.location = objc_msgSend_strokeCoveredTextRange(v224, v236, v237, v238, v239, v240);
          v241 = NSStringFromRange(v1166);
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v241;
          _os_log_impl(&dword_1C492D000, v235, OS_LOG_TYPE_FAULT, "Invalid stroke covered range when recognizing editing gesture. %@", buf, 0xCu);
        }
      }
      if (objc_msgSend_strokeCount(v1144, v230, v231, v232, v233, v234) != 1)
      {
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v247 = (id)qword_1EA3C9F90[0];
        if (os_log_type_enabled(v247, OS_LOG_TYPE_FAULT))
        {
          uint64_t v253 = objc_msgSend_strokeCount(v1144, v248, v249, v250, v251, v252);
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v253;
          _os_log_impl(&dword_1C492D000, v247, OS_LOG_TYPE_FAULT, "Cannot recognize editing gesture for drawing with %ld strokes.", buf, 0xCu);
        }
      }
      if (objc_msgSend_resultType(v1137, v242, v243, v244, v245, v246) == 3
        || objc_msgSend_resultType(v1137, v254, v255, v256, v257, v258) == 6)
      {
        char isCharacterLevel = objc_msgSend_isCharacterLevel(v1137, v254, v255, v256, v257, v258);
      }
      else
      {
        char isCharacterLevel = 0;
      }
      v260 = [CHTextInputGesture alloc];
      v266 = objc_msgSend_locales(self, v261, v262, v263, v264, v265);
      v272 = objc_msgSend_firstObject(v266, v267, v268, v269, v270, v271);
      LOBYTE(v1106) = isCharacterLevel;
      Stroke_preferCharacterLevel = objc_msgSend_initWithGestureType_targetContentInfo_locale_normalizedDrawing_originalDrawing_lastStroke_preferCharacterLevel_(v260, v273, 0, (uint64_t)v224, (uint64_t)v272, (uint64_t)v1144, v1133, v1129, v1106);

      v278 = objc_msgSend_sketchRecognitionResultsForDrawing_options_(self->__shapeRecognizer, v275, (uint64_t)v1144, 0, v276, v277);
      v284 = v278;
      if (v278)
      {
        uint64_t v285 = objc_msgSend_indexOfObjectPassingTest_(v278, v279, (uint64_t)&unk_1F2012FD0, v281, v282, v283);
        unint64_t v290 = objc_msgSend_indexOfObjectPassingTest_(v284, v286, (uint64_t)&unk_1F20133B0, v287, v288, v289);
        uint64_t v295 = objc_msgSend_indexOfObjectPassingTest_(v284, v291, (uint64_t)&unk_1F20133F0, v292, v293, v294);
        uint64_t v300 = objc_msgSend_indexOfObjectPassingTest_(v284, v296, (uint64_t)&unk_1F2013430, v297, v298, v299);
      }
      else
      {
        uint64_t v285 = 0x7FFFFFFFFFFFFFFFLL;
        unint64_t v290 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v295 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v300 = 0x7FFFFFFFFFFFFFFFLL;
      }
      uint64_t v301 = objc_msgSend_count(v284, v279, v280, v281, v282, v283);
      BOOL v306 = v290 < 2;
      if (!v295) {
        BOOL v306 = 1;
      }
      uint64_t v307 = 2;
      if (!v295) {
        uint64_t v307 = 5;
      }
      if (v290 < 2) {
        uint64_t v307 = 4;
      }
      if (!v301) {
        BOOL v306 = 1;
      }
      if (v306) {
        uint64_t v308 = v307;
      }
      else {
        uint64_t v308 = 6;
      }
      if (!v306 && v300)
      {
        objc_msgSend_setDrawing_(self->__cornerDetector, v302, (uint64_t)v1144, v303, v304, v305);
        if (!v285 && !objc_msgSend_directionChangeCount(self->__cornerDetector, v302, v309, v303, v304, v305))
        {
          v907 = objc_msgSend_objectAtIndexedSubscript_(v284, v302, 0, v303, v304, v305);
          v908 = objc_opt_class();
          v912 = objc_msgSend_verticalBarGestureFromLineResult_currentGesture_(v908, v909, (uint64_t)v907, (uint64_t)Stroke_preferCharacterLevel, v910, v911);
          v917 = v912;
          if (v912)
          {
            id v918 = v912;

            Stroke_preferCharacterLevel = v918;
          }
          else
          {
            objc_msgSend_setGestureType_(Stroke_preferCharacterLevel, v913, 3, v914, v915, v916);
          }

          goto LABEL_88;
        }
        uint64_t v308 = 3;
      }
      objc_msgSend_setGestureType_(Stroke_preferCharacterLevel, v302, v308, v303, v304, v305);
LABEL_88:
      LOBYTE(v1154) = 0;
      objc_msgSend_getAffectedRange_expandedToFullTokens_(Stroke_preferCharacterLevel, v310, (uint64_t)buf, (uint64_t)&v1154, v311, v312);
      int v313 = LOBYTE(v1154);
      v314 = [CHTextCorrectionResult alloc];
      v320 = objc_msgSend_textInputTarget(v224, v315, v316, v317, v318, v319);
      uint64_t v321 = *(void *)buf;
      uint64_t v322 = *(void *)&buf[8];
      v328 = objc_msgSend_textResult(Stroke_preferCharacterLevel, v323, v324, v325, v326, v327);
      uint64_t v334 = objc_msgSend_gestureType(Stroke_preferCharacterLevel, v329, v330, v331, v332, v333);
      v336 = objc_msgSend_initWithInputTarget_affectedRange_textResult_resultType_isCharacterLevel_error_(v314, v335, (uint64_t)v320, v321, v322, (uint64_t)v328, v334, v313 == 0, 0);

LABEL_89:
      uint64_t v342 = objc_msgSend_resultType(v336, v337, v338, v339, v340, v341);
      if (objc_msgSend_shouldReclassifyGestureType_(CHTextInputGesture, v343, v342, v344, v345, v346))
      {
        uint64_t v352 = objc_msgSend_resultType(v336, v347, v348, v349, v350, v351);
        if ((objc_msgSend_isEditGestureForDrawing_targetContentInfo_tentativeResultType_(CHTextInputGesture, v353, (uint64_t)v1133, (uint64_t)v224, v352, v354) & 1) == 0)
        {

          goto LABEL_97;
        }
      }
      if (objc_msgSend_resultType(v1137, v347, v348, v349, v350, v351) == 6)
      {
        sub_1C4BB7A78(self, v1137, v1133, v1129, v224);
        id v355 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v355 = v336;
      }
      isCharacterLevel_error = v355;

      if (!isCharacterLevel_error)
      {
LABEL_97:
        v356 = objc_opt_class();
        uint64_t v1138 = objc_msgSend_defaultTextAffectedRangeForTargetContentInfo_(v356, v357, (uint64_t)v1136, v358, v359, v360);
        NSUInteger v362 = v361;
        id v1126 = v1147;
        id v1130 = v1136;
        id rect1_16 = v1146;
        id v1116 = v1128;
        if (!self)
        {
          isCharacterLevel_error = 0;
LABEL_203:

          goto LABEL_204;
        }
        v1149[0] = 0;
        *(CGFloat *)&v1149[1] = y;
        v1149[2] = 0x3FF0000000000000;
        *(double *)&v1149[3] = height * a8;
        v1115 = objc_msgSend_value_withObjCType_(MEMORY[0x1E4F29238], v363, (uint64_t)v1149, (uint64_t)"{CGRect={CGPoint=dd}{CGSize=dd}}", v364, v365);
        v1145 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E4F1CA60], v366, (uint64_t)v1115, v367, v368, v369, CHRecognitionOptionFrameContext, 0);
        objc_msgSend_bounds(v1126, v370, v371, v372, v373, v374);
        CGFloat v376 = v375;
        CGFloat v378 = v377;
        CGFloat v380 = v379;
        CGFloat v382 = v381;
        v388 = objc_msgSend_referenceSubstring(v1130, v383, v384, v385, v386, v387);
        BOOL v394 = objc_msgSend_length(v388, v389, v390, v391, v392, v393) == 0;

        if (v394)
        {
          v405 = objc_msgSend_textInputTarget(v1130, v395, v396, v397, v398, v399);
          objc_msgSend_frame(v405, v406, v407, v408, v409, v410);
          double MinY = CGRectGetMinY(v1169);
          v1170.origin.x = v376;
          v1170.origin.CGFloat y = v378;
          v1170.size.width = v380;
          v1170.size.double height = v382;
          double v412 = CGRectGetMinY(v1170);

          double v404 = MinY - v412;
          if (fabs(MinY - v412) <= 8.98846567e307) {
            goto LABEL_107;
          }
        }
        else
        {
          v1167.origin.x = rect1_8;
          v1167.origin.CGFloat y = y;
          v1167.size.width = rect;
          v1167.size.double height = height;
          double v400 = CGRectGetMinY(v1167);
          v1168.origin.x = v376;
          v1168.origin.CGFloat y = v378;
          v1168.size.width = v380;
          v1168.size.double height = v382;
          double v404 = v400 - CGRectGetMinY(v1168) + -16.0;
          if (fabs(v404) <= 8.98846567e307) {
            goto LABEL_107;
          }
        }
        if (qword_1EA3CA000 != -1) {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
        }
        v413 = (id)qword_1EA3C9F90[0];
        if (os_log_type_enabled(v413, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C492D000, v413, OS_LOG_TYPE_ERROR, "Anchor point has a dummy large value, resetting to zero.", buf, 2u);
        }

        double v404 = 0.0;
LABEL_107:
        v1148[0] = a8 * 0.0;
        v1148[1] = v404 * a8 * 0.7;
        v1114 = objc_msgSend_value_withObjCType_(MEMORY[0x1E4F29238], v401, (uint64_t)v1148, (uint64_t)"{CGPoint=dd}", v402, v403);
        objc_msgSend_setObject_forKey_(v1145, v414, (uint64_t)v1114, (uint64_t)CHRecognitionOptionDrawingAnchorPoint, v415, v416);
        id v417 = v1130;
        v423 = objc_msgSend_referenceSubstring(v417, v418, v419, v420, v421, v422);
        unint64_t v428 = objc_msgSend_relativeLocationFromAbsoluteLocation_(v417, v424, v1138, v425, v426, v427);
        uint64_t v434 = objc_msgSend_length(v423, v429, v430, v431, v432, v433);
        uint64_t v440 = 0;
        if (v434 && (v428 & 0x8000000000000000) == 0)
        {
          if (v428 <= objc_msgSend_length(v423, v435, v436, v437, v438, v439))
          {
            uint64_t v440 = objc_msgSend_substringToIndex_(v423, v441, v428, v442, v443, v444);
          }
          else
          {
            uint64_t v440 = 0;
          }
        }
        v1134 = (void *)v440;

        if (v362)
        {
LABEL_123:
          uint64_t v1112 = 0;
          int rect1 = 1;
          v499 = v1134;
          if (!v1134) {
            goto LABEL_136;
          }
LABEL_124:
          if (objc_msgSend_length(v499, v445, v446, v447, v448, v449))
          {
            uint64_t v505 = objc_msgSend_length(v499, v500, v501, v502, v503, v504);
            uint64_t v510 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v499, v506, v505 - 1, v507, v508, v509);
            objc_msgSend_substringWithRange_(v499, v511, v510, (uint64_t)v511, v512, v513);
            v514 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v514 = &stru_1F20141C8;
          }
          objc_msgSend_bounds(rect1_16, v500, v501, v502, v503, v504);
          CGFloat v516 = v515;
          CGFloat v518 = v517;
          CGFloat v520 = v519;
          CGFloat v522 = v521;
          id v523 = v417;
          double v1154 = 0.0;
          *(double *)&uint64_t v1150 = 6.0;
          BOOL v1158 = 0;
          int v524 = sub_1C4BB7E40(v523, v1138, v362, &v1158, &v1154, (double *)&v1150, v516, v518, v520, v522, rect1_8, y, rect, height);
          if (v1158)
          {
            uint64_t v530 = 1;
            if (qword_1EA3CA000 == -1)
            {
LABEL_129:
              v531 = (id)qword_1EA3C9F90[0];
              if (os_log_type_enabled(v531, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134217984;
                *(void *)&buf[4] = v530;
                _os_log_impl(&dword_1C492D000, v531, OS_LOG_TYPE_DEBUG, "SpaceBehavior: %li", buf, 0xCu);
              }

              objc_msgSend_setObject_forKey_(v1145, v532, (uint64_t)v1134, (uint64_t)CHRecognitionOptionTextBefore, v533, v534);
              v539 = objc_msgSend_numberWithInteger_(NSNumber, v535, v530, v536, v537, v538);
              objc_msgSend_setObject_forKey_(v1145, v540, (uint64_t)v539, (uint64_t)CHRecognitionOptionPrecedingSpaceBehavior, v541, v542);

              if (rect1
                && objc_msgSend_lastCharacterLevelPosition(v523, v543, v544, v545, v546, v547) != 0x7FFFFFFFFFFFFFFFLL
                && objc_msgSend_lastCharacterLevelPosition(v523, v548, v549, v550, v551, v552) == v1138)
              {
                objc_msgSend_setObject_forKey_(v1145, v553, MEMORY[0x1E4F1CC38], (uint64_t)CHRecognitionOptionIsPreviousResultCharacterLevel, v554, v555);
              }

LABEL_136:
              id v556 = v417;
              v562 = objc_msgSend_referenceSubstring(v556, v557, v558, v559, v560, v561);
              unint64_t v567 = objc_msgSend_relativeLocationFromAbsoluteLocation_(v556, v563, v1138 + v362, v564, v565, v566);
              recta = 0;
              if (objc_msgSend_length(v562, v568, v569, v570, v571, v572) && (v567 & 0x8000000000000000) == 0)
              {
                if (v567 <= objc_msgSend_length(v562, v573, v574, v575, v576, v577))
                {
                  v582 = objc_msgSend_substringFromIndex_(v562, v578, v567, v579, v580, v581);
                  v587 = objc_msgSend_stringWithFormat_(NSString, v583, @"%C", v584, v585, v586, 65532);
                  recta = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v582, v588, (uint64_t)v587, (uint64_t)&stru_1F20141C8, v589, v590);
                }
                else
                {
                  recta = 0;
                }
              }

              if (recta) {
                objc_msgSend_setObject_forKey_(v1145, v591, (uint64_t)recta, (uint64_t)CHRecognitionOptionTextAfter, v592, v593);
              }
              v594 = self->__textRecognizer;
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              v596 = self->__textRecognizer;
              objc_opt_class();
              char v597 = objc_opt_isKindOfClass();

              if (isKindOfClass)
              {
                if (qword_1EA3CA000 != -1) {
                  dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                }
                v603 = (id)qword_1EA3C9FC0;
                if (os_log_type_enabled(v603, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1C492D000, v603, OS_LOG_TYPE_DEBUG, "Running local recognition", buf, 2u);
                }

                v604 = self->__textRecognizer;
                uint64_t v610 = objc_msgSend_contentType(v556, v605, v606, v607, v608, v609);
                objc_msgSend_setContentType_(v604, v611, v610, v612, v613, v614);
                uint64_t v620 = objc_msgSend_autoCapitalizationMode(v556, v615, v616, v617, v618, v619);
                objc_msgSend_setAutoCapitalizationMode_(v604, v621, v620, v622, v623, v624);
                uint64_t v630 = objc_msgSend_autoCorrectionMode(v556, v625, v626, v627, v628, v629);
                objc_msgSend_setAutoCorrectionMode_(v604, v631, v630, v632, v633, v634);
                uint64_t v640 = objc_msgSend_baseWritingDirection(v556, v635, v636, v637, v638, v639);
                objc_msgSend_setBaseWritingDirection_(v604, v641, v640, v642, v643, v644);
                v647 = objc_msgSend_textRecognitionResultForDrawing_options_shouldCancel_(v604, v645, (uint64_t)v1126, (uint64_t)v1145, 0, v646);

                id v648 = 0;
                if (!v647)
                {
                  BOOL v649 = 0;
                  v647 = 0;
                  if (!v362) {
                    goto LABEL_182;
                  }
LABEL_159:
                  v698 = objc_msgSend_referenceSubstringInRange_(v556, v598, v1138, v362, v601, v602);
                  id v699 = v647;
                  id v700 = v698;
                  self;
                  id v701 = v699;
                  v707 = v701;
                  v647 = v701;
                  if (v700)
                  {
                    v713 = objc_msgSend_topTranscription(v701, v702, v703, v704, v705, v706);
                    v647 = v707;
                    if (v713)
                    {
                      v714 = objc_msgSend_topTranscription(v707, v708, v709, v710, v711, v712);
                      int isEqualToString = objc_msgSend_isEqualToString_(v714, v715, (uint64_t)v700, v716, v717, v718);

                      v647 = v707;
                      if (isEqualToString)
                      {
                        v725 = objc_msgSend_transcriptionPaths(v707, v720, v721, v722, v723, v724);
                        v731 = objc_msgSend_mutableCopy(v725, v726, v727, v728, v729, v730);

                        uint64_t v737 = objc_msgSend_tokenColumnCount(v707, v732, v733, v734, v735, v736);
                        v1110 = objc_msgSend_firstObject(v731, v738, v739, v740, v741, v742);
                        for (unint64_t i = 1; ; ++i)
                        {
                          if (i >= objc_msgSend_count(v731, v743, v744, v745, v746, v747))
                          {
                            v647 = v707;
                            goto LABEL_195;
                          }
                          v753 = objc_msgSend_objectAtIndexedSubscript_(v731, v749, i, v750, v751, v752);
                          v755 = objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v707, v754, (uint64_t)v753, 0, v737, 0);

                          if ((objc_msgSend_isEqualToString_(v755, v756, (uint64_t)v700, v757, v758, v759) & 1) == 0) {
                            break;
                          }
                        }
                        v818 = objc_msgSend_objectAtIndexedSubscript_(v731, v760, i, v761, v762, v763);
                        objc_msgSend_setObject_atIndexedSubscript_(v731, v819, (uint64_t)v818, 0, v820, v821);
                        objc_msgSend_setObject_atIndexedSubscript_(v731, v822, (uint64_t)v1110, i, v823, v824);
                        v825 = [CHTokenizedTextResult alloc];
                        rect2a = objc_msgSend_tokenColumns(v707, v826, v827, v828, v829, v830);
                        v1107 = objc_msgSend_transcriptionPathScores(v707, v831, v832, v833, v834, v835);
                        v841 = objc_msgSend_trailingSeparator(v707, v836, v837, v838, v839, v840);
                        uint64_t v847 = objc_msgSend_recognizerGenerationIdentifier(v707, v842, v843, v844, v845, v846);
                        v647 = objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_(v825, v848, (uint64_t)rect2a, (uint64_t)v731, (uint64_t)v1107, (uint64_t)v841, v847);

LABEL_195:
                      }
                    }
                  }

                  goto LABEL_197;
                }
                goto LABEL_158;
              }
              if ((v597 & 1) == 0)
              {
                id v648 = 0;
                goto LABEL_181;
              }
              if (qword_1EA3CA000 != -1) {
                dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
              }
              v650 = (id)qword_1EA3C9FC0;
              if (os_log_type_enabled(v650, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1C492D000, v650, OS_LOG_TYPE_DEBUG, "Running remote recognition", buf, 2u);
              }

              v651 = self->__textRecognizer;
              uint64_t v657 = objc_msgSend_contentType(v556, v652, v653, v654, v655, v656);
              objc_msgSend_setContentType_(v651, v658, v657, v659, v660, v661);
              uint64_t v667 = objc_msgSend_autoCapitalizationMode(v556, v662, v663, v664, v665, v666);
              objc_msgSend_setAutoCapitalizationMode_(v651, v668, v667, v669, v670, v671);
              uint64_t v677 = objc_msgSend_autoCorrectionMode(v556, v672, v673, v674, v675, v676);
              objc_msgSend_setAutoCorrectionMode_(v651, v678, v677, v679, v680, v681);
              uint64_t v687 = objc_msgSend_baseWritingDirection(v556, v682, v683, v684, v685, v686);
              objc_msgSend_setBaseWritingDirection_(v651, v688, v687, v689, v690, v691);
              objc_msgSend_setDeclaredVariables_(v651, v692, (uint64_t)v1116, v693, v694, v695);
              double v1154 = 0.0;
              v647 = objc_msgSend_textRecognitionResultForDrawing_options_error_(v651, v696, (uint64_t)v1126, (uint64_t)v1145, (uint64_t)&v1154, v697);
              id v648 = *(id *)&v1154;
              if (v647)
              {

LABEL_158:
                BOOL v649 = objc_msgSend_tokenColumnCount(v647, v598, v599, v600, v601, v602) == 1;
                if (v362) {
                  goto LABEL_159;
                }
                goto LABEL_182;
              }
              if (qword_1EA3CA000 == -1)
              {
                v770 = (id)qword_1EA3C9FC0;
                if (!os_log_type_enabled(v770, OS_LOG_TYPE_ERROR))
                {
LABEL_180:

LABEL_181:
                  v647 = 0;
                  BOOL v649 = 0;
                  if (v362) {
                    goto LABEL_159;
                  }
LABEL_182:
                  if (!v649)
                  {
                    NSUInteger v362 = 0;
                    uint64_t v797 = 0;
LABEL_199:
                    if (rect1)
                    {
                      v849 = v647;
                    }
                    else
                    {
                      v849 = objc_msgSend_mutableCopy(v647, v598, v599, v600, v601, v602);
                      objc_msgSend_setPrecedingLineBreaks_(v849, v850, v1112, v851, v852, v853);
                    }
                    v854 = [CHTextCorrectionResult alloc];
                    v860 = objc_msgSend_textInputTarget(v556, v855, v856, v857, v858, v859);
                    isCharacterLevel_error = objc_msgSend_initWithInputTarget_affectedRange_textResult_resultType_isCharacterLevel_error_(v854, v861, (uint64_t)v860, v1138, v362, (uint64_t)v849, 1, v797, v648);

                    goto LABEL_203;
                  }
                  objc_msgSend_topTranscription(v647, v598, v599, v600, v601, v602);
                  id v700 = (id)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend_length(v700, v777, v778, v779, v780, v781))
                  {
                    objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v700, v782, 0, v783, v784, v785);
                    BOOL v791 = v790 == (const char *)objc_msgSend_length(v700, v790, v786, v787, v788, v789);
                    uint64_t v797 = v791;
                    if (v791) {
                      int v798 = rect1;
                    }
                    else {
                      int v798 = 0;
                    }
                    if (v798 == 1)
                    {
                      if (objc_msgSend_lastCharacterLevelPosition(v556, v792, v793, v794, v795, v796) == 0x7FFFFFFFFFFFFFFFLL
                        || objc_msgSend_lastCharacterLevelPosition(v556, v799, v800, v801, v802, v803) != v1138)
                      {
                        NSUInteger v362 = 0;
                        uint64_t v797 = 1;
                      }
                      else
                      {
                        *(_OWORD *)buf = xmmword_1C4C3B320;
                        v809 = objc_msgSend_locales(self, v804, v805, v806, v807, v808);
                        v815 = objc_msgSend_firstObject(v809, v810, v811, v812, v813, v814);
                        uint64_t v817 = objc_msgSend__improvedSingleCharacterOneColumnTextResult_targetContentInfo_insertionRange_locale_affectedRange_(CHTextCorrectionRecognizer, v816, (uint64_t)v647, (uint64_t)v556, v1138, v362, v815, buf);

                        NSUInteger v362 = *(void *)&buf[8];
                        uint64_t v1138 = *(void *)buf;
                        uint64_t v797 = 1;
                        v647 = (void *)v817;
                      }
                    }
                    else
                    {
                      NSUInteger v362 = 0;
                    }
                    goto LABEL_198;
                  }
                  NSUInteger v362 = 0;
LABEL_197:
                  uint64_t v797 = 0;
LABEL_198:

                  goto LABEL_199;
                }
              }
              else
              {
                dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
                v770 = (id)qword_1EA3C9FC0;
                if (!os_log_type_enabled(v770, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_180;
                }
              }
              v776 = objc_msgSend_description(v648, v771, v772, v773, v774, v775);
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v776;
              _os_log_impl(&dword_1C492D000, v770, OS_LOG_TYPE_ERROR, "Remote Recognition error: %@", buf, 0xCu);

              goto LABEL_180;
            }
          }
          else
          {
            int v764 = v524;
            double v765 = v1154;
            double v766 = *(double *)&v1150;
            int v767 = objc_msgSend_containsCommittedStrokes(v523, v525, v526, v527, v528, v529);
            int v768 = v764 ^ 1;
            if (v765 < 0.0) {
              int v769 = v764 ^ 1;
            }
            else {
              int v769 = 0;
            }
            if (v765 > v766) {
              int v768 = 1;
            }
            if (v768 | v769 | v767) {
              uint64_t v530 = 2;
            }
            else {
              uint64_t v530 = 1;
            }
            if (qword_1EA3CA000 == -1) {
              goto LABEL_129;
            }
          }
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          goto LABEL_129;
        }
        id v450 = rect1_16;
        id v451 = v417;
        v457 = objc_msgSend_sharedSettings(CHTextInputProtoSettings, v452, v453, v454, v455, v456);
        if (objc_msgSend_autoLineBreakEnabled(v457, v458, v459, v460, v461, v462)
          && (objc_msgSend_isSingleLine(v451, v463, v464, v465, v466, v467) & 1) == 0
          && objc_msgSend_supportsAutoLineBreaks(v451, v468, v469, v470, v471, v472))
        {
          v478 = objc_msgSend_sharedSettings(CHTextInputProtoSettings, v473, v474, v475, v476, v477);
          if (!objc_msgSend_autoLineBreakRequireWeakCursor(v478, v479, v480, v481, v482, v483)
            || (objc_msgSend_isCursorStrong(v451, v484, v485, v486, v487, v488) & 1) == 0)
          {
            objc_msgSend_strokeCoveredTextRange(v451, v484, v485, v486, v487, v488);
            if (!v493 && (objc_msgSend_containsCommittedStrokes(v451, 0, v489, v490, v491, v492) & 1) == 0)
            {
              objc_msgSend_referenceSubstringRange(v451, v494, v495, v496, v497, v498);
              BOOL v879 = v878 == 0;

              if (!v879)
              {
                objc_msgSend_bounds(v450, v880, v881, v882, v883, v884);
                CGFloat rect1a = v885;
                CGFloat v1111 = v887;
                CGFloat v1113 = v886;
                CGFloat v889 = v888;
                v895 = objc_msgSend_referenceSubstring(v451, v890, v891, v892, v893, v894);
                char hasSuffix = objc_msgSend_hasSuffix_(v895, v896, @"\n\n", v897, v898, v899);

                if (hasSuffix)
                {
                  uint64_t v906 = 2;
                }
                else
                {
                  v919 = objc_msgSend_referenceSubstring(v451, v901, v902, v903, v904, v905);
                  LODWORD(v906) = objc_msgSend_hasSuffix_(v919, v920, @"\n", v921, v922, v923);

                  uint64_t v906 = v906;
                }
                objc_msgSend_referenceSubstringRange(v451, v901, v902, v903, v904, v905);
                uint64_t v929 = (uint64_t)&v924[~v906];
                if (v929 >= 1)
                {
                  uint64_t v930 = objc_msgSend_characterRectsInReferenceSubstring(v451, v924, v925, v926, v927, v928) + 32 * v929;
                  CGFloat v931 = *(double *)v930;
                  CGFloat v932 = *(double *)(v930 + 8);
                  CGFloat v933 = *(double *)(v930 + 16);
                  CGFloat v934 = *(double *)(v930 + 24);
                  v1171.origin.x = rect1a;
                  v1171.size.width = v1111;
                  v1171.origin.CGFloat y = v1113;
                  v1171.size.double height = v889;
                  double v935 = CGRectGetMinY(v1171);
                  v1172.origin.x = v931;
                  v1172.origin.CGFloat y = v932;
                  v1172.size.width = v933;
                  v1172.size.double height = v934;
                  double MaxY = CGRectGetMaxY(v1172);
                  v942 = objc_msgSend_sharedSettings(CHTextInputProtoSettings, v937, v938, v939, v940, v941);
                  objc_msgSend_autoLineBreakMinVerticalDistance(v942, v943, v944, v945, v946, v947);
                  double v948 = v935 - MaxY;
                  BOOL v950 = v948 < v949;

                  if (!v950)
                  {
                    v956 = objc_msgSend_sharedSettings(CHTextInputProtoSettings, v951, v952, v953, v954, v955);
                    objc_msgSend_autoLineBreakDualBreakVerticalDistance(v956, v957, v958, v959, v960, v961);
                    uint64_t v963 = v948 < v962 ? 1 : 2;

                    uint64_t v969 = v963 - v906;
                    if (v969 >= 1)
                    {
                      v970 = objc_msgSend_textInputTarget(v451, v964, v965, v966, v967, v968);
                      objc_msgSend_frame(v970, v971, v972, v973, v974, v975);
                      CGFloat rect2 = v976;
                      CGFloat v978 = v977;
                      CGFloat v980 = v979;
                      double v982 = v981;

                      double v1154 = 0.0;
                      v1155 = (id *)&v1154;
                      uint64_t v1156 = 0x2020000000;
                      unint64_t v1157 = 0xFFEFFFFFFFFFFFFFLL;
                      *(double *)&uint64_t v1150 = 0.0;
                      v1151 = &v1150;
                      uint64_t v1152 = 0x2020000000;
                      uint64_t v1153 = 0x7FEFFFFFFFFFFFFFLL;
                      uint64_t v988 = objc_msgSend_referenceSubstringRange(v451, v983, v984, v985, v986, v987);
                      *(void *)buf = MEMORY[0x1E4F143A8];
                      *(void *)&buf[8] = 3221225472;
                      v1160 = sub_1C4BB83A0;
                      v1161 = &unk_1E64E4D40;
                      v1162 = (id *)&v1154;
                      v1163 = &v1150;
                      objc_msgSend_enumerateCharacterRectsInRange_reverse_block_(v451, v989, v988, (uint64_t)v989, 1, (uint64_t)buf);
                      double v990 = *((double *)v1155 + 3);
                      if (v990 == -1.79769313e308) {
                        goto LABEL_233;
                      }
                      v1173.origin.x = v978;
                      v1173.origin.CGFloat y = v980;
                      v1173.size.width = v982;
                      v1173.size.double height = rect2;
                      if (v990 > CGRectGetMaxX(v1173)) {
                        goto LABEL_233;
                      }
                      double v991 = *((double *)v1155 + 3);
                      v1174.origin.x = v978;
                      v1174.origin.CGFloat y = v980;
                      v1174.size.width = v982;
                      v1174.size.double height = rect2;
                      double MaxX = CGRectGetMaxX(v1174);
                      v1175.origin.x = v978;
                      v1175.origin.CGFloat y = v980;
                      v1175.size.width = v982;
                      v1175.size.double height = rect2;
                      if (v991 <= MaxX + CGRectGetWidth(v1175) * -0.25)
                      {
LABEL_233:
                        v1176.origin.x = v978;
                        v1176.origin.CGFloat y = v980;
                        v1176.size.width = v982;
                        v1176.size.double height = rect2;
                        *((CGFloat *)v1155 + 3) = CGRectGetMaxX(v1176);
                      }
                      double v993 = *((double *)v1151 + 3);
                      if (v993 == 1.79769313e308) {
                        goto LABEL_237;
                      }
                      v1177.origin.x = v978;
                      v1177.origin.CGFloat y = v980;
                      v1177.size.width = v982;
                      v1177.size.double height = rect2;
                      if (v993 < CGRectGetMinX(v1177)) {
                        goto LABEL_237;
                      }
                      double v994 = *((double *)v1151 + 3);
                      v1178.origin.x = v978;
                      v1178.origin.CGFloat y = v980;
                      v1178.size.width = v982;
                      v1178.size.double height = rect2;
                      double MinX = CGRectGetMinX(v1178);
                      v1179.origin.x = v978;
                      v1179.origin.CGFloat y = v980;
                      v1179.size.width = v982;
                      v1179.size.double height = rect2;
                      if (v994 >= MinX + CGRectGetWidth(v1179) * 0.25)
                      {
LABEL_237:
                        v1180.origin.x = v978;
                        v1180.origin.CGFloat y = v980;
                        v1180.size.width = v982;
                        v1180.size.double height = rect2;
                        *((CGFloat *)v1151 + 3) = CGRectGetMinX(v1180);
                      }
                      v1001 = objc_msgSend_sharedSettings(CHTextInputProtoSettings, v996, v997, v998, v999, v1000);
                      objc_msgSend_autoLineBreakAreaWidthFactor(v1001, v1002, v1003, v1004, v1005, v1006);
                      double v1008 = v1007;

                      uint64_t v1014 = objc_msgSend_baseWritingDirection(v451, v1009, v1010, v1011, v1012, v1013);
                      double v1015 = v982 * v1008;
                      double v1016 = v1014 == 1 ? *((double *)v1155 + 3) - v1015 : *((double *)v1151 + 3);
                      v1181.origin.x = rect1a;
                      v1181.size.width = v1111;
                      v1181.origin.CGFloat y = v1113;
                      v1181.size.double height = v889;
                      CGFloat v1060 = v980;
                      CGFloat v1061 = rect2;
                      BOOL v1062 = CGRectIntersectsRect(v1181, *(CGRect *)(&v1015 - 2));
                      _Block_object_dispose(&v1150, 8);
                      _Block_object_dispose(&v1154, 8);
                      if (v1062)
                      {

                        v499 = objc_msgSend_stringByAppendingString_(v1134, v1063, @"\n", v1064, v1065, v1066);

                        int rect1 = 0;
                        uint64_t v1112 = v969 & ~(v969 >> 63);
                        v1134 = v499;
                        if (!v499) {
                          goto LABEL_136;
                        }
                        goto LABEL_124;
                      }
                    }
                  }
                }
              }
              goto LABEL_122;
            }
          }
        }
LABEL_122:

        goto LABEL_123;
      }
      goto LABEL_204;
    }
    id v151 = v148;
    id v152 = v149;
    id v153 = v150;
    v159 = objc_msgSend_sharedSettings(CHTextInputProtoSettings, v154, v155, v156, v157, v158);
    if (!objc_msgSend_lineBreakVerticalBarGestureEnabled(v159, v160, v161, v162, v163, v164)
      || objc_msgSend_strokeCount(v152, v165, v166, v167, v168, v169) != 1
      || (unint64_t)objc_msgSend_pointCountForStrokeIndex_(v152, v170, 0, v171, v172, v173) < 2
      || (objc_msgSend_bounds(v152, v174, v175, v176, v177, v178), v184 >= 10.0))
    {

      goto LABEL_46;
    }
    objc_msgSend_bounds(v152, v179, v180, v181, v182, v183);
    BOOL v186 = v185 > 10.0;

    if (!v186) {
      goto LABEL_46;
    }
    *(void *)buf = 0x7FFFFFFFFFFFFFFFLL;
    int isDrawingCenterOnBlank_targetContentInfo_insertionLocation = objc_msgSend_isDrawingCenterOnBlank_targetContentInfo_insertionLocation_(CHTextInputGesture, v187, (uint64_t)v152, (uint64_t)v153, (uint64_t)buf, v188);
    LOBYTE(v1154) = 0;
    int v193 = *(void *)buf == 0x7FFFFFFFFFFFFFFFLL ? 0 : isDrawingCenterOnBlank_targetContentInfo_insertionLocation;
    if (v193 != 1) {
      goto LABEL_46;
    }
    v1142 = objc_msgSend_sketchRecognitionResultsForDrawing_options_(self->__shapeRecognizer, v190, (uint64_t)v151, 0, v191, v192);
    isCharacterLevel_error = objc_msgSend_firstObject(v1142, v194, v195, v196, v197, v198);
    if (!isCharacterLevel_error)
    {
LABEL_268:

      goto LABEL_47;
    }
    char isDirectionDownward = objc_msgSend_isVerticalBarShapeFromLineResult_originalDrawing_isDirectionDownward_(CHTextInputGesture, v199, (uint64_t)isCharacterLevel_error, (uint64_t)v152, (uint64_t)&v1154, v200);

    if ((isDirectionDownward & 1) == 0) {
      goto LABEL_46;
    }
    unint64_t v1143 = objc_msgSend_referenceSubstringRange(v153, v202, v203, v204, v205, v206);
    v1132 = v207;
    if (!LOBYTE(v1154)
      && (objc_msgSend_sharedSettings(CHTextInputProtoSettings, v207, v208, v209, v210, v211),
          v212 = objc_claimAutoreleasedReturnValue(),
          char v218 = objc_msgSend_lineBreakVerticalBarUpToDelete(v212, v213, v214, v215, v216, v217),
          v212,
          (v218 & 1) != 0)
      || (objc_msgSend_isSingleLine(v153, v207, v208, v209, v210, v211) & 1) != 0)
    {
      isCharacterLevel_error = 0;
    }
    else
    {
      uint64_t v1017 = *(void *)buf;
      v1023 = 0;
      if (objc_msgSend_isCursorStrong(v153, v207, v208, v209, v210, v211)
        && objc_msgSend_selectedTextRange(v153, v1018, v1019, v1020, v1021, v1022) != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v1017 = objc_msgSend_selectedTextRange(v153, v1018, v1024, v1020, v1021, v1022);
        v1023 = v1018;
      }
      uint64_t v1131 = (uint64_t)v1023;
      v1127 = objc_msgSend_indexSetWithIndex_(MEMORY[0x1E4F28D60], v1018, 0, v1020, v1021, v1022);
      objc_msgSend_boundsForStrokeIndexes_(v151, v1025, (uint64_t)v1127, v1026, v1027, v1028);
      uint64_t rect1_16a = v1017;
      v1139 = objc_msgSend_tokenizedTextResultWithString_strokeIndexes_bounds_trailingSeparator_recognizerGenerationIdentifier_defaultTokenScores_(CHTokenizedTextResult, v1029, @"\n", (uint64_t)v1127, (uint64_t)&stru_1F20141C8, 0);
      v1030 = [CHTextCorrectionResult alloc];
      v1036 = objc_msgSend_textInputTarget(v153, v1031, v1032, v1033, v1034, v1035);
      isCharacterLevel_error = objc_msgSend_initWithInputTarget_affectedRange_textResult_resultType_isCharacterLevel_error_(v1030, v1037, (uint64_t)v1036, rect1_16a, v1131, (uint64_t)v1139, 1, 0, 0);
    }
    if (isCharacterLevel_error || LOBYTE(v1154)) {
      goto LABEL_47;
    }
    v1038 = objc_msgSend_sharedSettings(CHTextInputProtoSettings, v207, v208, v209, v210, v211);
    int v1044 = objc_msgSend_lineBreakVerticalBarUpToDelete(v1038, v1039, v1040, v1041, v1042, v1043);

    if (!v1044)
    {
LABEL_46:
      isCharacterLevel_error = 0;
LABEL_47:

      goto LABEL_48;
    }
    isCharacterLevel_error = 0;
    if (*(void *)buf < v1143 || *(void *)buf > (unint64_t)&v1132[v1143]) {
      goto LABEL_47;
    }
    if (objc_msgSend_isCursorStrong(v153, v1045, v1046, v1047, v1048, v1049))
    {
      uint64_t v1055 = objc_msgSend_selectedTextRange(v153, v1050, v1051, v1052, v1053, v1054);
      uint64_t v1058 = 0x7FFFFFFFFFFFFFFFLL;
      if (v1055 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v1059 = 0;
LABEL_262:
        if (v1058 != 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_267:
          uint64_t v1135 = v1058;
          uint64_t v1140 = (uint64_t)v1059;
          v1142 = objc_msgSend_indexSetWithIndex_(MEMORY[0x1E4F28D60], v1059, 0, v1052, v1053, v1054);
          objc_msgSend_boundsForStrokeIndexes_(v151, v1092, (uint64_t)v1142, v1093, v1094, v1095);
          v1097 = objc_msgSend_tokenizedTextResultWithString_strokeIndexes_bounds_trailingSeparator_recognizerGenerationIdentifier_defaultTokenScores_(CHTokenizedTextResult, v1096, (uint64_t)&stru_1F20141C8, (uint64_t)v1142, (uint64_t)&stru_1F20141C8, 0);
          v1098 = [CHTextCorrectionResult alloc];
          v1104 = objc_msgSend_textInputTarget(v153, v1099, v1100, v1101, v1102, v1103);
          isCharacterLevel_error = objc_msgSend_initWithInputTarget_affectedRange_textResult_resultType_isCharacterLevel_error_(v1098, v1105, (uint64_t)v1104, v1135, v1140, (uint64_t)v1097, 1, 0, 0);

          goto LABEL_268;
        }
        if (*(void *)buf > v1143)
        {
          uint64_t v1073 = objc_msgSend_relativeLocationFromAbsoluteLocation_(v153, v1059, *(uint64_t *)buf, v1052, v1053, v1054);
          v1079 = objc_msgSend_referenceSubstring(v153, v1074, v1075, v1076, v1077, v1078);
          uint64_t v1084 = objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(v1079, v1080, v1073 - 1, v1081, v1082, v1083);
          v1086 = v1085;

          if (v1084 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v1091 = objc_msgSend_absoluteLocationFromRelativeLocation_(v153, v1087, v1084, v1088, v1089, v1090);
            if (v1091 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v1059 = v1086;
              uint64_t v1058 = v1091;
              goto LABEL_267;
            }
          }
        }
        goto LABEL_46;
      }
      *(void *)buf = objc_msgSend_selectedTextRange(v153, v1056, v1057, v1052, v1053, v1054);
      objc_msgSend_selectedTextRange(v153, v1067, v1068, v1069, v1070, v1071);
      if (v1059)
      {
        uint64_t v1058 = objc_msgSend_selectedTextRange(v153, v1059, v1072, v1052, v1053, v1054);
        goto LABEL_262;
      }
    }
    else
    {
      v1059 = 0;
    }
    uint64_t v1058 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_262;
  }
LABEL_204:
  v862 = objc_msgSend_textResult(isCharacterLevel_error, v143, v144, v145, v146, v147);
  BOOL v863 = v862 == 0;

  if (!v863)
  {
    v869 = objc_msgSend_textResult(isCharacterLevel_error, v864, v865, v866, v867, v868);
    char isValid = objc_msgSend_isValid(v869, v870, v871, v872, v873, v874);

    if ((isValid & 1) == 0)
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      v876 = (id)qword_1EA3C9F90[0];
      if (os_log_type_enabled(v876, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C492D000, v876, OS_LOG_TYPE_FAULT, "Expected nil or valid tokenized result as output of CHTextCorrectionRecognizer.", buf, 2u);
      }
    }
  }

  return isCharacterLevel_error;
}

+ (_NSRange)defaultTextAffectedRangeForTargetContentInfo:(id)a3
{
  id v3 = a3;
  uint64_t active = objc_msgSend_activePreviewRange(v3, v4, v5, v6, v7, v8);
  uint64_t v15 = objc_msgSend_selectedTextRange(v3, v10, v11, v12, v13, v14);
  if (active == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v21 = v16;
      uint64_t active = v15;
      goto LABEL_6;
    }
    uint64_t active = objc_msgSend_textContentLength(v3, v16, v17, v18, v19, v20);
  }
  uint64_t v21 = 0;
LABEL_6:

  NSUInteger v22 = active;
  NSUInteger v23 = (NSUInteger)v21;
  result.length = v23;
  result.location = v22;
  return result;
}

+ (id)_improvedSingleCharacterOneColumnTextResult:(id)a3 targetContentInfo:(id)a4 insertionRange:(_NSRange)a5 locale:(id)a6 affectedRange:(_NSRange *)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v670 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v636 = a4;
  id v639 = a6;
  v635 = v11;
  if (objc_msgSend_tokenColumnCount(v11, v12, v13, v14, v15, v16) != 1)
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    NSUInteger v22 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v669 = objc_msgSend_tokenColumnCount(v11, v23, v24, v25, v26, v27);
      _os_log_impl(&dword_1C492D000, v22, OS_LOG_TYPE_FAULT, "Unexpected number of token columns in text result refinement for single character mode. Expected 1 token column, got %lu", buf, 0xCu);
    }
  }
  objc_msgSend_referenceSubstringRange(v636, v17, v18, v19, v20, v21);
  if (!v28) {
    goto LABEL_17;
  }
  unint64_t v33 = objc_msgSend_referenceSubstringRange(v636, v28, v29, v30, v31, v32);
  if (!location) {
    goto LABEL_17;
  }
  if (location < v33) {
    goto LABEL_17;
  }
  if (length) {
    goto LABEL_17;
  }
  unint64_t v38 = objc_msgSend_relativeLocationFromAbsoluteLocation_(v636, v34, location, v35, v36, v37);
  uint64_t v44 = objc_msgSend_referenceSubstring(v636, v39, v40, v41, v42, v43);
  unint64_t v619 = objc_msgSend_rangeOfTokenAtCharacterIndex_inString_locale_(CHTextInputGesture, v45, v38 - 1, (uint64_t)v44, (uint64_t)v639, v46);
  unint64_t v48 = v47;

  if (v619 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_17;
  }
  NSUInteger v618 = v38 - v619;
  BOOL v54 = v38 - v619 < v48 && v38 >= v619;
  if (!v54 && v619 + v48 != v38)
  {
LABEL_17:
    id v55 = v11;
    goto LABEL_18;
  }
  uint64_t v57 = objc_msgSend_referenceSubstring(v636, v49, v50, v51, v52, v53);
  uint64_t v640 = objc_msgSend_substringWithRange_(v57, v58, v619, v618, v59, v60);

  id v66 = objc_msgSend_tokenColumns(v11, v61, v62, v63, v64, v65);
  v621 = objc_msgSend_firstObject(v66, v67, v68, v69, v70, v71);

  uint64_t v622 = objc_alloc_init(CHMutableTokenizedResultColumn);
  uint64_t v77 = objc_msgSend_transcriptionPaths(v11, v72, v73, v74, v75, v76);
  v83 = objc_msgSend_firstObject(v77, v78, v79, v80, v81, v82);
  uint64_t v634 = objc_msgSend_indexAtPosition_(v83, v84, 0, v85, v86, v87);

  uint64_t v623 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v88, v89, v90, v91, v92);
  uint64_t v624 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v93, v94, v95, v96, v97);
  unint64_t v637 = 0;
LABEL_22:
  v103 = objc_msgSend_textTokenRows(v621, v98, v99, v100, v101, v102);
  BOOL v109 = v637 < objc_msgSend_count(v103, v104, v105, v106, v107, v108);

  if (v109)
  {
    v651 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v110, v111, v112, v113, v114);
    long long v664 = 0u;
    long long v665 = 0u;
    long long v662 = 0u;
    long long v663 = 0u;
    uint64_t v120 = objc_msgSend_textTokenRows(v621, v115, v116, v117, v118, v119);
    objc_msgSend_objectAtIndexedSubscript_(v120, v121, v637, v122, v123, v124);
    id obj = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v125, (uint64_t)&v662, (uint64_t)v667, 16, v126);
    if (!v127)
    {
      v658 = 0;
      uint64_t v653 = 0;
      double v626 = 0.0;
      double v633 = 0.0;
      double v650 = 0.0;
      goto LABEL_66;
    }
    v658 = 0;
    uint64_t v653 = 0;
    uint64_t v649 = *(void *)v663;
    char v133 = 1;
    double v626 = 0.0;
    double v633 = 0.0;
    double v650 = 0.0;
    while (1)
    {
      uint64_t v652 = v127;
      for (uint64_t i = 0; i != v652; ++i)
      {
        if (*(void *)v663 != v649) {
          objc_enumerationMutation(obj);
        }
        v135 = *(void **)(*((void *)&v662 + 1) + 8 * i);
        uint64_t v136 = objc_msgSend_properties(v135, v128, v129, v130, v131, v132);
        if (v133)
        {
          uint64_t v142 = v136;
          v143 = objc_msgSend_string(v135, v137, v138, v139, v140, v141);
          int v149 = objc_msgSend_autoCapitalizationMode(v636, v144, v145, v146, v147, v148);
          if ((v149 - 1) < 3) {
            goto LABEL_34;
          }
          if (v149 == 4)
          {
            uint64_t v657 = objc_msgSend_uppercaseStringWithLocale_(v143, v150, (uint64_t)v639, v151, v152, v153);
LABEL_35:

            objc_msgSend_stringByAppendingString_(v640, v154, (uint64_t)v657, v155, v156, v157);
          }
          else
          {
            if (v149 == 5)
            {
LABEL_34:
              uint64_t v657 = objc_msgSend_lowercaseStringWithLocale_(v143, v150, (uint64_t)v639, v151, v152, v153);
              goto LABEL_35;
            }
            uint64_t v657 = v143;
            objc_msgSend_stringByAppendingString_(v640, v150, (uint64_t)v143, v151, v152, v153);
          uint64_t v656 = };
          uint64_t v158 = [CHTokenizedTextResultToken alloc];
          uint64_t v164 = objc_msgSend_strokeIndexes(v135, v159, v160, v161, v162, v163);
          uint64_t v170 = objc_msgSend_wordID(v135, v165, v166, v167, v168, v169);
          objc_msgSend_recognitionScore(v135, v171, v172, v173, v174, v175);
          double v177 = v176;
          objc_msgSend_recognitionScore(v135, v178, v179, v180, v181, v182);
          double v184 = v183;
          objc_msgSend_combinedScore(v135, v185, v186, v187, v188, v189);
          double v191 = v190;
          objc_msgSend_alignmentScore(v135, v192, v193, v194, v195, v196);
          double v198 = v197;
          uint64_t v204 = objc_msgSend_recognizerSourceLocale(v135, v199, v200, v201, v202, v203);
          double v641 = v198;
          double v644 = v191;
          double v647 = v184;
          double v654 = v177;
          uint64_t v210 = objc_msgSend_inputSources(v135, v205, v206, v207, v208, v209);
          uint64_t v216 = objc_msgSend_substrokeCount(v135, v211, v212, v213, v214, v215);
          objc_msgSend_bounds(v135, v217, v218, v219, v220, v221);
          double v223 = v222;
          double v225 = v224;
          double v227 = v226;
          double v229 = v228;
          objc_msgSend_originalBounds(v135, v230, v231, v232, v233, v234);
          uint64_t v241 = v240;
          uint64_t v243 = v242;
          uint64_t v245 = v244;
          uint64_t v247 = v246;
          if (v135) {
            objc_msgSend_principalLines(v135, v235, v236, v237, v238, v239);
          }
          else {
            memset(v661, 0, sizeof(v661));
          }
          unint64_t v248 = v142 & 0xFFFFFFFFFFFFFFDFLL;
          uint64_t v249 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v158, v235, (uint64_t)v656, (uint64_t)v164, v170, v248, v204, v210 | 0x100, v654, v647, v644, v641, v223, v225, v227, v229, v216, v241, v243,
                           v245,
                           v247,
                           v661);

          objc_msgSend_addObject_(v651, v250, (uint64_t)v249, v251, v252, v253);
          objc_msgSend_combinedScore(v249, v254, v255, v256, v257, v258);
          double v648 = v259;
          uint64_t v655 = objc_msgSend_precedingSeparatorForToken_(v635, v260, (uint64_t)v135, v261, v262, v263);
          if (v637 != v634) {
            goto LABEL_56;
          }
          if (objc_msgSend_length(v655, v264, v265, v266, v267, v268))
          {
            v274 = objc_msgSend_string(v135, v269, v270, v271, v272, v273);
            v645 = objc_msgSend_stringByAppendingFormat_(v640, v275, @"%@%@", v276, v277, v278, v655, v274);

            v279 = [CHTokenizedTextResultToken alloc];
            uint64_t v285 = objc_msgSend_strokeIndexes(v135, v280, v281, v282, v283, v284);
            uint64_t v291 = objc_msgSend_wordID(v135, v286, v287, v288, v289, v290);
            objc_msgSend_recognitionScore(v135, v292, v293, v294, v295, v296);
            double v298 = v297;
            objc_msgSend_recognitionScore(v135, v299, v300, v301, v302, v303);
            double v305 = v304;
            objc_msgSend_combinedScore(v135, v306, v307, v308, v309, v310);
            double v312 = v311;
            objc_msgSend_alignmentScore(v135, v313, v314, v315, v316, v317);
            double v319 = v318;
            uint64_t v325 = objc_msgSend_recognizerSourceLocale(v135, v320, v321, v322, v323, v324);
            double v627 = v319;
            double v629 = v312;
            double v631 = v305;
            double v642 = v298;
            uint64_t v331 = objc_msgSend_inputSources(v135, v326, v327, v328, v329, v330);
            uint64_t v337 = objc_msgSend_substrokeCount(v135, v332, v333, v334, v335, v336);
            objc_msgSend_bounds(v135, v338, v339, v340, v341, v342);
            double v344 = v343;
            double v346 = v345;
            double v348 = v347;
            double v350 = v349;
            objc_msgSend_originalBounds(v135, v351, v352, v353, v354, v355);
            uint64_t v362 = v361;
            uint64_t v364 = v363;
            uint64_t v366 = v365;
            uint64_t v368 = v367;
            if (v135) {
              objc_msgSend_principalLines(v135, v356, v357, v358, v359, v360);
            }
            else {
              memset(v660, 0, sizeof(v660));
            }
            uint64_t v369 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v279, v356, (uint64_t)v645, (uint64_t)v285, v291, v248, v325, v331 | 0x200, v642, v631, v629, v627, v344, v346, v348, v350, v337, v362, v364,
                             v366,
                             v368,
                             v660);

            uint64_t v374 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1CA48], v370, (uint64_t)v369, v371, v372, v373);

            objc_msgSend_combinedScore(v369, v375, v376, v377, v378, v379);
            double v381 = v380;

            double v633 = v633 + v381;
            uint64_t v653 = (void *)v374;
          }
          CGFloat v382 = objc_msgSend_string(v135, v269, v270, v271, v272, v273);
          BOOL v388 = objc_msgSend_length(v382, v383, v384, v385, v386, v387) == 1;

          if (v388)
          {
            BOOL v394 = objc_msgSend_string(v135, v389, v390, v391, v392, v393);
            uint64_t v399 = objc_msgSend_uppercaseStringWithLocale_(v394, v395, (uint64_t)v639, v396, v397, v398);

            if (objc_msgSend_isEqualToString_(v399, v400, (uint64_t)v657, v401, v402, v403))
            {
              uint64_t v409 = objc_msgSend_string(v135, v404, v405, v406, v407, v408);
              uint64_t v414 = objc_msgSend_lowercaseStringWithLocale_(v409, v410, (uint64_t)v639, v411, v412, v413);

              uint64_t v399 = (void *)v414;
            }
            uint64_t v415 = objc_msgSend_string(v135, v404, v405, v406, v407, v408);
            char isEqualToString = objc_msgSend_isEqualToString_(v399, v416, (uint64_t)v415, v417, v418, v419);

            if (isEqualToString)
            {
              uint64_t v425 = (uint64_t)v658;
            }
            else
            {
              uint64_t v643 = objc_msgSend_stringByAppendingString_(v640, v421, (uint64_t)v399, v422, v423, v424);
              uint64_t v426 = [CHTokenizedTextResultToken alloc];
              uint64_t v646 = objc_msgSend_strokeIndexes(v135, v427, v428, v429, v430, v431);
              uint64_t v437 = objc_msgSend_wordID(v135, v432, v433, v434, v435, v436);
              objc_msgSend_modelScore(v135, v438, v439, v440, v441, v442);
              double v444 = v443;
              objc_msgSend_recognitionScore(v135, v445, v446, v447, v448, v449);
              double v451 = v450;
              objc_msgSend_combinedScore(v135, v452, v453, v454, v455, v456);
              double v458 = v457;
              objc_msgSend_alignmentScore(v135, v459, v460, v461, v462, v463);
              double v465 = v464;
              uint64_t v471 = objc_msgSend_recognizerSourceLocale(v135, v466, v467, v468, v469, v470);
              double v625 = v465;
              double v628 = v458;
              double v630 = v451;
              double v632 = v444;
              uint64_t v477 = objc_msgSend_inputSources(v135, v472, v473, v474, v475, v476);
              uint64_t v483 = objc_msgSend_substrokeCount(v135, v478, v479, v480, v481, v482);
              objc_msgSend_bounds(v135, v484, v485, v486, v487, v488);
              double v490 = v489;
              double v492 = v491;
              double v494 = v493;
              double v496 = v495;
              objc_msgSend_originalBounds(v135, v497, v498, v499, v500, v501);
              uint64_t v508 = v507;
              uint64_t v510 = v509;
              uint64_t v512 = v511;
              uint64_t v514 = v513;
              if (v135) {
                objc_msgSend_principalLines(v135, v502, v503, v504, v505, v506);
              }
              else {
                memset(v659, 0, sizeof(v659));
              }
              double v515 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(v426, v502, (uint64_t)v643, (uint64_t)v646, v437, v248, v471, v477 | 0x100, v632, v630, v628, v625, v490, v492, v494, v496, v483, v508, v510,
                               v512,
                               v514,
                               v659);

              uint64_t v425 = objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1CA48], v516, (uint64_t)v515, v517, v518, v519);

              objc_msgSend_combinedScore(v515, v520, v521, v522, v523, v524);
              double v526 = v525;

              double v626 = v626 + v526;
            }
          }
          else
          {
LABEL_56:
            uint64_t v425 = (uint64_t)v658;
          }

          double v650 = v650 + v648;
          v658 = (void *)v425;
          goto LABEL_27;
        }
        objc_msgSend_addObject_(v651, v137, (uint64_t)v135, v139, v140, v141);
        if (v653) {
          objc_msgSend_addObject_(v653, v128, (uint64_t)v135, v130, v131, v132);
        }
        if (v658) {
          objc_msgSend_addObject_(v658, v128, (uint64_t)v135, v130, v131, v132);
        }
        else {
          v658 = 0;
        }
LABEL_27:
        char v133 = 0;
      }
      uint64_t v127 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v128, (uint64_t)&v662, (uint64_t)v667, 16, v132);
      char v133 = 0;
      if (!v127)
      {
LABEL_66:

        uint64_t v531 = objc_msgSend_addTokenRowWithTokens_(v622, v527, (uint64_t)v651, v528, v529, v530);
        uint64_t v536 = objc_msgSend_indexPathWithIndex_(MEMORY[0x1E4F28D58], v532, v531, v533, v534, v535);
        objc_msgSend_addObject_(v623, v537, (uint64_t)v536, v538, v539, v540);

        uint64_t v546 = objc_msgSend_numberWithDouble_(NSNumber, v541, v542, v543, v544, v545, v650);
        objc_msgSend_addObject_(v624, v547, (uint64_t)v546, v548, v549, v550);

        if (v653)
        {
          uint64_t v555 = objc_msgSend_addTokenRowWithTokens_(v622, v551, (uint64_t)v653, v552, v553, v554);
          uint64_t v560 = objc_msgSend_indexPathWithIndex_(MEMORY[0x1E4F28D58], v556, v555, v557, v558, v559);
          objc_msgSend_addObject_(v623, v561, (uint64_t)v560, v562, v563, v564);

          uint64_t v570 = objc_msgSend_numberWithDouble_(NSNumber, v565, v566, v567, v568, v569, v633);
          objc_msgSend_addObject_(v624, v571, (uint64_t)v570, v572, v573, v574);
        }
        uint64_t v575 = v658;
        if (v658)
        {
          uint64_t v576 = objc_msgSend_addTokenRowWithTokens_(v622, v551, (uint64_t)v658, v552, v553, v554);
          uint64_t v581 = objc_msgSend_indexPathWithIndex_(MEMORY[0x1E4F28D58], v577, v576, v578, v579, v580);
          objc_msgSend_addObject_(v623, v582, (uint64_t)v581, v583, v584, v585);

          v591 = objc_msgSend_numberWithDouble_(NSNumber, v586, v587, v588, v589, v590, v626);
          objc_msgSend_addObject_(v624, v592, (uint64_t)v591, v593, v594, v595);

          uint64_t v575 = v658;
        }

        ++v637;
        goto LABEL_22;
      }
    }
  }
  v596 = [CHTokenizedTextResult alloc];
  uint64_t v666 = v622;
  uint64_t v600 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v597, (uint64_t)&v666, 1, v598, v599);
  uint64_t v606 = objc_msgSend_trailingSeparator(v635, v601, v602, v603, v604, v605);
  uint64_t v612 = objc_msgSend_recognizerGenerationIdentifier(v635, v607, v608, v609, v610, v611);
  id v55 = (id)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_(v596, v613, (uint64_t)v600, (uint64_t)v623, (uint64_t)v624, (uint64_t)v606, v612);

  if (a7)
  {
    a7->NSUInteger location = objc_msgSend_absoluteLocationFromRelativeLocation_(v636, v614, v619, v615, v616, v617);
    a7->NSUInteger length = v618;
  }

LABEL_18:
  return v55;
}

- (NSArray)locales
{
  return self->_locales;
}

- (BOOL)isRemoteRecognition
{
  return self->_isRemoteRecognition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cornerDetector, 0);
  objc_storeStrong((id *)&self->__shapeRecognizer, 0);
  objc_storeStrong((id *)&self->__textRecognizer, 0);
  objc_storeStrong((id *)&self->_locales, 0);
}

@end