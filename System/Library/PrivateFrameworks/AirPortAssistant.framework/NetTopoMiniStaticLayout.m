@interface NetTopoMiniStaticLayout
- (CALayer)containerLayer;
- (CGImage)imageForDeviceSpec:(id)a3 wantSmall:(BOOL)a4 forContentsScale:(double)a5;
- (NSArray)topoDeviceLayers;
- (NSArray)topoDevicesDescriptor;
- (NetTopoMiniStaticLayout)initWithContainerLayer:(id)a3 andOptions:(int)a4;
- (id)owningView;
- (int)layoutOptions;
- (void)createLayoutForDevices:(id)a3;
- (void)dealloc;
- (void)destroyDeviceLayers;
- (void)performLayout;
- (void)setContainerLayer:(id)a3;
- (void)setLayoutOptions:(int)a3;
- (void)setOwningView:(id)a3;
- (void)setTopoDevicesDescriptor:(id)a3;
@end

@implementation NetTopoMiniStaticLayout

- (NetTopoMiniStaticLayout)initWithContainerLayer:(id)a3 andOptions:(int)a4
{
  v13.receiver = self;
  v13.super_class = (Class)NetTopoMiniStaticLayout;
  v10 = [(NetTopoMiniStaticLayout *)&v13 init];
  if (v10)
  {
    if (dword_268147EF8 <= 800 && (dword_268147EF8 != -1 || sub_226865630((uint64_t)&dword_268147EF8, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147EF8, (uint64_t)"-[NetTopoMiniStaticLayout initWithContainerLayer:andOptions:]", 800, (uint64_t)"containerLayer = %@, options = %d\n", v6, v7, v8, v9, (uint64_t)a3);
    }
    v10->_containerLayer = (CALayer *)a3;
    v10->_layoutOptions = a4;
    objc_msgSend_setMasksToBounds_(a3, v11, 1);
    v10->_topoDeviceLayers = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v10->_connectionLayers = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  }
  return v10;
}

- (void)destroyDeviceLayers
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (objc_msgSend_count(self->_topoDeviceLayers, a2, v2))
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    topoDeviceLayers = self->_topoDeviceLayers;
    uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(topoDeviceLayers, v4, (uint64_t)&v25, v30, 16);
    if (v7)
    {
      uint64_t v10 = v7;
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(topoDeviceLayers);
          }
          objc_msgSend_removeFromSuperlayer(*(void **)(*((void *)&v25 + 1) + 8 * i), v8, v9);
        }
        uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(topoDeviceLayers, v8, (uint64_t)&v25, v30, 16);
      }
      while (v10);
    }
    objc_msgSend_removeAllObjects(self->_topoDeviceLayers, v8, v9);
  }
  if (objc_msgSend_count(self->_connectionLayers, v4, v5))
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    connectionLayers = self->_connectionLayers;
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(connectionLayers, v13, (uint64_t)&v21, v29, 16);
    if (v15)
    {
      uint64_t v18 = v15;
      uint64_t v19 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(connectionLayers);
          }
          objc_msgSend_removeFromSuperlayer(*(void **)(*((void *)&v21 + 1) + 8 * j), v16, v17);
        }
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(connectionLayers, v16, (uint64_t)&v21, v29, 16);
      }
      while (v18);
    }
    objc_msgSend_removeAllObjects(self->_connectionLayers, v16, v17);
  }
}

- (void)dealloc
{
  objc_msgSend_destroyDeviceLayers(self, a2, v2);

  v4.receiver = self;
  v4.super_class = (Class)NetTopoMiniStaticLayout;
  [(NetTopoMiniStaticLayout *)&v4 dealloc];
}

