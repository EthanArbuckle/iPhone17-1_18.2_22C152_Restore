@interface JFXOverlayEffectDebugViewOptions
+ (JFXOverlayEffectDebugViewOptions)debugViewOptionsWithDictionary:(id)a3;
- (BOOL)showAdditionalRects;
- (BOOL)showCornerPoints;
- (BOOL)showDocumentBoundingBox;
- (BOOL)showFaceRect;
- (BOOL)showHitAreaBoundingBox;
- (BOOL)showHitAreaPoints;
- (BOOL)showMidpoint;
- (BOOL)showObjectAlignedBoundingBox;
- (BOOL)showTapPoints;
- (BOOL)showTextBoundingBoxes;
- (BOOL)showTextCornerPoints;
- (JFXOverlayEffectDebugViewOptions)init;
- (NSArray)cornerPointColors;
- (NSArray)hitAreaPointColors;
- (NSArray)textBoundingBoxColors;
- (NSArray)textCornerPointColors;
- (UIColor)documentBoundingBoxColor;
- (UIColor)hitAreaBoundingBoxColor;
- (UIColor)midpointColor;
- (UIColor)objectAlignedBoundingBoxColor;
- (UIColor)originCrosshairColor;
- (UIColor)outputROIColor;
- (UIColor)overlayCenterColor;
- (id)description;
- (void)setCornerPointColors:(id)a3;
- (void)setDocumentBoundingBoxColor:(id)a3;
- (void)setHitAreaBoundingBoxColor:(id)a3;
- (void)setHitAreaPointColors:(id)a3;
- (void)setMidpointColor:(id)a3;
- (void)setObjectAlignedBoundingBoxColor:(id)a3;
- (void)setOriginCrosshairColor:(id)a3;
- (void)setOutputROIColor:(id)a3;
- (void)setOverlayCenterColor:(id)a3;
- (void)setShowAdditionalRects:(BOOL)a3;
- (void)setShowCornerPoints:(BOOL)a3;
- (void)setShowDocumentBoundingBox:(BOOL)a3;
- (void)setShowFaceRect:(BOOL)a3;
- (void)setShowHitAreaBoundingBox:(BOOL)a3;
- (void)setShowHitAreaPoints:(BOOL)a3;
- (void)setShowMidpoint:(BOOL)a3;
- (void)setShowObjectAlignedBoundingBox:(BOOL)a3;
- (void)setShowTapPoints:(BOOL)a3;
- (void)setShowTextBoundingBoxes:(BOOL)a3;
- (void)setShowTextCornerPoints:(BOOL)a3;
- (void)setTextBoundingBoxColors:(id)a3;
- (void)setTextCornerPointColors:(id)a3;
@end

@implementation JFXOverlayEffectDebugViewOptions

+ (JFXOverlayEffectDebugViewOptions)debugViewOptionsWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 objectForKeyedSubscript:@"JFX_DEBUG_DrawOverlayBoundsOptionShowDocumentBoundingBox"];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v4, "setShowDocumentBoundingBox:", objc_msgSend(v5, "BOOLValue"));
    }
  }

  v6 = [v3 objectForKeyedSubscript:@"JFX_DEBUG_DrawOverlayBoundsOptionShowObjectAlignedBoundingBox"];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v4, "setShowObjectAlignedBoundingBox:", objc_msgSend(v6, "BOOLValue"));
    }
  }

  v7 = [v3 objectForKeyedSubscript:@"JFX_DEBUG_DrawOverlayBoundsOptionShowTextBoundingBoxes"];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v4, "setShowTextBoundingBoxes:", objc_msgSend(v7, "BOOLValue"));
    }
  }

  v8 = [v3 objectForKeyedSubscript:@"JFX_DEBUG_DrawOverlayBoundsOptionShowHitAreaBoundingBox"];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v4, "setShowHitAreaBoundingBox:", objc_msgSend(v8, "BOOLValue"));
    }
  }

  v9 = [v3 objectForKeyedSubscript:@"JFX_DEBUG_DrawOverlayBoundsOptionShowFaceRect"];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v4, "setShowFaceRect:", objc_msgSend(v9, "BOOLValue"));
    }
  }

  v10 = [v3 objectForKeyedSubscript:@"JFX_DEBUG_DrawOverlayBoundsOptionShowTapPoints"];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v4, "setShowTapPoints:", objc_msgSend(v10, "BOOLValue"));
    }
  }

  v11 = [v3 objectForKeyedSubscript:@"JFX_DEBUG_DrawOverlayBoundsOptionShowCornerPoints"];
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v4, "setShowCornerPoints:", objc_msgSend(v11, "BOOLValue"));
    }
  }

  v12 = [v3 objectForKeyedSubscript:@"JFX_DEBUG_DrawOverlayBoundsOptionShowTextCornerPoints"];
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v4, "setShowTextCornerPoints:", objc_msgSend(v12, "BOOLValue"));
    }
  }

  v13 = [v3 objectForKeyedSubscript:@"JFX_DEBUG_DrawOverlayBoundsOptionShowHitAreaPoints"];
  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v4, "setShowHitAreaPoints:", objc_msgSend(v13, "BOOLValue"));
    }
  }

  v14 = [v3 objectForKeyedSubscript:@"JFX_DEBUG_DrawOverlayBoundsOptionShowAdditionalRects"];
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v4, "setShowAdditionalRects:", objc_msgSend(v14, "BOOLValue"));
    }
  }

  return (JFXOverlayEffectDebugViewOptions *)v4;
}

