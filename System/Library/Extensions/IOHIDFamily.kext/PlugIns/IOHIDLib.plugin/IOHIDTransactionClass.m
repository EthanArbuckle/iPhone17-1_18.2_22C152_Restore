@interface IOHIDTransactionClass
- (IOHIDTransactionClass)initWithDevice:(id)a3;
- (id)device;
- (int)addElement:(__IOHIDElement *)a3;
- (int)clear;
- (int)commit:(void *)a3 timeout:(unsigned int)a4 callback:(void *)a5 options:(unsigned int)a6;
- (int)containsElement:(__IOHIDElement *)a3 value:(char *)a4;
- (int)getAsyncEventSource:(const void *)a3;
- (int)getDirection:(unsigned int *)a3;
- (int)getValue:(__IOHIDElement *)a3 value:(__IOHIDValue *)a4 options:(unsigned int)a5;
- (int)queryInterface:(id)a3 outInterface:(void *)a4;
- (int)removeElement:(__IOHIDElement *)a3;
- (int)setDirection:(unsigned int)a3;
- (int)setValue:(__IOHIDElement *)a3 value:(__IOHIDValue *)a4 options:(unsigned int)a5;
- (void)dealloc;
- (void)setDevice:(id)a3;
@end

@implementation IOHIDTransactionClass