- (void)setContainerLayer:(id)a3
{
  if (self->_containerLayer != a3)
  {
    if (dword_268147EF8 <= 800 && (dword_268147EF8 != -1 || sub_226865630((uint64_t)&dword_268147EF8, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147EF8, (uint64_t)"-[NetTopoMiniStaticLayout setContainerLayer:]", 800, (uint64_t)"containerLayer = %@\n", v3, v4, v5, v6, (uint64_t)a3);
    }
    objc_msgSend_destroyDeviceLayers(self, a2, (uint64_t)a3);
    id v9 = a3;

    self->_containerLayer = (CALayer *)a3;
  }
}

- (CALayer)containerLayer
{
  return self->_containerLayer;
}

- (void)setOwningView:(id)a3
{
  if (self->_owningView != a3)
  {
    if (dword_268147EF8 <= 800 && (dword_268147EF8 != -1 || sub_226865630((uint64_t)&dword_268147EF8, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147EF8, (uint64_t)"-[NetTopoMiniStaticLayout setOwningView:]", 800, (uint64_t)"owningView = %@\n", v3, v4, v5, v6, (uint64_t)a3);
    }
    id v9 = a3;

    self->_owningView = a3;
  }
}

- (id)owningView
{
  return self->_owningView;
}

- (CGImage)imageForDeviceSpec:(id)a3 wantSmall:(BOOL)a4 forContentsScale:(double)a5
{
  BOOL v6 = a4;
  id v9 = objc_msgSend_objectForKey_(a3, a2, (uint64_t)off_268147F38[0]);
  if (!objc_msgSend_isEqualToString_(v9, v10, (uint64_t)off_268147F40[0])) {
    return 0;
  }
  uint64_t v13 = objc_msgSend_layoutOptions(self, v11, v12) & 1;
  uint64_t v15 = objc_msgSend_objectForKey_(a3, v14, (uint64_t)off_268147F48[0]);
  uint64_t v18 = objc_msgSend_unsignedIntegerValue(v15, v16, v17);
  v20 = objc_msgSend_objectForKey_(a3, v19, (uint64_t)off_268147F50[0]);
  uint64_t v23 = objc_msgSend_unsignedIntegerValue(v20, v21, v22);
  uint64_t v25 = objc_msgSend_imageForBaseStationWithProductID_subProductID_deviceKind_small_cropped_threeDee_(ImageStore, v24, v18, 0, v23, 0, v13, 0);
  long long v27 = (CGImage *)objc_msgSend_cgImageFromImage_forContentsScale_(ImageStore, v26, v25, a5);
  CGImageRef v28 = v27;
  if (v6)
  {
    CGImageRef v28 = sub_2268EF3A0(v27, 75.0);
    v29 = v28;
  }
  return v28;
}

- (void)performLayout
{
  uint64_t v154 = *MEMORY[0x263EF8340];
  if (dword_268147EF8 <= 800 && (dword_268147EF8 != -1 || sub_226865630((uint64_t)&dword_268147EF8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147EF8, (uint64_t)"-[NetTopoMiniStaticLayout performLayout]", 800, (uint64_t)"self = %@\n", v3, v4, v5, v6, (uint64_t)self);
  }
  char v8 = objc_msgSend_layoutOptions(self, a2, v2);
  char v11 = v8;
  if ((v8 & 2) != 0) {
    double v12 = 28.0;
  }
  else {
    double v12 = 35.0;
  }
  if ((v8 & 2) != 0) {
    double v13 = 66.6666667;
  }
  else {
    double v13 = 100.0;
  }
  if ((v8 & 2) != 0) {
    double v14 = 5.0;
  }
  else {
    double v14 = 10.0;
  }
  if (objc_msgSend_layoutOptions(self, v9, v10))
  {
    long long v149 = 0u;
    long long v150 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    topoDeviceLayers = self->_topoDeviceLayers;
    uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(topoDeviceLayers, v15, (uint64_t)&v147, v153, 16);
    if (v41)
    {
      uint64_t v43 = v41;
      uint64_t v44 = 0;
      uint64_t v45 = *(void *)v148;
      double v46 = dbl_226913340[(v11 & 2) == 0];
      do
      {
        for (uint64_t i = 0; i != v43; ++i)
        {
          if (*(void *)v148 != v45) {
            objc_enumerationMutation(topoDeviceLayers);
          }
          v48 = *(void **)(*((void *)&v147 + 1) + 8 * i);
          v49 = objc_msgSend_containerLayer(self, v17, v42);
          objc_msgSend_frame(v49, v50, v51);
          double v53 = v52;
          v56 = objc_msgSend_containerLayer(self, v54, v55);
          objc_msgSend_bounds(v56, v57, v58);
          float v60 = (v59 - v53) * 0.5;
          float v61 = v46 * (double)(unint64_t)(v44 + i);
          objc_msgSend_setFrame_(v48, v62, v63, floorf(v60), floorf(v61), v53, v13);
        }
        uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(topoDeviceLayers, v17, (uint64_t)&v147, v153, 16);
        v44 += i;
      }
      while (v43);
    }
  }
  else if ((objc_msgSend_layoutOptions(self, v15, v16) & 1) == 0)
  {
    uint64_t v19 = objc_msgSend_count(self->_topoDeviceLayers, v17, v18);
    uint64_t v22 = objc_msgSend_containerLayer(self, v20, v21);
    objc_msgSend_bounds(v22, v23, v24);
    double Width = CGRectGetWidth(v155);
    double v30 = 0.0;
    if ((objc_msgSend_layoutOptions(self, v26, v27) & 8) == 0)
    {
      char v31 = objc_msgSend_layoutOptions(self, v28, v29);
      v34 = objc_msgSend_containerLayer(self, v32, v33);
      objc_msgSend_bounds(v34, v35, v36);
      double v38 = v37 - v13;
      if ((v31 & 4) != 0)
      {
        double v30 = v38 + -7.0;
      }
      else
      {
        float v39 = v38 * 0.5;
        double v30 = floorf(v39);
      }
    }
    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    v64 = self->_topoDeviceLayers;
    uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v28, (uint64_t)&v143, v152, 16);
    if (v65)
    {
      uint64_t v67 = v65;
      uint64_t v68 = 0;
      float v69 = (Width + -20.0 - (double)(unint64_t)(v19 - 1) * v14) / (double)(unint64_t)v19;
      double v70 = floorf(v69);
      uint64_t v71 = *(void *)v144;
      double v72 = v14 + v70;
      do
      {
        for (uint64_t j = 0; j != v67; ++j)
        {
          if (*(void *)v144 != v71) {
            objc_enumerationMutation(v64);
          }
          v74 = *(void **)(*((void *)&v143 + 1) + 8 * j);
          v75 = objc_msgSend_containerLayer(self, v17, v66);
          objc_msgSend_bounds(v75, v76, v77);
          double v79 = v78;
          float v80 = v72 * (double)(unint64_t)(v68 + j);
          double v81 = floorf(v80) + 10.0;
          v84 = objc_msgSend_containerLayer(self, v82, v83);
          objc_msgSend_bounds(v84, v85, v86);
          float v88 = v87 - v79 - v30;
          objc_msgSend_setFrame_(v74, v89, v90, v81, floorf(v88), v70, v79);
          objc_msgSend_setLabelPinnedHeight_(v74, v91, v92, v12);
          objc_msgSend_setBoundsSizeConstraint_(v74, v93, v94, v70, v79);
        }
        uint64_t v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v17, (uint64_t)&v143, v152, 16);
        v68 += j;
      }
      while (v67);
    }
  }
  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  connectionLayers = self->_connectionLayers;
  uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(connectionLayers, v17, (uint64_t)&v139, v151, 16);
  if (v96)
  {
    uint64_t v99 = v96;
    uint64_t v100 = *(void *)v140;
    do
    {
      for (uint64_t k = 0; k != v99; ++k)
      {
        if (*(void *)v140 != v100) {
          objc_enumerationMutation(connectionLayers);
        }
        v102 = *(void **)(*((void *)&v139 + 1) + 8 * k);
        if (objc_msgSend_layoutOptions(self, v97, v98))
        {
          objc_msgSend_setUpstreamDeviceSpatialRelationship_(v102, v103, 4);
          v121 = objc_msgSend_parent(v102, v119, v120);
          double v109 = 0.0;
          double v124 = 0.0;
          double v111 = 0.0;
          if (v121)
          {
            objc_msgSend_getConnectionAttachmentLocations(v121, v122, v123);
            double v111 = v137;
            double v124 = v138;
          }
          v125 = objc_msgSend_childAtIndex_(v102, v122, 0);
          double v115 = 0.0;
          if (v125)
          {
            objc_msgSend_getConnectionAttachmentLocations(v125, v126, v127);
            double v115 = v135;
            double v109 = v136;
          }
          double v110 = v124;
          uint64_t v116 = 2;
          objc_msgSend_setFrame_(v102, v126, v127, v111, v124, 24.0, v109 - v124);
        }
        else
        {
          objc_msgSend_setUpstreamDeviceSpatialRelationship_(v102, v103, 1);
          v106 = objc_msgSend_parent(v102, v104, v105);
          double v109 = 0.0;
          double v110 = 0.0;
          double v111 = 0.0;
          if (v106)
          {
            objc_msgSend_getConnectionAttachmentLocations(v106, v107, v108);
            double v111 = v133;
            double v110 = v134;
          }
          v112 = objc_msgSend_childAtIndex_(v102, v107, 0);
          double v115 = 0.0;
          if (v112)
          {
            objc_msgSend_getConnectionAttachmentLocations(v112, v113, v114);
            double v115 = v131;
            double v109 = v132;
          }
          uint64_t v116 = 3;
          objc_msgSend_setFrame_(v102, v113, v114, v111, v110 + -12.0, v115 - v111, 24.0);
        }
        objc_msgSend_setUpstreamConnectionPoint_(v102, v117, v118, v111, v110);
        objc_msgSend_setUpstreamConnectionSide_(v102, v128, v116);
        objc_msgSend_setDownstreamConnectionPoint_(v102, v129, v130, v115, v109);
      }
      uint64_t v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(connectionLayers, v97, (uint64_t)&v139, v151, 16);
    }
    while (v99);
  }
}

- (void)createLayoutForDevices:(id)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  if (dword_268147EF8 <= 800 && (dword_268147EF8 != -1 || sub_226865630((uint64_t)&dword_268147EF8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147EF8, (uint64_t)"-[NetTopoMiniStaticLayout createLayoutForDevices:]", 800, (uint64_t)"self = %@\n", v3, v4, v5, v6, (uint64_t)self);
  }
  unsigned int v8 = objc_msgSend_layoutOptions(self, a2, (uint64_t)a3);
  objc_msgSend_setTopoDevicesDescriptor_(self, v9, (uint64_t)a3);
  objc_msgSend_destroyDeviceLayers(self, v10, v11);
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v12, (uint64_t)&v80, v84, 16);
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = 0;
    uint64_t v18 = (v8 >> 1) & 1;
    uint64_t v79 = *(void *)v81;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v81 != v79) {
          objc_enumerationMutation(a3);
        }
        v20 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        uint64_t v21 = [NetTopoAirPortDeviceLayer alloc];
        uint64_t v24 = objc_msgSend_owningView(self, v22, v23);
        id v26 = (id)objc_msgSend_initWithUIStyle_andOwningView_(v21, v25, 1, v24);
        objc_msgSend_contentsScale(v26, v27, v28);
        uint64_t v30 = objc_msgSend_imageForDeviceSpec_wantSmall_forContentsScale_(self, v29, (uint64_t)v20, v18);
        objc_msgSend_setObjectImage_(v26, v31, v30);
        objc_msgSend_setSmallSize_(v26, v32, v18);
        objc_msgSend_setSelectable_(v26, v33, 0);
        v35 = objc_msgSend_objectForKey_(v20, v34, (uint64_t)off_268147F58[0]);
        double v37 = objc_msgSend_objectForKey_(v20, v36, (uint64_t)off_268147F60[0]);
        if (objc_msgSend_length(v35, v38, v39)) {
          objc_msgSend_setLabel_(v26, v40, (uint64_t)v35);
        }
        if (objc_msgSend_length(v37, v40, v41))
        {
          if (objc_msgSend_length(v35, v42, v43)) {
            objc_msgSend_setSecondaryLabel_(v26, v44, (uint64_t)v37);
          }
          else {
            objc_msgSend_setLabel_(v26, v44, (uint64_t)v37);
          }
        }
        uint64_t v45 = objc_msgSend_containerLayer(self, v42, v43);
        objc_msgSend_addSublayer_(v45, v46, (uint64_t)v26);
        objc_msgSend_setNeedsDisplay(v26, v47, v48);
        objc_msgSend_addObject_(self->_topoDeviceLayers, v49, (uint64_t)v26);
        uint64_t v51 = objc_msgSend_objectForKey_(v20, v50, (uint64_t)off_268147F68[0]);
        if (v51 && v17 + i)
        {
          double v53 = v51;
          if (objc_msgSend_isEqualToString_(v51, v52, (uint64_t)off_268147F78[0]))
          {
            uint64_t v55 = 1;
          }
          else if (objc_msgSend_isEqualToString_(v53, v54, (uint64_t)off_268147F80))
          {
            uint64_t v55 = 3;
          }
          else
          {
            uint64_t v55 = 2;
          }
          v56 = [NetTopoDeviceConnectionLayer alloc];
          uint64_t v59 = objc_msgSend_owningView(self, v57, v58);
          id v61 = (id)objc_msgSend_initWithUIStyle_andOwningView_(v56, v60, 1, v59);
          objc_msgSend_setSmallSize_(v61, v62, v18);
          objc_msgSend_setSelectable_(v61, v63, 0);
          objc_msgSend_setConnectionMediumFallback_(v61, v64, v55);
          if (objc_msgSend_isEqualToString_(v53, v65, (uint64_t)off_268147F80)) {
            objc_msgSend_setConnectionStyle_(v61, v66, 5);
          }
          else {
            objc_msgSend_setConnectionStyle_(v61, v66, 1);
          }
          float v69 = objc_msgSend_containerLayer(self, v67, v68);
          objc_msgSend_addSublayer_(v69, v70, (uint64_t)v61);
          objc_msgSend_setNeedsDisplay(v61, v71, v72);
          uint64_t v74 = objc_msgSend_objectAtIndex_(self->_topoDeviceLayers, v73, v17 + i - 1);
          objc_msgSend_setParent_(v61, v75, v74);
          objc_msgSend_addChild_(v61, v76, (uint64_t)v26);
          objc_msgSend_addObject_(self->_connectionLayers, v77, (uint64_t)v61);
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v52, (uint64_t)&v80, v84, 16);
      v17 += i;
    }
    while (v16);
  }
  objc_msgSend_performLayout(self, v14, v15);
}

- (NSArray)topoDeviceLayers
{
  return &self->_topoDeviceLayers->super;
}

- (NSArray)topoDevicesDescriptor
{
  return self->_topoDevicesDescriptor;
}

- (void)setTopoDevicesDescriptor:(id)a3
{
}

- (int)layoutOptions
{
  return self->_layoutOptions;
}

- (void)setLayoutOptions:(int)a3
{
  self->_layoutOptions = a3;
}

@end