- (JFXOverlayEffectDebugViewOptions)init
{
  v38[4] = *MEMORY[0x263EF8340];
  v34.receiver = self;
  v34.super_class = (Class)JFXOverlayEffectDebugViewOptions;
  v2 = [(JFXOverlayEffectDebugViewOptions *)&v34 init];
  id v3 = v2;
  if (v2)
  {
    [(JFXOverlayEffectDebugViewOptions *)v2 setShowDocumentBoundingBox:0];
    [(JFXOverlayEffectDebugViewOptions *)v3 setShowObjectAlignedBoundingBox:1];
    [(JFXOverlayEffectDebugViewOptions *)v3 setShowTextBoundingBoxes:1];
    [(JFXOverlayEffectDebugViewOptions *)v3 setShowHitAreaBoundingBox:1];
    [(JFXOverlayEffectDebugViewOptions *)v3 setShowFaceRect:1];
    [(JFXOverlayEffectDebugViewOptions *)v3 setShowTapPoints:0];
    [(JFXOverlayEffectDebugViewOptions *)v3 setShowMidpoint:1];
    [(JFXOverlayEffectDebugViewOptions *)v3 setShowCornerPoints:1];
    [(JFXOverlayEffectDebugViewOptions *)v3 setShowTextCornerPoints:1];
    [(JFXOverlayEffectDebugViewOptions *)v3 setShowHitAreaPoints:1];
    [(JFXOverlayEffectDebugViewOptions *)v3 setShowAdditionalRects:1];
    v4 = [MEMORY[0x263F1C550] magentaColor];
    [(JFXOverlayEffectDebugViewOptions *)v3 setDocumentBoundingBoxColor:v4];

    v5 = [MEMORY[0x263F1C550] yellowColor];
    [(JFXOverlayEffectDebugViewOptions *)v3 setOutputROIColor:v5];

    v6 = [MEMORY[0x263F1C550] cyanColor];
    [(JFXOverlayEffectDebugViewOptions *)v3 setObjectAlignedBoundingBoxColor:v6];

    v7 = [MEMORY[0x263F1C550] colorWithHue:0.261799388 saturation:0.7 brightness:0.9 alpha:1.0];
    v38[0] = v7;
    v8 = [MEMORY[0x263F1C550] colorWithHue:0.523598776 saturation:0.7 brightness:0.9 alpha:1.0];
    v38[1] = v8;
    v9 = [MEMORY[0x263F1C550] colorWithHue:0.785398163 saturation:0.7 brightness:0.9 alpha:1.0];
    v38[2] = v9;
    v10 = [MEMORY[0x263F1C550] colorWithHue:1.57079633 saturation:0.7 brightness:0.9 alpha:1.0];
    v38[3] = v10;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:4];
    [(JFXOverlayEffectDebugViewOptions *)v3 setTextBoundingBoxColors:v11];

    v12 = [MEMORY[0x263F1C550] orangeColor];
    [(JFXOverlayEffectDebugViewOptions *)v3 setHitAreaBoundingBoxColor:v12];

    v13 = [MEMORY[0x263F1C550] whiteColor];
    [(JFXOverlayEffectDebugViewOptions *)v3 setMidpointColor:v13];

    v14 = [MEMORY[0x263F1C550] lightGrayColor];
    [(JFXOverlayEffectDebugViewOptions *)v3 setOverlayCenterColor:v14];

    v15 = [MEMORY[0x263F1C550] blackColor];
    [(JFXOverlayEffectDebugViewOptions *)v3 setOriginCrosshairColor:v15];

    v16 = [MEMORY[0x263F1C550] redColor];
    v37[0] = v16;
    v17 = [MEMORY[0x263F1C550] greenColor];
    v37[1] = v17;
    v18 = [MEMORY[0x263F1C550] yellowColor];
    v37[2] = v18;
    v19 = [MEMORY[0x263F1C550] blueColor];
    v37[3] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:4];
    [(JFXOverlayEffectDebugViewOptions *)v3 setCornerPointColors:v20];

    v21 = [MEMORY[0x263F1C550] redColor];
    v36[0] = v21;
    v22 = [MEMORY[0x263F1C550] greenColor];
    v36[1] = v22;
    v23 = [MEMORY[0x263F1C550] yellowColor];
    v36[2] = v23;
    v24 = [MEMORY[0x263F1C550] blueColor];
    v36[3] = v24;
    v25 = [MEMORY[0x263F1C550] magentaColor];
    v36[4] = v25;
    v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:5];
    [(JFXOverlayEffectDebugViewOptions *)v3 setTextCornerPointColors:v26];

    v27 = [MEMORY[0x263F1C550] redColor];
    v35[0] = v27;
    v28 = [MEMORY[0x263F1C550] greenColor];
    v35[1] = v28;
    v29 = [MEMORY[0x263F1C550] yellowColor];
    v35[2] = v29;
    v30 = [MEMORY[0x263F1C550] blueColor];
    v35[3] = v30;
    v31 = [MEMORY[0x263F1C550] magentaColor];
    v35[4] = v31;
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:5];
    [(JFXOverlayEffectDebugViewOptions *)v3 setHitAreaPointColors:v32];
  }
  return v3;
}