- (int)queryInterface:(id)a3 outInterface:(void *)a4
{
  CFUUIDRef v6 = CFUUIDCreateFromUUIDBytes(0, (CFUUIDBytes)a3);
  CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes(0, 0x1Fu, 0x2Eu, 0x78u, 0xFAu, 0x9Fu, 0xFAu, 0x11u, 0xDAu, 0x90u, 0xB4u, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
  if (!CFEqual(v6, v7))
  {
    int v8 = -2147483644;
    if (!v6) {
      return v8;
    }
    goto LABEL_3;
  }
  *a4 = &self->_interface;
  CFRetain(self);
  int v8 = 0;
  if (v6) {
LABEL_3:
  }
    CFRelease(v6);
  return v8;
}

- (int)getAsyncEventSource:(const void *)a3
{
  if (!a3) {
    return -536870206;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  *a3 = (const void *)objc_msgSend_runLoopSource(WeakRetained, v5, v6, v7, v8);

  return 0;
}

- (int)setDirection:(unsigned int)a3
{
  self->_direction = a3;
  return 0;
}

- (int)getDirection:(unsigned int *)a3
{
  if (!a3) {
    return -536870206;
  }
  int result = 0;
  *a3 = self->_direction;
  return result;
}

- (int)addElement:(__IOHIDElement *)a3
{
  v3 = a3;
  int v4 = -536870212;
  if (a3)
  {
    uint64_t v6 = [HIDLibElement alloc];
    v3 = objc_msgSend_initWithElementRef_(v6, v7, (uint64_t)v3, v8, v9);
    if (v3
      && (objc_msgSend_containsObject_(self->_elements, v10, (uint64_t)v3, v11, v12) & 1) == 0
      && (self->_direction != 1
       || objc_msgSend_type(v3, v13, v14, v15, v16) == 129
       || objc_msgSend_type(v3, v13, v17, v15, v16) == 257))
    {
      objc_msgSend_addObject_(self->_elements, v13, (uint64_t)v3, v15, v16);
      int v4 = 0;
    }
  }
  else
  {
    int v4 = -536870206;
  }

  return v4;
}

- (int)removeElement:(__IOHIDElement *)a3
{
  v3 = a3;
  int v4 = -536870212;
  if (a3)
  {
    uint64_t v6 = [HIDLibElement alloc];
    v3 = objc_msgSend_initWithElementRef_(v6, v7, (uint64_t)v3, v8, v9);
    if (v3 && objc_msgSend_containsObject_(self->_elements, v10, (uint64_t)v3, v11, v12))
    {
      objc_msgSend_removeObject_(self->_elements, v13, (uint64_t)v3, v14, v15);
      int v4 = 0;
    }
  }
  else
  {
    int v4 = -536870206;
  }

  return v4;
}

- (int)containsElement:(__IOHIDElement *)a3 value:(char *)a4
{
  int result = -536870206;
  if (a3 && a4)
  {
    uint64_t v8 = [HIDLibElement alloc];
    uint64_t v12 = objc_msgSend_initWithElementRef_(v8, v9, (uint64_t)a3, v10, v11);
    if (v12)
    {
      uint64_t v16 = (void *)v12;
      *a4 = objc_msgSend_containsObject_(self->_elements, v13, v12, v14, v15);

      return 0;
    }
    else
    {
      return -536870212;
    }
  }
  return result;
}

- (int)setValue:(__IOHIDElement *)a3 value:(__IOHIDValue *)a4 options:(unsigned int)a5
{
  v5 = 0;
  int v6 = -536870206;
  if (!a3 || !a4) {
    goto LABEL_10;
  }
  if (self->_direction != 1)
  {
    v5 = 0;
LABEL_12:
    int v6 = -536870212;
    goto LABEL_10;
  }
  char v9 = a5;
  uint64_t v11 = [HIDLibElement alloc];
  v5 = objc_msgSend_initWithElementRef_(v11, v12, (uint64_t)a3, v13, v14);
  if (!v5 || !objc_msgSend_containsObject_(self->_elements, v15, (uint64_t)v5, v16, v17)) {
    goto LABEL_12;
  }
  if (v9) {
    objc_msgSend_setDefaultValueRef_(v5, v18, (uint64_t)a4, v19, v20);
  }
  else {
    objc_msgSend_setValueRef_(v5, v18, (uint64_t)a4, v19, v20);
  }
  elements = self->_elements;
  uint64_t v25 = objc_msgSend_indexOfObject_(elements, v21, (uint64_t)v5, v22, v23);
  objc_msgSend_replaceObjectAtIndex_withObject_(elements, v26, v25, (uint64_t)v5, v27);
  int v6 = 0;
LABEL_10:

  return v6;
}

- (int)getValue:(__IOHIDElement *)a3 value:(__IOHIDValue *)a4 options:(unsigned int)a5
{
  v5 = 0;
  int v6 = -536870206;
  if (a3)
  {
    uint64_t v8 = 0;
    if (a4)
    {
      char v9 = a5;
      uint64_t v12 = [HIDLibElement alloc];
      uint64_t v8 = objc_msgSend_initWithElementRef_(v12, v13, (uint64_t)a3, v14, v15);
      if (v8 && objc_msgSend_containsObject_(self->_elements, v16, (uint64_t)v8, v17, v18))
      {
        elements = self->_elements;
        uint64_t v23 = objc_msgSend_indexOfObject_(elements, v19, (uint64_t)v8, v20, v21);
        uint64_t v27 = objc_msgSend_objectAtIndex_(elements, v24, v23, v25, v26);
        v5 = v27;
        if (v9) {
          v32 = (__IOHIDValue *)objc_msgSend_defaultValueRef(v27, v28, v29, v30, v31);
        }
        else {
          v32 = (__IOHIDValue *)objc_msgSend_valueRef(v27, v28, v29, v30, v31);
        }
        int v6 = 0;
        *a4 = v32;
      }
      else
      {
        v5 = 0;
        int v6 = -536870212;
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v6;
}

- (int)commit:(void *)a3 timeout:(unsigned int)a4 callback:(void *)a5 options:(unsigned int)a6
{
  uint64_t v178 = *MEMORY[0x263EF8340];
  size_t v169 = 0;
  uint64_t entryID = 0xAAAAAAAAAAAAAAAALL;
  uint64_t input = 0;
  long long v177 = 0uLL;
  unsigned int v11 = objc_msgSend_count(self->_elements, a2, (uint64_t)a3, *(uint64_t *)&a4, (uint64_t)a5);
  CFTypeRef cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v174 = v12;
  long long v175 = v12;
  *(_OWORD *)reference = v12;
  long long v173 = v12;
  int Value_value_timeout_callback_context_options = -536870212;
  uint64_t v14 = v11;
  if (!v11) {
    goto LABEL_68;
  }
  unsigned int v159 = v11;
  p_device = &self->_device;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  io_registry_entry_t v21 = objc_msgSend_service(WeakRetained, v17, v18, v19, v20);
  IORegistryEntryGetRegistryEntryID(v21, &entryID);

  *((void *)&v177 + 1) = a6;
  if (!a5)
  {
    uint64_t v26 = 0;
    goto LABEL_6;
  }
  uint64_t input = a4;
  uint64_t v25 = malloc_type_calloc(1uLL, 0x28uLL, 0x800402FCC0CB6uLL);
  if (!v25)
  {
LABEL_68:
    uint64_t v31 = 0;
    goto LABEL_60;
  }
  uint64_t v26 = v25;
  *uint64_t v25 = a5;
  v25[1] = a3;
  id v27 = objc_loadWeakRetained((id *)&self->_device);
  v26[2] = v27;

  v28 = (void *)v26[4];
  v26[3] = &self->_interface;
  v26[4] = 0;

  reference[1] = (uint64_t)sub_24076982C;
  *(void *)&long long v173 = v26;
LABEL_6:
  id obj = a5;
  v163 = v26;
  if (self->_direction == 1)
  {
    size_t inputStructCnt = 0;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    do
    {
      v32 = v31;
      uint64_t v31 = objc_msgSend_objectAtIndex_(self->_elements, v22, v30, v23, v24);

      id v33 = objc_loadWeakRetained((id *)&self->_device);
      uint64_t v38 = objc_msgSend_elementRef(v31, v34, v35, v36, v37);
      uint64_t v43 = objc_msgSend_valueRef(v31, v39, v40, v41, v42);
      int Value_value_timeout_callback_context_options = objc_msgSend_setValue_value_timeout_callback_context_options_(v33, v44, v38, v43, 0, 0, 0, 0x10000);

      if (Value_value_timeout_callback_context_options)
      {
        v156 = _IOHIDLogCategory();
        if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR)) {
          sub_240774E2C();
        }

        goto LABEL_57;
      }
      v49 = (__IOHIDValue *)objc_msgSend_valueRef(v31, v45, v46, v47, v48);
      inputStructCnt += IOHIDValueGetLength(v49) + 8;
      size_t v169 = inputStructCnt;
      ++v30;
    }
    while (v14 != v30);
    v50 = (char *)malloc_type_malloc(inputStructCnt, 0x21423F39uLL);
    if (!v50)
    {
      int Value_value_timeout_callback_context_options = -536870211;
      goto LABEL_57;
    }
    v54 = v50;
    uint64_t v55 = 0;
    uint64_t v56 = 0;
    do
    {
      v57 = v31;
      uint64_t v31 = objc_msgSend_objectAtIndex_(self->_elements, v51, v55, v52, v53);

      objc_msgSend_valueRef(v31, v58, v59, v60, v61);
      _IOHIDValueCopyToElementValueHeader();
      v56 += *(unsigned int *)&v54[v56 + 4] + 8;
      ++v55;
    }
    while (v14 != v55);
    id v62 = objc_loadWeakRetained((id *)&self->_device);
    mach_port_t v67 = objc_msgSend_connect(v62, v63, v64, v65, v66);
    mach_port_t v68 = v67;
    if (obj)
    {
      id v69 = objc_loadWeakRetained((id *)p_device);
      mach_port_t Port = objc_msgSend_getPort(v69, v70, v71, v72, v73);
      int Value_value_timeout_callback_context_options = IOConnectCallAsyncMethod(v68, 0xBu, Port, reference, 3u, &input, 1u, v54, inputStructCnt, 0, 0, 0, 0);
    }
    else
    {
      int Value_value_timeout_callback_context_options = IOConnectCallMethod(v67, 0xBu, &input, 1u, v54, inputStructCnt, 0, 0, 0, 0);
    }
    uint64_t v26 = v163;

    if (Value_value_timeout_callback_context_options)
    {
      v119 = _IOHIDLogCategory();
      if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
        sub_240774DC4();
      }
    }
    goto LABEL_55;
  }
  size_t v75 = 0;
  uint64_t v76 = 0;
  uint64_t v31 = 0;
  do
  {
    v77 = v31;
    uint64_t v31 = objc_msgSend_objectAtIndex_(self->_elements, v22, v76, v23, v24);

    objc_msgSend_elementRef(v31, v78, v79, v80, v81);
    v75 += _IOHIDElementGetLength() + 24;
    CFTypeRef cf = (CFTypeRef)objc_msgSend_valueRef(v31, v82, v83, v84, v85);
    size_t v169 = v75;
    id v86 = objc_loadWeakRetained((id *)&self->_device);
    uint64_t v91 = objc_msgSend_elementRef(v31, v87, v88, v89, v90);
    int Value_value_timeout_callback_context_options = objc_msgSend_getValue_value_timeout_callback_context_options_(v86, v92, v91, (uint64_t)&cf, 0, 0, 0, 0x10000);

    if (Value_value_timeout_callback_context_options)
    {
      v157 = _IOHIDLogCategory();
      if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR)) {
        sub_240774FFC();
      }

      goto LABEL_67;
    }
    ++v76;
  }
  while (v14 != v76);
  v93 = malloc_type_malloc(4 * v159, 0x68658BD9uLL);
  if (!v93)
  {
    int Value_value_timeout_callback_context_options = -536870211;
LABEL_67:
    uint64_t v26 = v163;
    goto LABEL_57;
  }
  v97 = v93;
  size_t v160 = 4 * v159;
  uint64_t v98 = 0;
  uint64_t v26 = v163;
  do
  {
    v99 = v31;
    uint64_t v31 = objc_msgSend_objectAtIndex_(self->_elements, v94, v98, v95, v96);

    v97[v98++] = objc_msgSend_elementCookie(v31, v100, v101, v102, v103);
  }
  while (v14 != v98);
  if (obj)
  {
    *(void *)&long long v177 = v75;
    uint64_t v104 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v94, (uint64_t)self->_elements, v95, v96);
    v105 = (void *)v163[4];
    v163[4] = v104;

    int Value_value_timeout_callback_context_options = -536870211;
    if (v104)
    {
      id v106 = objc_loadWeakRetained((id *)&self->_device);
      mach_port_t v111 = objc_msgSend_connect(v106, v107, v108, v109, v110);
      id v112 = objc_loadWeakRetained((id *)p_device);
      mach_port_t v117 = objc_msgSend_getPort(v112, v113, v114, v115, v116);
      int Value_value_timeout_callback_context_options = IOConnectCallAsyncMethod(v111, 0xAu, v117, reference, 3u, &input, 3u, v97, v160, 0, 0, 0, 0);

      if (Value_value_timeout_callback_context_options)
      {
        v158 = _IOHIDLogCategory();
        if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR)) {
          sub_240774F94();
        }
      }
    }
    goto LABEL_24;
  }
  v120 = (char *)malloc_type_calloc(1uLL, v75, 0xD786148FuLL);
  int Value_value_timeout_callback_context_options = -536870211;
  if (!v120)
  {
LABEL_24:
    v118 = v97;
    goto LABEL_56;
  }
  v54 = v120;
  id v121 = objc_loadWeakRetained((id *)&self->_device);
  mach_port_t v126 = objc_msgSend_connect(v121, v122, v123, v124, v125);
  int Value_value_timeout_callback_context_options = IOConnectCallMethod(v126, 0xAu, &input, 3u, v97, v160, 0, 0, v54, &v169);

  if (Value_value_timeout_callback_context_options)
  {
    _IOHIDLogCategory();
    obja = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&obja->super.super, OS_LOG_TYPE_ERROR)) {
      sub_240774F94();
    }
    goto LABEL_54;
  }
  long long v166 = 0u;
  long long v167 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  obja = self->_elements;
  uint64_t v128 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v127, (uint64_t)&v164, (uint64_t)v171, 16);
  if (!v128)
  {
    v151 = 0;
    goto LABEL_53;
  }
  uint64_t v129 = v128;
  size_t v130 = 0;
  uint64_t v131 = *(void *)v165;
  v132 = v31;
  while (2)
  {
    uint64_t v133 = 0;
    v134 = v132;
    while (2)
    {
      if (*(void *)v165 != v131) {
        objc_enumerationMutation(obja);
      }
      v132 = *(id *)(*((void *)&v164 + 1) + 8 * v133);

      v139 = &v54[v130];
      unint64_t v140 = *(unsigned int *)&v54[v130 + 4];
      v130 += v140 >> 8;
      if (v140 >> 10 < 5 || v130 > v169)
      {
        uint64_t v31 = _IOHIDLogCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          sub_240774E94((_DWORD *)v139 + 1, v31);
        }
        goto LABEL_52;
      }
      int v142 = *(_DWORD *)v139;
      if (v142 != objc_msgSend_elementCookie(v132, v135, v136, v137, v138))
      {
        uint64_t v31 = _IOHIDLogCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          sub_240774F14((uint64_t)v139, v132, (uint64_t)v31, v152, v153);
        }
LABEL_52:
        v151 = v132;
        goto LABEL_53;
      }
      objc_msgSend_elementRef(v132, v143, v144, v145, v146);
      CFTypeRef cf = (CFTypeRef)_IOHIDValueCreateWithElementValuePtr();
      objc_msgSend_setValueRef_(v132, v147, (uint64_t)cf, v148, v149);
      if (cf) {
        CFRelease(cf);
      }
      ++v133;
      v134 = v132;
      if (v129 != v133) {
        continue;
      }
      break;
    }
    uint64_t v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v150, (uint64_t)&v164, (uint64_t)v171, 16);
    v151 = 0;
    uint64_t v31 = v132;
    if (v129) {
      continue;
    }
    break;
  }