- (id)description
{
  id v14 = (id)NSString;
  v18.receiver = self;
  v18.super_class = (Class)JFXOverlayEffectDebugViewOptions;
  v13 = [(JFXOverlayEffectDebugViewOptions *)&v18 description];
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[JFXOverlayEffectDebugViewOptions showDocumentBoundingBox](self, "showDocumentBoundingBox"));
  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[JFXOverlayEffectDebugViewOptions showObjectAlignedBoundingBox](self, "showObjectAlignedBoundingBox"));
  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[JFXOverlayEffectDebugViewOptions showTextBoundingBoxes](self, "showTextBoundingBoxes"));
  id v3 = objc_msgSend(NSNumber, "numberWithBool:", -[JFXOverlayEffectDebugViewOptions showHitAreaBoundingBox](self, "showHitAreaBoundingBox"));
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[JFXOverlayEffectDebugViewOptions showFaceRect](self, "showFaceRect"));
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[JFXOverlayEffectDebugViewOptions showTapPoints](self, "showTapPoints"));
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[JFXOverlayEffectDebugViewOptions showMidpoint](self, "showMidpoint"));
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[JFXOverlayEffectDebugViewOptions showCornerPoints](self, "showCornerPoints"));
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[JFXOverlayEffectDebugViewOptions showTextCornerPoints](self, "showTextCornerPoints"));
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[JFXOverlayEffectDebugViewOptions showHitAreaPoints](self, "showHitAreaPoints"));
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[JFXOverlayEffectDebugViewOptions showAdditionalRects](self, "showAdditionalRects"));
  id v15 = [v14 stringWithFormat:@"%@\n    showDocumentBoundingBox         %@\n    showObjectAlignedBoundingBox    %@\n    showTextBoundingBoxes           %@\n    showHitAreaBoundingBox          %@\n    showFaceRect                    %@\n    showTapPoints                   %@\n    showMidpoint                    %@\n    showCornerPoints                %@\n    showTextCornerPoints            %@\n    showHitAreaPoints               %@\n    showAdditionalRects             %@", v13, v12, v17, v16, v3, v4, v5, v6, v7, v8, v9, v10];

  return v15;
}

- (BOOL)showDocumentBoundingBox
{
  return self->_showDocumentBoundingBox;
}

- (void)setShowDocumentBoundingBox:(BOOL)a3
{
  self->_showDocumentBoundingBox = a3;
}

- (BOOL)showObjectAlignedBoundingBox
{
  return self->_showObjectAlignedBoundingBox;
}

- (void)setShowObjectAlignedBoundingBox:(BOOL)a3
{
  self->_showObjectAlignedBoundingBox = a3;
}

- (BOOL)showTextBoundingBoxes
{
  return self->_showTextBoundingBoxes;
}

- (void)setShowTextBoundingBoxes:(BOOL)a3
{
  self->_showTextBoundingBoxes = a3;
}

- (BOOL)showHitAreaBoundingBox
{
  return self->_showHitAreaBoundingBox;
}

- (void)setShowHitAreaBoundingBox:(BOOL)a3
{
  self->_showHitAreaBoundingBox = a3;
}

- (BOOL)showFaceRect
{
  return self->_showFaceRect;
}

- (void)setShowFaceRect:(BOOL)a3
{
  self->_showFaceRect = a3;
}

- (BOOL)showTapPoints
{
  return self->_showTapPoints;
}

- (void)setShowTapPoints:(BOOL)a3
{
  self->_showTapPoints = a3;
}

- (BOOL)showMidpoint
{
  return self->_showMidpoint;
}

- (void)setShowMidpoint:(BOOL)a3
{
  self->_showMidpoint = a3;
}

- (BOOL)showCornerPoints
{
  return self->_showCornerPoints;
}

- (void)setShowCornerPoints:(BOOL)a3
{
  self->_showCornerPoints = a3;
}

- (BOOL)showTextCornerPoints
{
  return self->_showTextCornerPoints;
}

- (void)setShowTextCornerPoints:(BOOL)a3
{
  self->_showTextCornerPoints = a3;
}

- (BOOL)showHitAreaPoints
{
  return self->_showHitAreaPoints;
}

- (void)setShowHitAreaPoints:(BOOL)a3
{
  self->_showHitAreaPoints = a3;
}

- (BOOL)showAdditionalRects
{
  return self->_showAdditionalRects;
}

- (void)setShowAdditionalRects:(BOOL)a3
{
  self->_showAdditionalRects = a3;
}

- (UIColor)documentBoundingBoxColor
{
  return self->_documentBoundingBoxColor;
}

- (void)setDocumentBoundingBoxColor:(id)a3
{
}

- (UIColor)outputROIColor
{
  return self->_outputROIColor;
}

- (void)setOutputROIColor:(id)a3
{
}

- (UIColor)objectAlignedBoundingBoxColor
{
  return self->_objectAlignedBoundingBoxColor;
}

- (void)setObjectAlignedBoundingBoxColor:(id)a3
{
}

- (NSArray)textBoundingBoxColors
{
  return self->_textBoundingBoxColors;
}

- (void)setTextBoundingBoxColors:(id)a3
{
}

- (UIColor)hitAreaBoundingBoxColor
{
  return self->_hitAreaBoundingBoxColor;
}

- (void)setHitAreaBoundingBoxColor:(id)a3
{
}

- (UIColor)midpointColor
{
  return self->_midpointColor;
}

- (void)setMidpointColor:(id)a3
{
}

- (UIColor)overlayCenterColor
{
  return self->_overlayCenterColor;
}

- (void)setOverlayCenterColor:(id)a3
{
}

- (UIColor)originCrosshairColor
{
  return self->_originCrosshairColor;
}

- (void)setOriginCrosshairColor:(id)a3
{
}

- (NSArray)cornerPointColors
{
  return self->_cornerPointColors;
}

- (void)setCornerPointColors:(id)a3
{
}

- (NSArray)textCornerPointColors
{
  return self->_textCornerPointColors;
}

- (void)setTextCornerPointColors:(id)a3
{
}

- (NSArray)hitAreaPointColors
{
  return self->_hitAreaPointColors;
}

- (void)setHitAreaPointColors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hitAreaPointColors, 0);
  objc_storeStrong((id *)&self->_textCornerPointColors, 0);
  objc_storeStrong((id *)&self->_cornerPointColors, 0);
  objc_storeStrong((id *)&self->_originCrosshairColor, 0);
  objc_storeStrong((id *)&self->_overlayCenterColor, 0);
  objc_storeStrong((id *)&self->_midpointColor, 0);
  objc_storeStrong((id *)&self->_hitAreaBoundingBoxColor, 0);
  objc_storeStrong((id *)&self->_textBoundingBoxColors, 0);
  objc_storeStrong((id *)&self->_objectAlignedBoundingBoxColor, 0);
  objc_storeStrong((id *)&self->_outputROIColor, 0);
  objc_storeStrong((id *)&self->_documentBoundingBoxColor, 0);
}

@end