LABEL_53:

  int Value_value_timeout_callback_context_options = 0;
  uint64_t v31 = v151;
LABEL_54:

  free(v97);
  uint64_t v26 = v163;
LABEL_55:
  v118 = v54;
LABEL_56:
  free(v118);
LABEL_57:
  if (v26 && Value_value_timeout_callback_context_options)
  {
    v154 = (void *)v26[4];
    v26[4] = 0;

    free(v26);
  }
LABEL_60:

  return Value_value_timeout_callback_context_options;
}

- (int)clear
{
  objc_msgSend_removeAllObjects(self->_elements, a2, v2, v3, v4);
  return 0;
}

- (IOHIDTransactionClass)initWithDevice:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IOHIDTransactionClass;
  v5 = [(IOHIDIUnknown2 *)&v15 init];
  int v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_device, v4);
    uint64_t v7 = (char *)malloc_type_malloc(0x70uLL, 0x8004065BD1A13uLL);
    v6->_interface = (IOHIDDeviceTransactionInterface *)v7;
    vtbl = v6->super._vtbl;
    Release = vtbl->Release;
    long long v10 = *(_OWORD *)&vtbl->QueryInterface;
    *(void *)uint64_t v7 = v6;
    *(_OWORD *)(v7 + 8) = v10;
    *((void *)v7 + 3) = Release;
    *((void *)v7 + 4) = sub_240769C44;
    *((void *)v7 + 5) = sub_240769C54;
    *((void *)v7 + 6) = sub_240769C64;
    *((void *)v7 + 7) = sub_240769C74;
    *((void *)v7 + 8) = sub_240769C84;
    *((void *)v7 + 9) = sub_240769C94;
    *((void *)v7 + 10) = sub_240769CA8;
    *((void *)v7 + 11) = sub_240769CC0;
    *((void *)v7 + 12) = sub_240769CD8;
    *((void *)v7 + 13) = sub_240769CF4;
    unsigned int v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    elements = v6->_elements;
    v6->_elements = v11;

    uint64_t v13 = v6;
  }

  return v6;
}

- (void)setDevice:(id)a3
{
}

- (id)device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);

  return WeakRetained;
}

- (void)dealloc
{
  free(self->_interface);
  v3.receiver = self;
  v3.super_class = (Class)IOHIDTransactionClass;
  [(IOHIDIUnknown2 *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_device);

  objc_storeStrong((id *)&self->_elements, 0);
}

@end