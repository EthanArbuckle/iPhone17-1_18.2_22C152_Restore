uint64_t device_tree_global()
{
  return 0;
}

uint64_t device_tree_init(unsigned int *a1, unsigned int *a2, unsigned int **a3)
{
  v9 = 0;
  v10 = 0;
  uint64_t result = device_tree_root(a1, a2, &v9);
  if (result)
  {
    v7 = v9;
    uint64_t v8 = 1;
    device_tree_node_iterate_recursive(v9, v10, device_tree_integrity_parse_callback, (uint64_t)&v7);
    uint64_t result = (_BYTE)v8 != 0;
    if ((_BYTE)v8)
    {
      *a3 = a1;
      a3[1] = a2;
    }
  }
  return result;
}

uint64_t device_tree_root(unsigned int *a1, unsigned int *a2, unsigned int **a3)
{
  uint64_t v12 = v3;
  uint64_t v13 = v4;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t result = device_tree_node_children_iterator_init(a1, a2, (unsigned int **)&v10);
  if (result)
  {
    while (!device_tree_node_children_iterator_end((unint64_t *)&v10))
      device_tree_node_children_iterator_next((unint64_t *)&v10);
    v9 = (unsigned int *)*((void *)&v11 + 1);
    if (*((void *)&v11 + 1) <= (unint64_t)a2)
    {
      *a3 = a1;
      a3[1] = v9;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t device_tree_node_iterate_recursive(unsigned int *a1, unsigned int *a2, uint64_t (*a3)(uint64_t, void *), uint64_t a4)
{
  v5[0] = a1;
  v5[1] = a2;
  return device_tree_node_iterate_recursive_internal(0, v5, a3, a4);
}

uint64_t device_tree_integrity_parse_callback(uint64_t a1, void *a2)
{
  if (!a1) {
    __assert_rtn("device_tree_integrity_parse_callback", "DeviceTreeKit.c", 144, "context != NULL");
  }
  long long v10 = 0uLL;
  if (device_tree_node_path_node(a2, 0, &v10)
    && (void)v10
    && *((void *)&v10 + 1) > 7uLL
    && (v9[0] = v10, v9[1] = xmmword_24CD227B0, *(void *)a1 == (void)v10))
  {
    if ((unint64_t)v10 >= 0xFFFFFFFFFFFFFFF8) {
LABEL_20:
    }
      abort();
    *(void *)a1 = v10 + 8;
    while ((device_tree_node_property_iterator_end((unsigned int **)v9) & 1) == 0)
    {
      v7 = 0;
      uint64_t v8 = 0;
      if (!device_tree_node_property_iterator_name((unsigned int **)v9, &v7, &v8)
        || *(const char **)a1 != v7)
      {
        goto LABEL_16;
      }
      if ((unint64_t)v7 >= 0xFFFFFFFFFFFFFFDCLL) {
        goto LABEL_20;
      }
      *(void *)a1 = v7 + 36;
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      if (!device_tree_node_property_iterator_data((unsigned int **)v9, &v5, &v6) || *(void *)a1 != v5) {
        goto LABEL_16;
      }
      unint64_t v3 = (v6 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      if (__CFADD__(v3, v5)) {
        goto LABEL_20;
      }
      *(void *)a1 = v3 + v5;
      device_tree_node_property_iterator_next((uint64_t)v9);
    }
    return 0;
  }
  else
  {
LABEL_16:
    *(unsigned char *)(a1 + 8) = 0;
    return 1;
  }
}

uint64_t device_tree_node_children_iterator_init(unsigned int *a1, unsigned int *a2, unsigned int **a3)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    if ((unint64_t)a2 < 8) {
      return 0;
    }
    v8[0] = a1;
    v8[1] = a2;
    long long v9 = xmmword_24CD227B0;
    while ((device_tree_node_property_iterator_end(v8) & 1) == 0)
      device_tree_node_property_iterator_next((uint64_t)v8);
    v7 = (unsigned int *)*((void *)&v9 + 1);
    if (*((void *)&v9 + 1) <= (unint64_t)a2)
    {
      *a3 = a1;
      a3[1] = a2;
      uint64_t result = 1;
      a3[2] = 0;
      a3[3] = v7;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

BOOL device_tree_node_children_iterator_end(unint64_t *a1)
{
  return device_tree_node_children_iterator_child(a1) == 0;
}

uint64_t device_tree_node_children_iterator_next(unint64_t *a1)
{
  long long v9 = 0;
  long long v10 = 0;
  if (!device_tree_node_children_iterator_node(a1, (unint64_t *)&v9)) {
    return 1;
  }
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t result = device_tree_node_children_iterator_init(v9, v10, (unsigned int **)&v7);
  if (result)
  {
    while (!device_tree_node_children_iterator_end((unint64_t *)&v7))
      device_tree_node_children_iterator_next(&v7);
    unint64_t v3 = a1[3];
    if (__CFADD__(*((void *)&v8 + 1), v3)
      || (a1[3] = *((void *)&v8 + 1) + v3, unint64_t v4 = a1[2], v5 = __CFADD__(v4, 1), v6 = v4 + 1, v5))
    {
      abort();
    }
    a1[2] = v6;
    return device_tree_node_children_iterator_end(a1);
  }
  return result;
}

double device_tree_node_property_iterator_init(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a1) {
    BOOL v4 = a2 > 7;
  }
  else {
    BOOL v4 = 0;
  }
  int v5 = v4;
  if (v5 == 1)
  {
    *(void *)a3 = a1;
    *(void *)(a3 + 8) = a2;
    double result = 0.0;
    *(_OWORD *)(a3 + 16) = xmmword_24CD227B0;
  }
  return result;
}

const char *device_tree_node_property_iterator_name(unsigned int **a1, const char **a2, const char **a3)
{
  double result = (const char *)device_tree_node_property_iterator_property(a1);
  unint64_t v6 = result;
  if (!result) {
    return (const char *)(v6 != 0);
  }
  if (result < result + 36)
  {
    double result = (const char *)strnlen(result, 0x20uLL);
    if ((unint64_t)result <= 0x20)
    {
      *a2 = v6;
      *a3 = result;
      return (const char *)(v6 != 0);
    }
  }
  __break(0x5519u);
  return result;
}

unint64_t device_tree_node_property_iterator_property(unsigned int **a1)
{
  unint64_t result = 0;
  unint64_t v3 = *a1;
  if (*a1)
  {
    unint64_t v4 = (unint64_t)a1[1];
    if (v4)
    {
      if ((unint64_t)a1[2] >= *v3) {
        return 0;
      }
      unint64_t v5 = (unint64_t)a1[3];
      if (v5 >= 0xFFFFFFFFFFFFFFDCLL) {
LABEL_31:
      }
        abort();
      if (v5 + 36 > v4) {
        return 0;
      }
      unint64_t v6 = (unint64_t)v3 + v5;
      if ((unsigned int *)((char *)v3 + v5))
      {
        long long v7 = (char *)v3 + v4;
        unint64_t v8 = v6 + 36;
        BOOL v9 = v6 < v6 + 36 && v6 >= (unint64_t)v3;
        BOOL v10 = !v9 || v8 > (unint64_t)v7;
        if (v10
          || ((unint64_t v11 = *(_DWORD *)(v6 + 32) & 0x7FFFFFFF, v12 = &v7[-v8], v13 = v8 + v11, v6 < (unint64_t)v7)
            ? (BOOL v14 = (unint64_t)v12 >= v11)
            : (BOOL v14 = 0),
              v14 ? (BOOL v15 = v6 >= v13) : (BOOL v15 = 1),
              v15))
        {
LABEL_30:
          __break(0x5519u);
          goto LABEL_31;
        }
      }
      else
      {
        LODWORD(v11) = MEMORY[0x20] & 0x7FFFFFFF;
      }
      uint64_t v16 = (v11 + 39) & 0xFFFFFFFC;
      BOOL v9 = __CFADD__(v16, v5);
      unint64_t v17 = v16 + v5;
      if (v9) {
        goto LABEL_31;
      }
      unint64_t result = 0;
      if (v6)
      {
        if (v17 <= v4)
        {
          unint64_t result = v6;
          if (v6 >= v6 + v11 + 36) {
            goto LABEL_30;
          }
        }
      }
    }
  }
  return result;
}

const char *device_tree_node_property_iterator_name_matches()
{
  OUTLINED_FUNCTION_0();
  unint64_t result = device_tree_node_property_iterator_name(v1, v2, v3);
  if (result)
  {
    for (unint64_t i = 0; ; ++i)
    {
      int v6 = *(unsigned __int8 *)(v0 + i);
      if (!*(unsigned char *)(v0 + i) || i >= v10) {
        break;
      }
      if (v6 != *(unsigned __int8 *)(v9 + i)) {
        return 0;
      }
    }
    if (i >= v10) {
      return (const char *)(v6 == 0);
    }
    else {
      return (const char *)(*(unsigned char *)(v9 + i) == 0);
    }
  }
  return result;
}

unint64_t device_tree_node_property_iterator_property_matches()
{
  OUTLINED_FUNCTION_0();
  unint64_t result = device_tree_node_property_iterator_data(v1, v2, v3);
  if (result)
  {
    for (unint64_t i = 0; ; ++i)
    {
      int v6 = *(unsigned __int8 *)(v0 + i);
      if (!*(unsigned char *)(v0 + i) || i >= v10) {
        break;
      }
      if (v6 != *(unsigned __int8 *)(v9 + i)) {
        return 0;
      }
    }
    if (i >= v10) {
      return v6 == 0;
    }
    else {
      return *(unsigned char *)(v9 + i) == 0;
    }
  }
  return result;
}

unint64_t device_tree_node_property_iterator_data(unsigned int **a1, void *a2, void *a3)
{
  unint64_t result = device_tree_node_property_iterator_property(a1);
  if (!result) {
    return result != 0;
  }
  if (result < result + 36)
  {
    uint64_t v6 = *(_DWORD *)(result + 32) & 0x7FFFFFFF;
    *a2 = result + 36;
    *a3 = v6;
    return result != 0;
  }
  __break(0x5519u);
  return result;
}

unint64_t device_tree_node_property(unsigned int *a1, unsigned int *a2, uint64_t a3, void *a4, void *a5)
{
  unint64_t result = 0;
  if (a1 && (unint64_t)a2 >= 8)
  {
    uint64_t v13 = v5;
    uint64_t v14 = v6;
    v11[0] = a1;
    v11[1] = a2;
    long long v12 = xmmword_24CD227B0;
    while (1)
    {
      if (device_tree_node_property_iterator_end(v11)) {
        return 0;
      }
      if (device_tree_node_property_iterator_name_matches()) {
        break;
      }
      device_tree_node_property_iterator_next((uint64_t)v11);
    }
    return device_tree_node_property_iterator_data(v11, a4, a5);
  }
  return result;
}

unint64_t device_tree_node_property_iterator_end(unsigned int **a1)
{
  unint64_t result = device_tree_node_property_iterator_property(a1);
  if (result < result + 36) {
    return result == 0;
  }
  __break(0x5519u);
  return result;
}

unint64_t device_tree_node_property_iterator_next(uint64_t a1)
{
  unint64_t result = device_tree_node_property_iterator_property((unsigned int **)a1);
  if (!result) {
    return 1;
  }
  if (result >= result + 36)
  {
    __break(0x5519u);
  }
  else
  {
    uint64_t v3 = ((*(_DWORD *)(result + 32) & 0x7FFFFFFF) + 39) & 0xFFFFFFFC;
    uint64_t v4 = *(void *)(a1 + 24);
    BOOL v5 = __CFADD__(v4, v3);
    uint64_t v6 = v4 + v3;
    if (v5 || (*(void *)(a1 + 24) = v6, v7 = *(void *)(a1 + 16), v5 = __CFADD__(v7, 1), uint64_t v8 = v7 + 1, v5)) {
      abort();
    }
    *(void *)(a1 + 16) = v8;
    return device_tree_node_property_iterator_end((unsigned int **)a1);
  }
  return result;
}

unint64_t device_tree_node_property_matches(unsigned int *a1, unsigned int *a2)
{
  unint64_t result = 0;
  if (a1 && (unint64_t)a2 >= 8)
  {
    uint64_t v8 = v2;
    uint64_t v9 = v3;
    v6[0] = a1;
    v6[1] = a2;
    long long v7 = xmmword_24CD227B0;
    while (1)
    {
      if (device_tree_node_property_iterator_end(v6)) {
        return 0;
      }
      if (device_tree_node_property_iterator_name_matches()) {
        break;
      }
      device_tree_node_property_iterator_next((uint64_t)v6);
    }
    return device_tree_node_property_iterator_property_matches();
  }
  return result;
}

unint64_t device_tree_node_children_iterator_node(unint64_t *a1, unint64_t *a2)
{
  unint64_t result = device_tree_node_children_iterator_child(a1);
  if (result)
  {
    unint64_t v5 = a1[1];
    unint64_t v6 = a1[3];
    long long v7 = (unsigned int *)(v5 - v6);
    if (v5 < v6) {
      __assert_rtn("device_tree_node_children_iterator_node", "DeviceTreeKit.c", 569, "iterator->node.size >= iterator->offset");
    }
    unint64_t v8 = result;
    if (result > (unint64_t)v7 + result)
    {
      __break(0x5519u);
    }
    else
    {
      *a2 = result;
      a2[1] = (unint64_t)v7;
      long long v10 = 0u;
      long long v11 = 0u;
      unint64_t result = device_tree_node_children_iterator_init((unsigned int *)result, v7, (unsigned int **)&v10);
      if (result)
      {
        while (!device_tree_node_children_iterator_end((unint64_t *)&v10))
          device_tree_node_children_iterator_next(&v10);
        unint64_t v9 = *((void *)&v11 + 1);
        if (*((void *)&v11 + 1) <= a1[1] - a1[3])
        {
          *a2 = v8;
          a2[1] = v9;
          return 1;
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

unint64_t device_tree_node_children_iterator_child(unint64_t *a1)
{
  unint64_t result = 0;
  unint64_t v3 = *a1;
  if (!*a1) {
    return result;
  }
  unint64_t v4 = a1[1];
  if (!v4) {
    return result;
  }
  if (a1[2] >= *(unsigned int *)(v3 + 4)) {
    return 0;
  }
  unint64_t v5 = a1[3];
  if (v5 >= 0xFFFFFFFFFFFFFFF8) {
LABEL_15:
  }
    abort();
  if (v5 + 8 > v4) {
    return 0;
  }
  unint64_t result = v3 + v5;
  if (v3 + v5)
  {
    if (result < v3 || result >= v3 + v4)
    {
      __break(0x5519u);
      goto LABEL_15;
    }
  }
  return result;
}

uint64_t device_tree_node_iterate_recursive_internal(uint64_t a1, unsigned int **a2, uint64_t (*a3)(uint64_t, void *), uint64_t a4)
{
  v11[0] = a1;
  v11[1] = a2;
  if (a3(a4, v11)) {
    return 1;
  }
  memset(v10, 0, sizeof(v10));
  uint64_t result = device_tree_node_children_iterator_init(*a2, a2[1], (unsigned int **)v10);
  if (result)
  {
    while (1)
    {
      BOOL v8 = device_tree_node_children_iterator_end((unint64_t *)v10);
      if (v8) {
        break;
      }
      v9[0] = 0;
      v9[1] = 0;
      uint64_t result = device_tree_node_children_iterator_node((unint64_t *)v10, v9);
      if (!result) {
        return result;
      }
      if (device_tree_node_iterate_recursive_internal(v11, v9, a3, a4)) {
        break;
      }
      device_tree_node_children_iterator_next((unint64_t *)v10);
    }
    return !v8;
  }
  return result;
}

BOOL device_tree_node_path_node(void *a1, uint64_t a2, _OWORD *a3)
{
  uint64_t v3 = 0;
  if (a1)
  {
    while (a2 != v3)
    {
      if (v3 == -1) {
        abort();
      }
      a1 = (void *)*a1;
      ++v3;
      if (!a1) {
        return a1 != 0;
      }
    }
    *a3 = *(_OWORD *)a1[1];
  }
  return a1 != 0;
}

uint64_t device_tree_node_path_size(void *a1)
{
  for (uint64_t i = 0; a1; ++i)
  {
    if (i == -1) {
      abort();
    }
    a1 = (void *)*a1;
  }
  return i;
}

uint64_t device_tree_node_path_iterate_internal(void *a1, uint64_t (*a2)(uint64_t, void, void), uint64_t a3)
{
  long long v8 = 0uLL;
  uint64_t result = device_tree_node_path_node(a1, 0, &v8);
  if (result)
  {
    if (*a1 && (device_tree_node_path_iterate_internal(*a1, a2, a3) & 1) != 0)
    {
      return 1;
    }
    else
    {
      long long v6 = v8;
      return a2(a3, v6, *((void *)&v6 + 1));
    }
  }
  return result;
}

uint64_t __swift_device_tree_global(_:)()
{
  return device_tree_global();
}

uint64_t __swift_device_tree_init(_:_:_:)(unsigned int *a1, unsigned int *a2, unsigned int **a3)
{
  return device_tree_init(a1, a2, a3);
}

uint64_t __swift_device_tree_root(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_device_tree_root(_:_:)(a1, a2, a3, (uint64_t (*)(void))device_tree_root);
}

uint64_t __swift_device_tree_node_iterate_recursive(_:_:_:)(unsigned int *a1, unsigned int *a2, uint64_t (*a3)(uint64_t, void *), uint64_t a4)
{
  return device_tree_node_iterate_recursive(a1, a2, a3, a4);
}

BOOL __swift_device_tree_node_path_node(_:_:_:)(void *a1, uint64_t a2, _OWORD *a3)
{
  return device_tree_node_path_node(a1, a2, a3);
}

unint64_t __swift_device_tree_node_property(_:_:_:_:)(unsigned int *a1, unsigned int *a2, uint64_t a3, void *a4, void *a5)
{
  return device_tree_node_property(a1, a2, a3, a4, a5);
}

uint64_t __swift_device_tree_node_property_iterator_init(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_device_tree_root(_:_:)(a1, a2, a3, (uint64_t (*)(void))device_tree_node_property_iterator_init);
}

unint64_t __swift_device_tree_node_property_iterator_next(_:)(uint64_t a1)
{
  return device_tree_node_property_iterator_next(a1);
}

unint64_t __swift_device_tree_node_property_iterator_end(_:)(unsigned int **a1)
{
  return device_tree_node_property_iterator_end(a1);
}

const char *__swift_device_tree_node_property_iterator_name(_:_:_:)(unsigned int **a1, const char **a2, const char **a3)
{
  return device_tree_node_property_iterator_name(a1, a2, a3);
}

unint64_t __swift_device_tree_node_property_iterator_data(_:_:_:)(unsigned int **a1, void *a2, void *a3)
{
  return device_tree_node_property_iterator_data(a1, a2, a3);
}

uint64_t __swift_device_tree_node_children_iterator_init(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_device_tree_root(_:_:)(a1, a2, a3, (uint64_t (*)(void))device_tree_node_children_iterator_init);
}

uint64_t __swift_device_tree_root(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

BOOL __swift_device_tree_node_children_iterator_end(_:)(unint64_t *a1)
{
  return device_tree_node_children_iterator_end(a1);
}

uint64_t __swift_device_tree_node_children_iterator_next(_:)(unint64_t *a1)
{
  return device_tree_node_children_iterator_next(a1);
}

unint64_t __swift_device_tree_node_children_iterator_node(_:_:)(unint64_t *a1, unint64_t *a2)
{
  return device_tree_node_children_iterator_node(a1, a2);
}

uint64_t DeviceTree.wrapped.getter()
{
  return *(void *)v0;
}

uint64_t static DeviceTree.global.getter@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = __swift_device_tree_global(_:)();
  *a1 = 0uLL;
  return OUTLINED_FUNCTION_8(v2);
}

uint64_t DeviceTree.init()@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = __swift_device_tree_global(_:)();
  *a1 = 0uLL;
  return OUTLINED_FUNCTION_8(v2);
}

void DeviceTree.init(data:)(unsigned int *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (a1
    && (long long v4 = 0uLL,
        (__swift_device_tree_init(_:_:_:)(a1, (unsigned int *)(a2 - (void)a1), (unsigned int **)&v4) & 1) != 0))
  {
    *(_OWORD *)a3 = v4;
    *(unsigned char *)(a3 + 16) = 0;
  }
  else
  {
    OUTLINED_FUNCTION_18();
  }
}

uint64_t DeviceTree.root()@<X0>(void *a1@<X8>)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v5 = __swift_device_tree_root(_:_:)(v3, v4, (uint64_t)&v9);
  uint64_t v6 = v9;
  uint64_t v7 = v10;
  if ((v5 & 1) == 0)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  *a1 = v6;
  a1[1] = v7;
  return OUTLINED_FUNCTION_8(v5);
}

uint64_t DeviceTreeNode.init(nodeData:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t iterateChildrenRecursivelyCallback(_:_:)(void (**a1)(unsigned __int8 *__return_ptr, uint64_t *), uint64_t a2)
{
  void (*v2)(unsigned __int8 *__return_ptr, uint64_t *);
  unsigned __int8 v4;
  uint64_t v5;

  if (!a1) {
    return 1;
  }
  uint64_t v2 = *a1;
  uint64_t v5 = a2;
  swift_retain();
  v2(&v4, &v5);
  swift_release();
  return v4;
}

uint64_t DeviceTreeNodePath.init(wrapped:)@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void DeviceTreeNode.properties()(__n128 *a1@<X8>)
{
  OUTLINED_FUNCTION_26(a1, *v1);
}

void DeviceTreeNodeChildren.init(node:)(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
}

uint64_t DeviceTreeNode.iterateChildrenRecursively(callback:)(uint64_t a1, uint64_t a2)
{
  void v11[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = *(unsigned int **)v2;
  uint64_t v5 = *(unsigned int **)(v2 + 8);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a1;
  *(void *)(v7 + 24) = a2;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = partial apply for thunk for @callee_guaranteed (@in_guaranteed DeviceTreeNodePath) -> (@unowned Bool);
  *(void *)(v8 + 24) = v7;
  v11[0] = partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed DeviceTreeNodePath) -> (@unowned Bool);
  v11[1] = v8;
  swift_retain();
  char v9 = __swift_device_tree_node_iterate_recursive(_:_:_:)(v6, v5, (uint64_t (*)(uint64_t, void *))@objc iterateChildrenRecursivelyCallback(_:_:), (uint64_t)v11);
  swift_release();
  LOBYTE(v5) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v5) {
    __break(1u);
  }
  return v9 & 1;
}

uint64_t sub_24CD1C0FC()
{
  return OUTLINED_FUNCTION_12(v0, 32);
}

uint64_t partial apply for thunk for @callee_guaranteed (@in_guaranteed DeviceTreeNodePath) -> (@unowned Bool)()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_24CD1C134()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed DeviceTreeNodePath) -> (@unowned Bool)@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result & 1;
  return result;
}

uint64_t @objc iterateChildrenRecursivelyCallback(_:_:)(void (**a1)(unsigned __int8 *__return_ptr, uint64_t *), uint64_t a2)
{
  return iterateChildrenRecursivelyCallback(_:_:)(a1, a2) & 1;
}

uint64_t DeviceTreeNode.name.getter()
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  if ((__swift_device_tree_node_property(_:_:_:_:)(v1, v2, (uint64_t)"name", &v9, &v8) & 1) == 0) {
    return 0;
  }
  uint64_t v3 = MEMORY[0x253312A30](v9, v8);
  if (!v3)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = closure #1 in closure #1 in DeviceTreeNode.name.getter;
    uint64_t v12 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>>);
    lazy protocol witness table accessor for type LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>> and conformance <> LazyPrefixWhileSequence<A>();
    lazy protocol witness table accessor for type Unicode.ASCII and conformance Unicode.ASCII();
    uint64_t result = OUTLINED_FUNCTION_0_0((uint64_t)&v9, MEMORY[0x263F8EB70]);
    if (v7) {
      return result;
    }
    __break(1u);
LABEL_10:
    OUTLINED_FUNCTION_1();
    uint64_t result = OUTLINED_FUNCTION_17();
    __break(1u);
    return result;
  }
  if (v4 - v3 < 0) {
    goto LABEL_10;
  }
  uint64_t v9 = v3;
  uint64_t v10 = v4 - v3;
  uint64_t v11 = closure #1 in closure #1 in DeviceTreeNode.name.getter;
  uint64_t v12 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>>);
  lazy protocol witness table accessor for type LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>> and conformance <> LazyPrefixWhileSequence<A>();
  lazy protocol witness table accessor for type Unicode.ASCII and conformance Unicode.ASCII();
  uint64_t result = OUTLINED_FUNCTION_0_0((uint64_t)&v9, MEMORY[0x263F8EB70]);
  if (!v6)
  {
    __break(1u);
    return 0;
  }
  return result;
}

uint64_t DeviceTreeNodeProperties.subscript.getter(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v7 = 0;
  v8[0] = 0;
  char v5 = __swift_device_tree_node_property(_:_:_:_:)(v3, v4, a1, v8, &v7);
  uint64_t result = 0;
  if (v5) {
    return MEMORY[0x253312A30](v8[0], v7);
  }
  return result;
}

uint64_t DeviceTreeNode.id.getter()
{
  return *(void *)v0;
}

uint64_t protocol witness for Identifiable.id.getter in conformance DeviceTreeNode@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = DeviceTreeNode.id.getter();
  *a1 = result;
  return result;
}

BOOL static DeviceTreeNode.== infix(_:_:)(void *a1, void *a2)
{
  if (*a2) {
    BOOL v2 = *a1 == *a2;
  }
  else {
    BOOL v2 = (*a1 | *a2) == 0;
  }
  if (*a1) {
    return v2;
  }
  else {
    return (*a1 | *a2) == 0;
  }
}

void DeviceTreeNode.hash(into:)()
{
  Swift::UInt v1 = *v0;
  if (*v0)
  {
    Hasher._combine(_:)(1u);
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
  }
}

Swift::Int DeviceTreeNode.hashValue.getter()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  if (v1)
  {
    Hasher._combine(_:)(1u);
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance DeviceTreeNode()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  if (v1)
  {
    Hasher._combine(_:)(1u);
    Hasher._combine(_:)(v1);
  }
  else
  {
    Hasher._combine(_:)(0);
  }
  return Hasher._finalize()();
}

uint64_t DeviceTreeNode.description.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  _StringGuts.grow(_:)(18);
  uint64_t v3 = DeviceTreeNode.name.getter();
  if (v4)
  {
    unint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0x656D616E206F6E28;
    unint64_t v5 = 0xE900000000000029;
  }
  unint64_t v6 = v5;
  String.append(_:)(*(Swift::String *)&v3);
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 2108704;
  v7._object = (void *)0xE300000000000000;
  String.append(_:)(v7);
  specialized _copySequenceToContiguousArray<A>(_:)(v1, v2);
  swift_release();
  lazy protocol witness table accessor for type Int and conformance Int();
  v8._countAndFlagsBits = BinaryInteger.description.getter();
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 0x747265706F727020;
  v9._object = (void *)0xEB00000000736569;
  String.append(_:)(v9);
  return 0;
}

uint64_t DeviceTreeNode.debugDescription.getter()
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  v97.i64[0] = 0;
  v97.i64[1] = 0xE000000000000000;
  v94.i64[0] = v1;
  v94.i64[1] = v2;
  uint64_t v3 = DeviceTreeNode.name.getter();
  if (v4)
  {
    unint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0x656D616E206F6E28;
    unint64_t v5 = 0xE900000000000029;
  }
  unint64_t v6 = v5;
  String.append(_:)(*(Swift::String *)&v3);
  swift_bridgeObjectRelease();
  int8x16_t v91 = v97;
  uint64_t v7 = OUTLINED_FUNCTION_21();
  char v10 = __swift_device_tree_node_property_iterator_init(_:_:)(v7, v8, v9);
  *(double *)v11.i64 = OUTLINED_FUNCTION_16(v10, v97);
  int8x16_t v97 = v11;
  long long v98 = v12;
  BOOL v99 = (v13 & 1) == 0;
  DeviceTreeNodePropertyIterator.next()((uint64_t)&v94);
  if (v96)
  {
    uint64_t v14 = (char *)MEMORY[0x263F8EE78];
  }
  else
  {
    int8x16_t v19 = v94;
    long long v20 = v95;
    uint64_t v14 = (char *)MEMORY[0x263F8EE78];
    do
    {
      uint64_t v92 = 0x2020207C20;
      unint64_t v93 = 0xE500000000000000;
      int8x16_t v94 = v19;
      long long v95 = v20;
      v21._countAndFlagsBits = String.init<A>(reflecting:)();
      String.append(_:)(v21);
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        v25 = (char *)OUTLINED_FUNCTION_14();
        uint64_t v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v25, v26, v27, v14);
      }
      unint64_t v23 = *((void *)v14 + 2);
      unint64_t v22 = *((void *)v14 + 3);
      if (v23 >= v22 >> 1)
      {
        BOOL v28 = OUTLINED_FUNCTION_5(v22);
        uint64_t v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)v28, v29, v30, v14);
      }
      *((void *)v14 + 2) = v23 + 1;
      v24 = &v14[16 * v23];
      *((void *)v24 + 4) = 0x2020207C20;
      *((void *)v24 + 5) = 0xE500000000000000;
      DeviceTreeNodePropertyIterator.next()((uint64_t)&v94);
      int8x16_t v19 = v94;
      long long v20 = v95;
    }
    while (v96 != 1);
  }
  uint64_t v15 = OUTLINED_FUNCTION_21();
  if ((__swift_device_tree_node_children_iterator_init(_:_:)(v15, v16, v17) & 1) != 0
    && !__swift_device_tree_node_children_iterator_end(_:)((unint64_t *)&v97))
  {
    v18 = (char *)MEMORY[0x263F8EE78];
    do
    {
      uint64_t v90 = (uint64_t)v18;
      while (1)
      {
        int8x16_t v94 = 0uLL;
        if ((__swift_device_tree_node_children_iterator_node(_:_:)((unint64_t *)&v97, (unint64_t *)&v94) & 1) == 0)
        {
LABEL_36:
          v18 = (char *)v90;
          goto LABEL_37;
        }
        int8x16_t v31 = v94;
        __swift_device_tree_node_children_iterator_next(_:)((unint64_t *)&v97);
        int8x16_t v32 = v97;
        long long v33 = v98;
        int8x16_t v97 = v31;
        uint64_t v34 = String.init<A>(reflecting:)();
        unint64_t v36 = v35;
        v97.i64[0] = 10;
        v97.i64[1] = 0xE100000000000000;
        MEMORY[0x270FA5388]();
        v87[2] = &v97;
        swift_bridgeObjectRetain();
        v37 = (void *)specialized Collection.split(maxSplits:omittingEmptySubsequences:whereSeparator:)(0x7FFFFFFFFFFFFFFFLL, 1u, partial apply for specialized closure #1 in Collection<>.split(separator:maxSplits:omittingEmptySubsequences:), (uint64_t)v87, v34, v36);
        swift_bridgeObjectRelease();
        if (v37[2]) {
          break;
        }
        swift_bridgeObjectRelease();
        int8x16_t v97 = v32;
        long long v98 = v33;
        if (__swift_device_tree_node_children_iterator_end(_:)((unint64_t *)&v97)) {
          goto LABEL_36;
        }
      }
      uint64_t v88 = v32.i64[1];
      long long v89 = v33;
      uint64_t v38 = v37[4];
      uint64_t v39 = v37[5];
      uint64_t v40 = v37[6];
      uint64_t v41 = v37[7];
      v97.i64[0] = 0x206F2D2B20;
      v97.i64[1] = 0xE500000000000000;
      swift_bridgeObjectRetain();
      v42._countAndFlagsBits = MEMORY[0x2533129A0](v38, v39, v40, v41);
      String.append(_:)(v42);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      int8x16_t v43 = v97;
      if (swift_isUniquelyReferenced_nonNull_native())
      {
        v44 = (char *)v90;
      }
      else
      {
        v66 = (char *)OUTLINED_FUNCTION_14();
        v44 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v66, v67, v68, v69);
      }
      unint64_t v46 = *((void *)v44 + 2);
      unint64_t v45 = *((void *)v44 + 3);
      if (v46 >= v45 >> 1)
      {
        BOOL v70 = OUTLINED_FUNCTION_5(v45);
        v44 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)v70, v71, v72, v73);
      }
      *((void *)v44 + 2) = v46 + 1;
      v18 = v44;
      *(int8x16_t *)&v44[16 * v46 + 32] = v43;
      uint64_t v90 = specialized MutableCollection.subscript.getter(1, (uint64_t)v37);
      uint64_t v48 = v47;
      uint64_t v50 = v49;
      unint64_t v52 = v51;
      swift_bridgeObjectRelease();
      unint64_t v53 = (v52 >> 1) - v50;
      if (v52 >> 1 != v50)
      {
        if ((uint64_t)(v52 >> 1) <= v50) {
          __break(1u);
        }
        v54 = (uint64_t *)(v48 + 32 * v50 + 16);
        do
        {
          uint64_t v55 = *(v54 - 2);
          uint64_t v56 = *(v54 - 1);
          uint64_t v57 = *v54;
          uint64_t v58 = v54[1];
          v97.i64[0] = 31776;
          v97.i64[1] = 0xE200000000000000;
          swift_bridgeObjectRetain();
          v59._countAndFlagsBits = MEMORY[0x2533129A0](v55, v56, v57, v58);
          String.append(_:)(v59);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          int8x16_t v60 = v97;
          unint64_t v62 = *((void *)v18 + 2);
          unint64_t v61 = *((void *)v18 + 3);
          if (v62 >= v61 >> 1)
          {
            BOOL v63 = OUTLINED_FUNCTION_5(v61);
            v18 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)v63, v64, v65, v18);
          }
          *((void *)v18 + 2) = v62 + 1;
          *(int8x16_t *)&v18[16 * v62 + 32] = v60;
          v54 += 4;
          --v53;
        }
        while (v53);
      }
      swift_release();
      v97.i64[0] = v32.i64[0];
      v97.i64[1] = v88;
      long long v98 = v89;
    }
    while (!__swift_device_tree_node_children_iterator_end(_:)((unint64_t *)&v97));
  }
  else
  {
    v18 = (char *)MEMORY[0x263F8EE78];
  }
LABEL_37:
  int8x16_t v97 = v91;
  swift_bridgeObjectRetain();
  v74._countAndFlagsBits = 10;
  v74._object = (void *)0xE100000000000000;
  String.append(_:)(v74);
  swift_bridgeObjectRelease();
  int8x16_t v75 = v97;
  v97.i64[0] = (uint64_t)v14;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
  lazy protocol witness table accessor for type UnsafeBufferPointer<UInt8> and conformance UnsafeBufferPointer<A>((uint64_t)&lazy protocol witness table cache variable for type [String] and conformance [A]);
  uint64_t v76 = OUTLINED_FUNCTION_30();
  v78 = v77;
  swift_bridgeObjectRelease();
  int8x16_t v97 = v75;
  swift_bridgeObjectRetain();
  v79._countAndFlagsBits = v76;
  v79._object = v78;
  String.append(_:)(v79);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v80._countAndFlagsBits = 10;
  v80._object = (void *)0xE100000000000000;
  String.append(_:)(v80);
  swift_bridgeObjectRelease();
  int8x16_t v81 = v97;
  v97.i64[0] = (uint64_t)v18;
  uint64_t v82 = OUTLINED_FUNCTION_30();
  v84 = v83;
  swift_bridgeObjectRelease();
  int8x16_t v97 = v81;
  swift_bridgeObjectRetain();
  v85._countAndFlagsBits = v82;
  v85._object = v84;
  String.append(_:)(v85);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v97.i64[0];
}

double DeviceTreeNodeProperties.makeIterator()()
{
  return DeviceTreeNodeProperties.makeIterator()((double (*)(uint64_t, uint64_t, _OWORD *))__swift_device_tree_node_property_iterator_init(_:_:));
}

void DeviceTreeNodePropertyIterator.next()(uint64_t a1@<X8>)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (v1[2])
  {
    OUTLINED_FUNCTION_34();
    return;
  }
  long long v3 = v1[1];
  long long v15 = *v1;
  long long v16 = v3;
  if (__swift_device_tree_node_property_iterator_end(_:)((unsigned int **)&v15)) {
    goto LABEL_11;
  }
  uint64_t v12 = 0;
  uint64_t v14 = 0;
  if ((__swift_device_tree_node_property_iterator_name(_:_:_:)((unsigned int **)&v15, &v14, (const char **)&v12) & 1) == 0)goto LABEL_11; {
  uint64_t v4 = v12;
  }
  if (v12 > 31) {
    __break(1u);
  }
  uint64_t v11 = 0;
  uint64_t v13 = 0;
  if ((__swift_device_tree_node_property_iterator_data(_:_:_:)((unsigned int **)&v15, &v13, &v11) & 1) != 0
    && (unint64_t v5 = v14) != 0
    && v13)
  {
    if (v4 <= -2)
    {
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_17();
      __break(1u);
      return;
    }
    uint64_t v6 = v4 + 1;
    uint64_t v7 = MEMORY[0x253312A30]();
    uint64_t v9 = v8;
    __swift_device_tree_node_property_iterator_next(_:)((uint64_t)&v15);
    *(void *)a1 = v5;
    *(void *)(a1 + 8) = v6;
    *(void *)(a1 + 16) = v7;
    *(void *)(a1 + 24) = v9;
    *(unsigned char *)(a1 + 32) = 0;
  }
  else
  {
LABEL_11:
    OUTLINED_FUNCTION_34();
  }
  long long v10 = v16;
  long long *v1 = v15;
  v1[1] = v10;
  *((unsigned char *)v1 + 32) = 0;
}

double DeviceTreeNodeChildren.makeIterator()()
{
  return DeviceTreeNodeProperties.makeIterator()((double (*)(uint64_t, uint64_t, _OWORD *))__swift_device_tree_node_children_iterator_init(_:_:));
}

double DeviceTreeNodeProperties.makeIterator()(double (*a1)(uint64_t, uint64_t, _OWORD *))
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  memset(v16, 0, sizeof(v16));
  *(double *)v5.i64 = a1(v3, v4, v16);
  *(void *)&double result = OUTLINED_FUNCTION_3(v6, v7, v8, v9, v10, v11, v12, v13, v5, v14).u64[0];
  return result;
}

double DeviceTreeNodeChildrenIterator.next()@<D0>(uint64_t a1@<X8>)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (v1[2])
  {
    OUTLINED_FUNCTION_18();
  }
  else
  {
    long long v4 = v1[1];
    long long v10 = *v1;
    long long v11 = v4;
    if (__swift_device_tree_node_children_iterator_end(_:)((unint64_t *)&v10)
      || (unint64_t v8 = 0,
          uint64_t v9 = 0,
          (__swift_device_tree_node_children_iterator_node(_:_:)((unint64_t *)&v10, &v8) & 1) == 0))
    {
      OUTLINED_FUNCTION_18();
    }
    else
    {
      unint64_t v5 = v8;
      uint64_t v6 = v9;
      __swift_device_tree_node_children_iterator_next(_:)((unint64_t *)&v10);
      *(void *)a1 = v5;
      *(void *)(a1 + 8) = v6;
      *(unsigned char *)(a1 + 16) = 0;
    }
    double result = *(double *)&v10;
    long long v7 = v11;
    long long *v1 = v10;
    v1[1] = v7;
    *((unsigned char *)v1 + 32) = 0;
  }
  return result;
}

uint64_t specialized MutableCollection.subscript.getter(uint64_t result, uint64_t a2)
{
  if (*(void *)(a2 + 16) < result)
  {
    __break(1u);
  }
  else if ((result & 0x8000000000000000) == 0)
  {
    return swift_bridgeObjectRetain();
  }
  __break(1u);
  return result;
}

uint64_t DeviceTreeNodePath.wrapped.getter()
{
  return *(void *)v0;
}

uint64_t DeviceTreeNodePath.subscript.getter@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  unint64_t v5 = *v2;
  long long v8 = 0uLL;
  uint64_t result = __swift_device_tree_node_path_node(_:_:_:)(v5, a1, &v8);
  if (result)
  {
    *a2 = v8;
  }
  else
  {
    OUTLINED_FUNCTION_25();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_20();
    lazy protocol witness table accessor for type Int and conformance Int();
    v7._countAndFlagsBits = BinaryInteger.description.getter();
    String.append(_:)(v7);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_29();
    uint64_t result = OUTLINED_FUNCTION_32();
    __break(1u);
  }
  return result;
}

Swift::Int __swiftcall DeviceTreeNodePath.count()()
{
  return __swift_device_tree_node_path_size(_:)((Swift::OpaquePointer)v0->_rawValue);
}

Swift::Int DeviceTreeNodePath.makeIterator()@<X0>(void **a1@<X8>)
{
  v3._rawValue = *v1;
  Swift::Int result = __swift_device_tree_node_path_size(_:)(v3);
  *a1 = v3._rawValue;
  a1[1] = 0;
  a1[2] = (void *)result;
  return result;
}

Swift::Int DeviceTreeNodePathIterator.init(path:)@<X0>(Swift::OpaquePointer *a1@<X0>, void **a2@<X8>)
{
  v3._rawValue = a1->_rawValue;
  Swift::Int result = __swift_device_tree_node_path_size(_:)((Swift::OpaquePointer)a1->_rawValue);
  *a2 = v3._rawValue;
  a2[1] = 0;
  a2[2] = (void *)result;
  return result;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance DeviceTreeNodePath()
{
  return specialized Sequence.underestimatedCount.getter();
}

uint64_t specialized Sequence.underestimatedCount.getter()
{
  return 0;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance DeviceTreeNodePath()
{
  return specialized Sequence._copyToContiguousArray()(*v0);
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance DeviceTreeNodePath(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return specialized Sequence._copyContents(initializing:)(a1, a2, a3, *v3);
}

uint64_t protocol witness for Sequence.withContiguousStorageIfAvailable<A>(_:) in conformance DeviceTreeNodePath(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_13(a1, a2, a3, a4);
}

uint64_t DeviceTreeNodePath.description.getter()
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v1 = *v0;
  uint64_t v39 = 47;
  unint64_t v40 = 0xE100000000000000;
  uint64_t v38 = MEMORY[0x263F8EE78];
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, 0, 0);
  uint64_t v2 = v38;
  Swift::Int v3 = __swift_device_tree_node_path_size(_:)((Swift::OpaquePointer)v1);
  if (v3 < 1)
  {
LABEL_20:
    *(void *)&long long v41 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ReversedCollection<[String]>);
    lazy protocol witness table accessor for type UnsafeBufferPointer<UInt8> and conformance UnsafeBufferPointer<A>((uint64_t)&lazy protocol witness table cache variable for type ReversedCollection<[String]> and conformance ReversedCollection<A>);
    uint64_t v30 = BidirectionalCollection<>.joined(separator:)();
    int8x16_t v32 = v31;
    swift_release();
    v33._countAndFlagsBits = v30;
    v33._object = v32;
    String.append(_:)(v33);
    swift_bridgeObjectRelease();
    return v39;
  }
  Swift::Int v4 = v3;
  uint64_t v5 = 0;
  while (1)
  {
    long long v41 = 0uLL;
    if (!__swift_device_tree_node_path_node(_:_:_:)(v1, v5, &v41)) {
      break;
    }
    uint64_t v6 = (unsigned int *)v41;
    *(void *)&long long v41 = 0;
    uint64_t v37 = 0;
    if (__swift_device_tree_node_property(_:_:_:_:)(v6, *((unsigned int **)&v41 + 1), (uint64_t)"name", &v41, &v37))
    {
      if (v37 < 0) {
        goto LABEL_24;
      }
      if (v37)
      {
        if (!(void)v41) {
          goto LABEL_24;
        }
        goto LABEL_11;
      }
      if ((void)v41)
      {
LABEL_11:
        if (v37 < 0) {
          goto LABEL_24;
        }
        *((void *)&v41 + 1) = v37;
        Swift::String v42 = closure #1 in closure #1 in DeviceTreeNode.name.getter;
        uint64_t v43 = 0;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>>);
        lazy protocol witness table accessor for type LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>> and conformance <> LazyPrefixWhileSequence<A>();
        unint64_t v9 = lazy protocol witness table accessor for type Unicode.ASCII and conformance Unicode.ASCII();
        uint64_t v17 = OUTLINED_FUNCTION_9(v9, v10, v11, v12, v13, v14, v15, v16, v36);
        if (!v18)
        {
          __break(1u);
LABEL_22:
          __break(1u);
        }
      }
      else
      {
        long long v41 = 0uLL;
        Swift::String v42 = closure #1 in closure #1 in DeviceTreeNode.name.getter;
        uint64_t v43 = 0;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>>);
        lazy protocol witness table accessor for type LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>> and conformance <> LazyPrefixWhileSequence<A>();
        unint64_t v22 = lazy protocol witness table accessor for type Unicode.ASCII and conformance Unicode.ASCII();
        uint64_t v17 = OUTLINED_FUNCTION_9(v22, v23, v24, v25, v26, v27, v28, v29, v36);
        if (!v18) {
          goto LABEL_22;
        }
      }
      uint64_t v8 = v17;
      unint64_t v7 = v18;
      goto LABEL_14;
    }
    unint64_t v7 = 0xE900000000000029;
    uint64_t v8 = 0x656D616E206F6E28;
LABEL_14:
    uint64_t v38 = v2;
    unint64_t v20 = *(void *)(v2 + 16);
    unint64_t v19 = *(void *)(v2 + 24);
    if (v20 >= v19 >> 1)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v19 > 1), v20 + 1, 1);
      uint64_t v2 = v38;
    }
    ++v5;
    *(void *)(v2 + 16) = v20 + 1;
    uint64_t v21 = v2 + 16 * v20;
    *(void *)(v21 + 32) = v8;
    *(void *)(v21 + 40) = v7;
    if (v4 == v5) {
      goto LABEL_20;
    }
  }
  OUTLINED_FUNCTION_25();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_20();
  lazy protocol witness table accessor for type Int and conformance Int();
  v35._countAndFlagsBits = BinaryInteger.description.getter();
  String.append(_:)(v35);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_32();
  __break(1u);
LABEL_24:
  OUTLINED_FUNCTION_1();
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t DeviceTreeNodePath.debugDescription.getter()
{
  return DeviceTreeNodePath.description.getter();
}

void DeviceTreeNodePathIterator.path.getter(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t DeviceTreeNodePathIterator.index.getter()
{
  return *(void *)(v0 + 8);
}

uint64_t DeviceTreeNodePathIterator.index.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*DeviceTreeNodePathIterator.index.modify())()
{
  return DeviceTreeNodePathIterator.index.modify;
}

uint64_t DeviceTreeNodePathIterator.count.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t DeviceTreeNodePathIterator.next()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v4 = *(void *)(v1 + 16);
  long long v5 = 0uLL;
  if (v3 < v4)
  {
    uint64_t result = DeviceTreeNodePath.subscript.getter(v3, &v7);
    long long v5 = v7;
    *(void *)(v1 + 8) = v3 + 1;
  }
  *(_OWORD *)a1 = v5;
  *(unsigned char *)(a1 + 16) = v3 >= v4;
  return result;
}

double DeviceTreeNodePropertyIterator.init(properties:)(uint64_t *a1)
{
  return DeviceTreeNodePropertyIterator.init(properties:)(a1, (double (*)(uint64_t, uint64_t, _OWORD *))__swift_device_tree_node_property_iterator_init(_:_:));
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>> and conformance <> LazyPrefixWhileSequence<A>()
{
  unint64_t result = lazy protocol witness table cache variable for type LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>> and conformance <> LazyPrefixWhileSequence<A>;
  if (!lazy protocol witness table cache variable for type LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>> and conformance <> LazyPrefixWhileSequence<A>)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>>);
    lazy protocol witness table accessor for type UnsafeBufferPointer<UInt8> and conformance UnsafeBufferPointer<A>((uint64_t)&lazy protocol witness table cache variable for type UnsafeBufferPointer<UInt8> and conformance UnsafeBufferPointer<A>);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>> and conformance <> LazyPrefixWhileSequence<A>);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Unicode.ASCII and conformance Unicode.ASCII()
{
  unint64_t result = lazy protocol witness table cache variable for type Unicode.ASCII and conformance Unicode.ASCII;
  if (!lazy protocol witness table cache variable for type Unicode.ASCII and conformance Unicode.ASCII)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Unicode.ASCII and conformance Unicode.ASCII);
  }
  return result;
}

double protocol witness for Sequence.makeIterator() in conformance DeviceTreeNodeProperties()
{
  v0.n128_f64[0] = DeviceTreeNodeProperties.makeIterator()();
  *(void *)&double result = OUTLINED_FUNCTION_15(v1, v2, v3, v4, v5, v6, v7, v8, v10, v0, v11, v12).n128_u64[0];
  return result;
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance DeviceTreeNodeProperties()
{
  return specialized Sequence._copyToContiguousArray()(*v0, v0[1]);
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance DeviceTreeNodeProperties(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return specialized Sequence._copyContents(initializing:)(a1, a2, a3, *v3, v3[1]);
}

uint64_t DeviceTreeNodeProperty.name.getter()
{
  return *(void *)v0;
}

uint64_t DeviceTreeNodeProperty.data.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t DeviceTreeNodeProperty.init(name:data:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

Swift::String __swiftcall DeviceTreeNodeProperty.nameString()()
{
  if (*v0)
  {
    uint64_t v1 = v0[1];
    uint64_t v5 = *v0;
    uint64_t v6 = v1;
    uint64_t v7 = closure #1 in closure #1 in DeviceTreeNodeProperty.nameString();
    uint64_t v8 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>>);
    lazy protocol witness table accessor for type LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>> and conformance <> LazyPrefixWhileSequence<A>();
    lazy protocol witness table accessor for type Unicode.ASCII and conformance Unicode.ASCII();
    uint64_t v2 = OUTLINED_FUNCTION_0_0((uint64_t)&v5, MEMORY[0x263F8EB70]);
    if (v3) {
      goto LABEL_7;
    }
    __break(1u);
  }
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = closure #1 in closure #1 in DeviceTreeNodeProperty.nameString();
  uint64_t v8 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>>);
  lazy protocol witness table accessor for type LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>> and conformance <> LazyPrefixWhileSequence<A>();
  lazy protocol witness table accessor for type Unicode.ASCII and conformance Unicode.ASCII();
  uint64_t v2 = OUTLINED_FUNCTION_0_0((uint64_t)&v5, MEMORY[0x263F8EB70]);
  if (!v3) {
    __break(1u);
  }
LABEL_7:
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

BOOL closure #1 in closure #1 in DeviceTreeNodeProperty.nameString()(unsigned char *a1)
{
  return *a1 != 0;
}

uint64_t DeviceTreeNodeProperty.description.getter()
{
  uint64_t v2 = (unsigned __int8 *)v0[2];
  uint64_t v1 = v0[3];
  if (*v0)
  {
    unint64_t v3 = v0[1];
    uint64_t v55 = *v0;
    unint64_t v56 = v3;
    uint64_t v57 = closure #1 in closure #1 in DeviceTreeNodeProperty.nameString();
    uint64_t v58 = 0;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>>);
    lazy protocol witness table accessor for type LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>> and conformance <> LazyPrefixWhileSequence<A>();
    lazy protocol witness table accessor for type Unicode.ASCII and conformance Unicode.ASCII();
    uint64_t result = OUTLINED_FUNCTION_0_0((uint64_t)&v55, MEMORY[0x263F8EB70]);
    if (v5) {
      goto LABEL_5;
    }
    __break(1u);
  }
  uint64_t v55 = 0;
  unint64_t v56 = 0;
  uint64_t v57 = closure #1 in closure #1 in DeviceTreeNodeProperty.nameString();
  uint64_t v58 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>>);
  lazy protocol witness table accessor for type LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>> and conformance <> LazyPrefixWhileSequence<A>();
  lazy protocol witness table accessor for type Unicode.ASCII and conformance Unicode.ASCII();
  uint64_t result = OUTLINED_FUNCTION_0_0((uint64_t)&v55, MEMORY[0x263F8EB70]);
  if (!v5)
  {
    __break(1u);
    return result;
  }
LABEL_5:
  uint64_t v6 = result;
  unint64_t v54 = v5;
  if (v2) {
    uint64_t v7 = v1 - (void)v2;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v55 = 124;
  unint64_t v56 = 0xE100000000000000;
  if (v7 < 25)
  {
    _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSRys5UInt8VG_SSs5NeverOTg504_ss5d14VSSIgyo_ABSSs5E88OIegnrzr_TR056_s13DeviceTreeKit0aB12NodePropertyV11descriptionSSvgSSs5A6VcfU0_Tf3nnnpf_nTf1cn_n(v2, v7);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    lazy protocol witness table accessor for type UnsafeBufferPointer<UInt8> and conformance UnsafeBufferPointer<A>((uint64_t)&lazy protocol witness table cache variable for type [String] and conformance [A]);
    uint64_t v33 = BidirectionalCollection<>.joined(separator:)();
    Swift::String v35 = v34;
    swift_bridgeObjectRelease();
    v36._countAndFlagsBits = v33;
    v36._object = v35;
    String.append(_:)(v36);
    swift_bridgeObjectRelease();
    v37._countAndFlagsBits = 124;
    v37._object = (void *)0xE100000000000000;
    String.append(_:)(v37);
    uint64_t v38 = v55;
    uint64_t v39 = (void *)v56;
    uint64_t v55 = (uint64_t)_sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSRys5UInt8VG_SSs5NeverOTg504_ss5d14VSSIgyo_ABSSs5E87OIegnrzr_TR056_s13DeviceTreeKit0aB12NodePropertyV11descriptionSSvgSSs5A5VcfU_Tf3nnnpf_nTf1cn_n(v2, v7);
    uint64_t v40 = BidirectionalCollection<>.joined(separator:)();
    unint64_t v42 = v41;
    swift_bridgeObjectRelease();
    uint64_t v55 = v40;
    unint64_t v56 = v42;
    v43._countAndFlagsBits = 32;
    v43._object = (void *)0xE100000000000000;
    String.append(_:)(v43);
    v44._countAndFlagsBits = v38;
    v44._object = v39;
    String.append(_:)(v44);
  }
  else
  {
    uint64_t v8 = OUTLINED_FUNCTION_33();
    _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFs5SliceVySRys5UInt8VGG_SSs5NeverOTg504_ss5e14VSSIgyo_ABSSs5F88OIegnrzr_TR056_s13DeviceTreeKit0aB12NodePropertyV11descriptionSSvgSSs5A6VcfU0_Tf3nnnpf_nTf1cn_n(v8, v9, v10);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    lazy protocol witness table accessor for type UnsafeBufferPointer<UInt8> and conformance UnsafeBufferPointer<A>((uint64_t)&lazy protocol witness table cache variable for type [String] and conformance [A]);
    uint64_t v11 = OUTLINED_FUNCTION_22();
    uint64_t v53 = v6;
    uint64_t v13 = v12;
    swift_bridgeObjectRelease();
    v14._countAndFlagsBits = v11;
    v14._object = v13;
    String.append(_:)(v14);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_24();
    _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFs5SliceVySRys5UInt8VGG_SSs5NeverOTg504_ss5e14VSSIgyo_ABSSs5F88OIegnrzr_TR056_s13DeviceTreeKit0aB12NodePropertyV11descriptionSSvgSSs5A6VcfU0_Tf3nnnpf_nTf1cn_n(v7 - 8, v7, (uint64_t)v2);
    uint64_t v15 = OUTLINED_FUNCTION_22();
    uint64_t v17 = v16;
    swift_bridgeObjectRelease();
    v18._countAndFlagsBits = v15;
    v18._object = v17;
    String.append(_:)(v18);
    swift_bridgeObjectRelease();
    v19._countAndFlagsBits = 124;
    v19._object = (void *)0xE100000000000000;
    String.append(_:)(v19);
    unint64_t v20 = (void *)v56;
    uint64_t v52 = v55;
    uint64_t v55 = 0;
    unint64_t v56 = 0xE000000000000000;
    _StringGuts.grow(_:)(20);
    uint64_t v21 = OUTLINED_FUNCTION_33();
    uint64_t v55 = (uint64_t)_sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFs5SliceVySRys5UInt8VGG_SSs5NeverOTg504_ss5e14VSSIgyo_ABSSs5F87OIegnrzr_TR056_s13DeviceTreeKit0aB12NodePropertyV11descriptionSSvgSSs5A5VcfU_Tf3nnnpf_nTf1cn_n(v21, v22, v23);
    uint64_t v24 = OUTLINED_FUNCTION_23();
    unint64_t v26 = v25;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v55 = v24;
    unint64_t v56 = v26;
    OUTLINED_FUNCTION_24();
    _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFs5SliceVySRys5UInt8VGG_SSs5NeverOTg504_ss5e14VSSIgyo_ABSSs5F87OIegnrzr_TR056_s13DeviceTreeKit0aB12NodePropertyV11descriptionSSvgSSs5A5VcfU_Tf3nnnpf_nTf1cn_n(v7 - 8, v7, (uint64_t)v2);
    uint64_t v27 = OUTLINED_FUNCTION_23();
    uint64_t v29 = v28;
    swift_bridgeObjectRelease();
    v30._countAndFlagsBits = v27;
    v30._object = v29;
    String.append(_:)(v30);
    swift_bridgeObjectRelease();
    v31._countAndFlagsBits = 32;
    v31._object = (void *)0xE100000000000000;
    String.append(_:)(v31);
    v32._countAndFlagsBits = v52;
    v32._object = v20;
    String.append(_:)(v32);
    uint64_t v6 = v53;
  }
  swift_bridgeObjectRelease();
  v45._countAndFlagsBits = 0x20657A69735B20;
  v45._object = (void *)0xE700000000000000;
  String.append(_:)(v45);
  lazy protocol witness table accessor for type Int and conformance Int();
  v46._countAndFlagsBits = BinaryInteger.description.getter();
  String.append(_:)(v46);
  swift_bridgeObjectRelease();
  v47._countAndFlagsBits = 93;
  v47._object = (void *)0xE100000000000000;
  String.append(_:)(v47);
  uint64_t v48 = v55;
  uint64_t v49 = (void *)v56;
  uint64_t v55 = v6;
  unint64_t v56 = v54;
  v50._countAndFlagsBits = 8250;
  v50._object = (void *)0xE200000000000000;
  String.append(_:)(v50);
  v51._countAndFlagsBits = v48;
  v51._object = v49;
  String.append(_:)(v51);
  swift_bridgeObjectRelease();
  return v55;
}

uint64_t closure #2 in DeviceTreeNodeProperty.description.getter(unsigned __int8 a1)
{
  unsigned int v2 = a1;
  if (!isprint(a1)) {
    return 46;
  }
  uint64_t v6 = 0;
  unint64_t v7 = 0xE000000000000000;
  unsigned int v3 = ((v2 >> 6) & 0xFFFFC0FF | ((v2 & 0x3F) << 8)) + 33217;
  if ((a1 & 0x80) == 0) {
    unsigned int v3 = (a1 + 1);
  }
  uint64_t v5 = (v3 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v3) >> 3)) & 7)));
  MEMORY[0x2533129B0](&v5);
  Character.write<A>(to:)();
  swift_bridgeObjectRelease();
  return v6;
}

char *_sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFs5SliceVySRys5UInt8VGG_SSs5NeverOTg504_ss5e14VSSIgyo_ABSSs5F88OIegnrzr_TR056_s13DeviceTreeKit0aB12NodePropertyV11descriptionSSvgSSs5A6VcfU0_Tf3nnnpf_nTf1cn_n(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = MEMORY[0x263F8EE78];
  uint64_t v4 = a2 - a1;
  if (a2 == a1) {
    return (char *)v3;
  }
  uint64_t v16 = MEMORY[0x263F8EE78];
  uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v3 = v16;
    uint64_t v8 = (unsigned __int8 *)(a3 + a1);
    do
    {
      unsigned __int8 v9 = *v8++;
      uint64_t v10 = closure #2 in DeviceTreeNodeProperty.description.getter(v9);
      uint64_t v12 = v11;
      unint64_t v14 = *(void *)(v16 + 16);
      unint64_t v13 = *(void *)(v16 + 24);
      if (v14 >= v13 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v13 > 1), v14 + 1, 1);
      }
      *(void *)(v16 + 16) = v14 + 1;
      uint64_t v15 = v16 + 16 * v14;
      *(void *)(v15 + 32) = v10;
      *(void *)(v15 + 40) = v12;
      --v4;
    }
    while (v4);
    return (char *)v3;
  }
  __break(1u);
  return result;
}

char *_sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFs5SliceVySRys5UInt8VGG_SSs5NeverOTg504_ss5e14VSSIgyo_ABSSs5F87OIegnrzr_TR056_s13DeviceTreeKit0aB12NodePropertyV11descriptionSSvgSSs5A5VcfU_Tf3nnnpf_nTf1cn_n(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = MEMORY[0x263F8EE78];
  uint64_t v4 = a2 - a1;
  if (a2 == a1) {
    return (char *)v3;
  }
  uint64_t v17 = MEMORY[0x263F8EE78];
  uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v3 = v17;
    uint64_t v8 = (unsigned __int8 *)(a3 + a1);
    do
    {
      unsigned int v9 = *v8++;
      lazy protocol witness table accessor for type UInt8 and conformance UInt8();
      if (v9 > 0xF)
      {
        uint64_t v11 = String.init<A>(_:radix:uppercase:)();
        unint64_t v12 = v13;
      }
      else
      {
        v10._countAndFlagsBits = String.init<A>(_:radix:uppercase:)();
        String.append(_:)(v10);
        swift_bridgeObjectRelease();
        uint64_t v11 = 48;
        unint64_t v12 = 0xE100000000000000;
      }
      unint64_t v15 = *(void *)(v17 + 16);
      unint64_t v14 = *(void *)(v17 + 24);
      if (v15 >= v14 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v14 > 1), v15 + 1, 1);
      }
      *(void *)(v17 + 16) = v15 + 1;
      uint64_t v16 = v17 + 16 * v15;
      *(void *)(v16 + 32) = v11;
      *(void *)(v16 + 40) = v12;
      --v4;
    }
    while (v4);
    return (char *)v3;
  }
  __break(1u);
  return result;
}

char *_sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSRys5UInt8VG_SSs5NeverOTg504_ss5d14VSSIgyo_ABSSs5E88OIegnrzr_TR056_s13DeviceTreeKit0aB12NodePropertyV11descriptionSSvgSSs5A6VcfU0_Tf3nnnpf_nTf1cn_n(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!a2) {
    return (char *)v2;
  }
  uint64_t v3 = a2;
  uint64_t v13 = MEMORY[0x263F8EE78];
  uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, a2 & ~(a2 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v2 = v13;
    do
    {
      unsigned __int8 v6 = *a1++;
      uint64_t v7 = closure #2 in DeviceTreeNodeProperty.description.getter(v6);
      uint64_t v9 = v8;
      unint64_t v11 = *(void *)(v13 + 16);
      unint64_t v10 = *(void *)(v13 + 24);
      if (v11 >= v10 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v10 > 1), v11 + 1, 1);
      }
      *(void *)(v13 + 16) = v11 + 1;
      uint64_t v12 = v13 + 16 * v11;
      *(void *)(v12 + 32) = v7;
      *(void *)(v12 + 40) = v9;
      --v3;
    }
    while (v3);
    return (char *)v2;
  }
  __break(1u);
  return result;
}

char *_sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSRys5UInt8VG_SSs5NeverOTg504_ss5d14VSSIgyo_ABSSs5E87OIegnrzr_TR056_s13DeviceTreeKit0aB12NodePropertyV11descriptionSSvgSSs5A5VcfU_Tf3nnnpf_nTf1cn_n(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x263F8EE78];
  if (!a2) {
    return (char *)v2;
  }
  uint64_t v3 = a2;
  uint64_t v14 = MEMORY[0x263F8EE78];
  uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, a2 & ~(a2 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    uint64_t v2 = v14;
    do
    {
      unsigned int v6 = *a1++;
      lazy protocol witness table accessor for type UInt8 and conformance UInt8();
      if (v6 > 0xF)
      {
        uint64_t v8 = String.init<A>(_:radix:uppercase:)();
        unint64_t v9 = v10;
      }
      else
      {
        v7._countAndFlagsBits = String.init<A>(_:radix:uppercase:)();
        String.append(_:)(v7);
        swift_bridgeObjectRelease();
        uint64_t v8 = 48;
        unint64_t v9 = 0xE100000000000000;
      }
      unint64_t v12 = *(void *)(v14 + 16);
      unint64_t v11 = *(void *)(v14 + 24);
      if (v12 >= v11 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
      }
      *(void *)(v14 + 16) = v12 + 1;
      uint64_t v13 = v14 + 16 * v12;
      *(void *)(v13 + 32) = v8;
      *(void *)(v13 + 40) = v9;
      --v3;
    }
    while (v3);
    return (char *)v2;
  }
  __break(1u);
  return result;
}

uint64_t DeviceTreeNodeProperty.debugDescription.getter()
{
  return DeviceTreeNodeProperty.description.getter();
}

double DeviceTreeNodePropertyIterator.wrapped.setter(uint64_t a1)
{
  return DeviceTreeNodePropertyIterator.wrapped.setter(a1, &demangling cache variable for type metadata for device_tree_node_property_iterator?);
}

uint64_t (*DeviceTreeNodePropertyIterator.wrapped.modify())()
{
  return DeviceTreeNodePathIterator.index.modify;
}

void DeviceTreeNodeChildren.node.getter(__n128 *a1@<X8>)
{
  OUTLINED_FUNCTION_26(a1, *v1);
}

double DeviceTreeNodeChildrenIterator.init(children:)(uint64_t *a1)
{
  return DeviceTreeNodePropertyIterator.init(properties:)(a1, (double (*)(uint64_t, uint64_t, _OWORD *))__swift_device_tree_node_children_iterator_init(_:_:));
}

double DeviceTreeNodePropertyIterator.init(properties:)(uint64_t *a1, double (*a2)(uint64_t, uint64_t, _OWORD *))
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  memset(v16, 0, sizeof(v16));
  *(double *)v5.i64 = a2(v4, v3, v16);
  *(void *)&double result = OUTLINED_FUNCTION_3(v6, v7, v8, v9, v10, v11, v12, v13, v5, v14).u64[0];
  return result;
}

double protocol witness for Sequence.makeIterator() in conformance DeviceTreeNodeChildren()
{
  v0.n128_f64[0] = DeviceTreeNodeChildren.makeIterator()();
  *(void *)&double result = OUTLINED_FUNCTION_15(v1, v2, v3, v4, v5, v6, v7, v8, v10, v0, v11, v12).n128_u64[0];
  return result;
}

uint64_t protocol witness for Sequence.underestimatedCount.getter in conformance DeviceTreeNodeChildren()
{
  return specialized Sequence.underestimatedCount.getter();
}

uint64_t protocol witness for Sequence._copyToContiguousArray() in conformance DeviceTreeNodeChildren()
{
  return specialized Sequence._copyToContiguousArray()(*v0, v0[1]);
}

uint64_t protocol witness for Sequence._copyContents(initializing:) in conformance DeviceTreeNodeChildren(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return specialized Sequence._copyContents(initializing:)(a1, a2, a3, *v3, v3[1]);
}

double variable initialization expression of DeviceTreeNodeChildrenIterator.wrapped@<D0>(uint64_t a1@<X8>)
{
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 32) = 1;
  return result;
}

__n128 DeviceTreeNodeChildrenIterator.wrapped.getter@<Q0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 32);
  __n128 result = *(__n128 *)v1;
  long long v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_OWORD *)(a1 + 16) = v4;
  *(unsigned char *)(a1 + 32) = v2;
  return result;
}

double DeviceTreeNodeChildrenIterator.wrapped.setter(uint64_t a1)
{
  return DeviceTreeNodePropertyIterator.wrapped.setter(a1, &demangling cache variable for type metadata for device_tree_node_children_iterator?);
}

double DeviceTreeNodePropertyIterator.wrapped.setter(uint64_t a1, uint64_t *a2)
{
  outlined init with take of device_tree_node_property_iterator?(a1, (uint64_t)v6, a2);
  char v3 = v7;
  double result = *(double *)v6;
  long long v5 = v6[1];
  *(_OWORD *)uint64_t v2 = v6[0];
  *(_OWORD *)(v2 + 16) = v5;
  *(unsigned char *)(v2 + 32) = v3;
  return result;
}

uint64_t (*DeviceTreeNodeChildrenIterator.wrapped.modify())()
{
  return DeviceTreeNodePathIterator.index.modify;
}

BOOL static DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError.hash(into:)(uint64_t a1, char a2)
{
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError.== infix(_:_:)(*a1, *a2);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError()
{
  return DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError(uint64_t a1)
{
  DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError.hash(into:)(a1, *v1);
}

uint64_t protocol witness for Error._domain.getter in conformance DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t protocol witness for Error._code.getter in conformance DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t protocol witness for Error._userInfo.getter in conformance DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t protocol witness for Error._getEmbeddedNSError() in conformance DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t DeviceTreeNodeRepresentation.properties.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DeviceTreeNodeRepresentation.children.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DeviceTreeNodeRepresentation.init(from:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  int8x16_t v59 = 0u;
  long long v60 = 0u;
  uint64_t v50 = v2;
  uint64_t v51 = v3;
  char v4 = __swift_device_tree_node_property_iterator_init(_:_:)(v3, v2, (uint64_t)&v59);
  *(double *)v5.i64 = OUTLINED_FUNCTION_16(v4, v59);
  int8x16_t v59 = v5;
  long long v60 = v6;
  BOOL v61 = (v7 & 1) == 0;
  DeviceTreeNodePropertyIterator.next()((uint64_t)&v54);
  uint64_t v8 = (void *)MEMORY[0x263F8EE78];
  if ((v58 & 1) == 0)
  {
    uint64_t v9 = v56;
    uint64_t v10 = v57;
    long long v11 = (void *)MEMORY[0x263F8EE78];
    uint64_t v8 = (void *)MEMORY[0x263F8EE78];
    do
    {
      if (v54)
      {
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>>);
        lazy protocol witness table accessor for type LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>> and conformance <> LazyPrefixWhileSequence<A>();
        unint64_t v12 = lazy protocol witness table accessor for type Unicode.ASCII and conformance Unicode.ASCII();
        uint64_t v17 = OUTLINED_FUNCTION_10(v12, v13, v14, v15, v16);
        if (!v18)
        {
          __break(1u);
LABEL_29:
          __break(1u);
        }
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>>);
        lazy protocol witness table accessor for type LazyPrefixWhileSequence<UnsafeBufferPointer<UInt8>> and conformance <> LazyPrefixWhileSequence<A>();
        unint64_t v19 = lazy protocol witness table accessor for type Unicode.ASCII and conformance Unicode.ASCII();
        uint64_t v17 = OUTLINED_FUNCTION_10(v19, v20, v21, v22, v23);
        if (!v18) {
          goto LABEL_29;
        }
      }
      uint64_t v24 = v17;
      uint64_t v25 = v18;
      uint64_t v26 = v10 - v9;
      uint64_t v27 = v11;
      if (v9 && v10 != v9)
      {
        if (v26 <= 0)
        {
          uint64_t v27 = v11;
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
          uint64_t v27 = (void *)swift_allocObject();
          size_t v28 = _swift_stdlib_malloc_size(v27);
          v27[2] = v26;
          v27[3] = 2 * v28 - 64;
        }
        memcpy(v27 + 4, v9, v10 - v9);
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        Swift::String v32 = (void *)OUTLINED_FUNCTION_14();
        uint64_t v8 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v32, v33, v34, v8);
      }
      unint64_t v30 = v8[2];
      unint64_t v29 = v8[3];
      if (v30 >= v29 >> 1)
      {
        BOOL v35 = OUTLINED_FUNCTION_5(v29);
        uint64_t v8 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((void *)v35, v36, v37, v8);
      }
      void v8[2] = v30 + 1;
      Swift::String v31 = &v8[3 * v30];
      v31[4] = v24;
      v31[5] = v25;
      v31[6] = v27;
      DeviceTreeNodePropertyIterator.next()((uint64_t)&v54);
      uint64_t v9 = v56;
      uint64_t v10 = v57;
    }
    while ((v58 & 1) == 0);
  }
  uint64_t v38 = specialized Dictionary.init<A>(_:uniquingKeysWith:)((uint64_t)v8);
  uint64_t v53 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRetain();
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, 0, 0);
  int8x16_t v59 = 0u;
  long long v60 = 0u;
  char v39 = __swift_device_tree_node_children_iterator_init(_:_:)(v51, v50, (uint64_t)&v59);
  if (v39)
  {
    while (!__swift_device_tree_node_children_iterator_end(_:)((unint64_t *)&v59))
    {
      unint64_t v54 = 0;
      uint64_t v55 = 0;
      if ((__swift_device_tree_node_children_iterator_node(_:_:)((unint64_t *)&v59, &v54) & 1) == 0) {
        break;
      }
      unint64_t v40 = v54;
      uint64_t v41 = v55;
      __swift_device_tree_node_children_iterator_next(_:)((unint64_t *)&v59);
      int8x16_t v42 = v59;
      long long v43 = v60;
      unint64_t v54 = v40;
      uint64_t v55 = v41;
      DeviceTreeNodeRepresentation.init(from:)(&v59, &v54);
      uint64_t v44 = v59.i64[0];
      if (!v59.i64[0])
      {
        swift_bridgeObjectRelease_n();
        uint64_t result = swift_release();
        *a2 = 0;
        a2[1] = 0;
        return result;
      }
      uint64_t v45 = v59.i64[1];
      unint64_t v47 = *(void *)(v53 + 16);
      unint64_t v46 = *(void *)(v53 + 24);
      if (v47 >= v46 >> 1) {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v46 > 1), v47 + 1, 1);
      }
      *(void *)(v53 + 16) = v47 + 1;
      unint64_t v48 = v53 + 16 * v47;
      *(void *)(v48 + 32) = v44;
      *(void *)(v48 + 40) = v45;
      int8x16_t v59 = v42;
      long long v60 = v43;
    }
  }
  *a2 = v38;
  a2[1] = v53;
  return swift_bridgeObjectRelease();
}

uint64_t specialized Dictionary.init<A>(_:uniquingKeysWith:)(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, [UInt8]>);
    uint64_t v3 = static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v3 = MEMORY[0x263F8EE80];
  }
  uint64_t v6 = v3;
  specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(a1, 1, &v6);
  uint64_t v4 = v6;
  if (v1) {
    swift_release();
  }
  return v4;
}

uint64_t DeviceTreeNodeRepresentation.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x69747265706F7270 && a2 == 0xEA00000000007365;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6572646C696863 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v7) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

Swift::Int DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError.hashValue.getter(char a1)
{
  return Hasher._finalize()();
}

uint64_t DeviceTreeNodeRepresentation.CodingKeys.stringValue.getter(char a1)
{
  if (a1) {
    return 0x6E6572646C696863;
  }
  else {
    return 0x69747265706F7270;
  }
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance DeviceTreeNodeRepresentation.CodingKeys()
{
  return DeviceTreeNodeRepresentation.CodingKeys.stringValue.getter(*v0);
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance DeviceTreeNodeRepresentation.CodingKeys@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = DeviceTreeNodeRepresentation.CodingKeys.init(stringValue:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance DeviceTreeNodeRepresentation.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance DeviceTreeNodeRepresentation.CodingKeys(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance DeviceTreeNodeRepresentation.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type DeviceTreeNodeRepresentation.CodingKeys and conformance DeviceTreeNodeRepresentation.CodingKeys();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance DeviceTreeNodeRepresentation.CodingKeys(uint64_t a1)
{
  unint64_t v2 = lazy protocol witness table accessor for type DeviceTreeNodeRepresentation.CodingKeys and conformance DeviceTreeNodeRepresentation.CodingKeys();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t static DeviceTreeNodeRepresentation.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a2[1];
  if ((specialized static Dictionary<>.== infix(_:_:)(*a1, *a2) & 1) == 0) {
    return 0;
  }

  return specialized static Array<A>.== infix(_:_:)(v2, v3);
}

uint64_t specialized static Dictionary<>.== infix(_:_:)(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(result + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v10 | (v4 << 6); ; unint64_t i = __clz(__rbit64(v13)) + (v4 << 6))
  {
    uint64_t v15 = (uint64_t *)(*(void *)(v3 + 48) + 16 * i);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = *(void *)(*(void *)(v3 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v19 = specialized __RawDictionaryStorage.find<A>(_:)(v16, v17);
    char v21 = v20;
    uint64_t result = swift_bridgeObjectRelease();
    if ((v21 & 1) == 0
      || (uint64_t v22 = *(void *)(*(void *)(a2 + 56) + 8 * v19), v23 = *(void *)(v22 + 16), v23 != *(void *)(v18 + 16)))
    {
LABEL_40:
      swift_bridgeObjectRelease();
      return 0;
    }
    if (v23) {
      BOOL v24 = v22 == v18;
    }
    else {
      BOOL v24 = 1;
    }
    if (!v24)
    {
      if (*(unsigned __int8 *)(v22 + 32) != *(unsigned __int8 *)(v18 + 32)) {
        goto LABEL_40;
      }
      if (v23 != 1)
      {
        if (*(unsigned __int8 *)(v22 + 33) != *(unsigned __int8 *)(v18 + 33)) {
          goto LABEL_40;
        }
        uint64_t v25 = v23 - 2;
        if (v25)
        {
          uint64_t v26 = 0;
          uint64_t v27 = v22 + 34;
          while (v25 != v26)
          {
            if (*(unsigned __int8 *)(v27 + v26) != *(unsigned __int8 *)(v18 + v26 + 34)) {
              goto LABEL_40;
            }
            if (v25 == ++v26) {
              goto LABEL_37;
            }
          }
          __break(1u);
LABEL_43:
          __break(1u);
          goto LABEL_44;
        }
      }
    }
LABEL_37:
    uint64_t result = swift_bridgeObjectRelease();
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v12 = v4 + 1;
    if (__OFADD__(v4, 1)) {
      goto LABEL_43;
    }
    if (v12 >= v9) {
      return 1;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v12);
    ++v4;
    if (!v13)
    {
      int64_t v4 = v12 + 1;
      if (v12 + 1 >= v9) {
        return 1;
      }
      unint64_t v13 = *(void *)(v5 + 8 * v4);
      if (!v13)
      {
        int64_t v4 = v12 + 2;
        if (v12 + 2 >= v9) {
          return 1;
        }
        unint64_t v13 = *(void *)(v5 + 8 * v4);
        if (!v13)
        {
          int64_t v4 = v12 + 3;
          if (v12 + 3 >= v9) {
            return 1;
          }
          unint64_t v13 = *(void *)(v5 + 8 * v4);
          if (!v13) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v8 = (v13 - 1) & v13;
  }
  int64_t v14 = v12 + 4;
  if (v14 >= v9) {
    return 1;
  }
  unint64_t v13 = *(void *)(v5 + 8 * v14);
  if (v13)
  {
    int64_t v4 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v4 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v4 >= v9) {
      return 1;
    }
    unint64_t v13 = *(void *)(v5 + 8 * v4);
    ++v14;
    if (v13) {
      goto LABEL_22;
    }
  }
LABEL_44:
  __break(1u);
  return result;
}

uint64_t specialized static Array<A>.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16))
  {
LABEL_14:
    char v10 = 0;
    return v10 & 1;
  }
  if (v2 && a1 != a2)
  {
    uint64_t v3 = v2 - 1;
    int64_t v4 = (uint64_t *)(a2 + 40);
    uint64_t v5 = (uint64_t *)(a1 + 40);
    while (1)
    {
      uint64_t v6 = *(v5 - 1);
      uint64_t v7 = *v5;
      uint64_t v8 = *(v4 - 1);
      uint64_t v9 = *v4;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if ((specialized static Dictionary<>.== infix(_:_:)(v6, v8) & 1) == 0) {
        break;
      }
      char v10 = specialized static Array<A>.== infix(_:_:)(v7, v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      BOOL v12 = v3-- != 0;
      if (v10)
      {
        v4 += 2;
        v5 += 2;
        if (v12) {
          continue;
        }
      }
      return v10 & 1;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  char v10 = 1;
  return v10 & 1;
}

uint64_t DeviceTreeNodeRepresentation.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<DeviceTreeNodeRepresentation.CodingKeys>);
  OUTLINED_FUNCTION_4();
  uint64_t v6 = v5;
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v1;
  uint64_t v13 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type DeviceTreeNodeRepresentation.CodingKeys and conformance DeviceTreeNodeRepresentation.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  uint64_t v15 = v9;
  char v14 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : [UInt8]]);
  unint64_t v10 = lazy protocol witness table accessor for type [String : [UInt8]] and conformance <> [A : B]();
  OUTLINED_FUNCTION_11(v10);
  if (!v2)
  {
    uint64_t v15 = v13;
    char v14 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DeviceTreeNodeRepresentation]);
    unint64_t v11 = lazy protocol witness table accessor for type [DeviceTreeNodeRepresentation] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type [DeviceTreeNodeRepresentation] and conformance <A> [A]);
    OUTLINED_FUNCTION_11(v11);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v4);
}

uint64_t DeviceTreeNodeRepresentation.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<DeviceTreeNodeRepresentation.CodingKeys>);
  OUTLINED_FUNCTION_4();
  MEMORY[0x270FA5388]();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type DeviceTreeNodeRepresentation.CodingKeys and conformance DeviceTreeNodeRepresentation.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2) {
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : [UInt8]]);
  lazy protocol witness table accessor for type [String : [UInt8]] and conformance <> [A : B]();
  OUTLINED_FUNCTION_19();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DeviceTreeNodeRepresentation]);
  lazy protocol witness table accessor for type [DeviceTreeNodeRepresentation] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type [DeviceTreeNodeRepresentation] and conformance <A> [A]);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_19();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  uint64_t v5 = OUTLINED_FUNCTION_31();
  v6(v5);
  *a2 = v8;
  a2[1] = v8;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t protocol witness for Decodable.init(from:) in conformance DeviceTreeNodeRepresentation@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return DeviceTreeNodeRepresentation.init(from:)(a1, a2);
}

uint64_t protocol witness for Encodable.encode(to:) in conformance DeviceTreeNodeRepresentation(void *a1)
{
  return DeviceTreeNodeRepresentation.encode(to:)(a1);
}

char *specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  Swift::UInt v1 = *v0;
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  *__n128 v0 = v1;
  if (!result)
  {
    uint64_t result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(result, *((void *)v1 + 2) + 1, 1, v1);
    *__n128 v0 = result;
  }
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Substring>);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  BOOL v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[32 * v8] <= v12) {
      memmove(v12, v13, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  BOOL v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, [UInt8])>);
    unint64_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    _OWORD v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    unint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  if (v5)
  {
    if (v10 != a4 || &a4[3 * v8 + 4] <= v10 + 4) {
      memmove(v10 + 4, a4 + 4, 24 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, [UInt8]));
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

{
  char **v3;
  char *result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  BOOL v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DeviceTreeNodeRepresentation>);
    unint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  BOOL v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12) {
      memmove(v12, v13, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(char *result)
{
  unint64_t v2 = *((void *)*v1 + 3);
  if ((uint64_t)(result + 1) > (uint64_t)(v2 >> 1))
  {
    uint64_t result = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v2 > 1), (int64_t)(result + 1), 1, *v1);
    char *v1 = result;
  }
  return result;
}

uint64_t specialized closure #1 in Collection<>.split(separator:maxSplits:omittingEmptySubsequences:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4) {
    return 1;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)() & 1;
  }
}

uint64_t specialized Collection.split(maxSplits:omittingEmptySubsequences:whereSeparator:)(uint64_t result, unsigned __int8 a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v48[3] = a4;
  if (result < 0)
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    return result;
  }
  uint64_t v9 = result;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = MEMORY[0x263F8EE78];
  unint64_t v40 = (char **)(v10 + 16);
  uint64_t v45 = swift_allocObject();
  *(void *)(v45 + 16) = 15;
  uint64_t v11 = HIBYTE(a6) & 0xF;
  if (!v9 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v12 = HIBYTE(a6) & 0xF) : (uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v11 = a5 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v29 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0) {
      uint64_t v29 = 11;
    }
    specialized appendSubsequence #1 <A>(end:) in Collection.split(maxSplits:omittingEmptySubsequences:whereSeparator:)(v29 | (v11 << 16), v45, a2 & 1, v10);
    swift_bridgeObjectRelease();
    uint64_t v13 = *(char **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_36;
  }
  uint64_t v39 = v9;
  unint64_t v46 = 4 * v12;
  uint64_t v13 = (char *)MEMORY[0x263F8EE78];
  unint64_t v14 = 15;
  unint64_t v15 = 15;
  unint64_t v16 = 15;
  while (1)
  {
    v48[0] = String.subscript.getter();
    v48[1] = v17;
    char v18 = a3(v48);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    char v19 = v18;
    uint64_t result = swift_bridgeObjectRelease();
    if ((v19 & 1) == 0)
    {
      uint64_t result = String.index(after:)();
      unint64_t v14 = result;
      goto LABEL_21;
    }
    int v20 = (v15 >> 14 == v14 >> 14) & a2;
    if (v20 != 1)
    {
      if (v14 >> 14 < v15 >> 14)
      {
        __break(1u);
        goto LABEL_39;
      }
      uint64_t v21 = String.subscript.getter();
      uint64_t v42 = v22;
      uint64_t v43 = v21;
      uint64_t v24 = v23;
      uint64_t v41 = v25;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v13 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((void *)v13 + 2) + 1, 1, v13);
      }
      unint64_t v27 = *((void *)v13 + 2);
      unint64_t v26 = *((void *)v13 + 3);
      if (v27 >= v26 >> 1) {
        uint64_t v13 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v26 > 1), v27 + 1, 1, v13);
      }
      *((void *)v13 + 2) = v27 + 1;
      size_t v28 = &v13[32 * v27];
      *((void *)v28 + 4) = v43;
      *((void *)v28 + 5) = v24;
      *((void *)v28 + 6) = v42;
      *((void *)v28 + 7) = v41;
      *unint64_t v40 = v13;
    }
    uint64_t result = String.index(after:)();
    unint64_t v14 = result;
    *(void *)(v45 + 16) = result;
    if ((v20 & 1) == 0 && *((void *)v13 + 2) == v39) {
      break;
    }
    unint64_t v15 = result;
    unint64_t v16 = result;
LABEL_21:
    if (v46 == v14 >> 14) {
      goto LABEL_30;
    }
  }
  unint64_t v16 = result;
  unint64_t v15 = result;
LABEL_30:
  if (v46 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    if (v46 < v16 >> 14) {
      goto LABEL_40;
    }
    uint64_t v30 = String.subscript.getter();
    uint64_t v32 = v31;
    uint64_t v34 = v33;
    uint64_t v36 = v35;
    swift_bridgeObjectRelease();
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    char v37 = (char *)*((void *)*v40 + 2);
    specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(v37);
    uint64_t v13 = *v40;
    *((void *)v13 + 2) = v37 + 1;
    uint64_t v38 = &v13[32 * (void)v37];
    *((void *)v38 + 4) = v30;
    *((void *)v38 + 5) = v32;
    *((void *)v38 + 6) = v34;
    *((void *)v38 + 7) = v36;
    *unint64_t v40 = v13;
  }
  swift_bridgeObjectRetain();
  swift_release();
LABEL_36:
  swift_release();
  return (uint64_t)v13;
}

unint64_t specialized appendSubsequence #1 <A>(end:) in Collection.split(maxSplits:omittingEmptySubsequences:whereSeparator:)(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t result = *(void *)(a2 + 16);
  int v6 = (result >> 14 == a1 >> 14) & a3;
  if (v6 == 1) {
    return v6 ^ 1u;
  }
  if (a1 >> 14 >= result >> 14)
  {
    uint64_t v8 = String.subscript.getter();
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    unint64_t v15 = *(char **)(*(void *)(a4 + 16) + 16);
    specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(v15);
    uint64_t v16 = *(void *)(a4 + 16);
    *(void *)(v16 + 16) = v15 + 1;
    uint64_t v17 = (void *)(v16 + 32 * (void)v15);
    v17[4] = v8;
    v17[5] = v10;
    v17[6] = v12;
    v17[7] = v14;
    return v6 ^ 1u;
  }
  __break(1u);
  return result;
}

void *specialized _copySequenceToContiguousArray<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v28 = 0u;
  long long v29 = 0u;
  if (__swift_device_tree_node_children_iterator_init(_:_:)(a1, a2, (uint64_t)&v28))
  {
    BOOL v2 = __swift_device_tree_node_children_iterator_end(_:)((unint64_t *)&v28);
    uint64_t v3 = (void *)MEMORY[0x263F8EE78];
    uint64_t v4 = 0;
    if (!v2)
    {
      char v5 = (unint64_t *)(MEMORY[0x263F8EE78] + 32);
      while (1)
      {
        unint64_t v26 = 0;
        unint64_t v27 = 0;
        if ((__swift_device_tree_node_children_iterator_node(_:_:)((unint64_t *)&v28, &v26) & 1) == 0) {
          goto LABEL_23;
        }
        unint64_t v6 = v26;
        unint64_t v7 = v27;
        __swift_device_tree_node_children_iterator_next(_:)((unint64_t *)&v28);
        long long v8 = v28;
        long long v9 = v29;
        if (!v4)
        {
          unint64_t v10 = v3[3];
          if ((uint64_t)((v10 >> 1) + 0x4000000000000000) < 0) {
            goto LABEL_28;
          }
          long long v24 = v29;
          long long v25 = v28;
          int64_t v11 = v10 & 0xFFFFFFFFFFFFFFFELL;
          if (v11 <= 1) {
            uint64_t v12 = 1;
          }
          else {
            uint64_t v12 = v11;
          }
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DeviceTreeNode>);
          uint64_t v13 = (void *)swift_allocObject();
          uint64_t v14 = (uint64_t)(_swift_stdlib_malloc_size(v13) - 32) / 16;
          v13[2] = v12;
          v13[3] = 2 * v14;
          unint64_t v15 = (unint64_t)(v13 + 4);
          unint64_t v16 = v3[3];
          unint64_t v17 = v16 >> 1;
          if (v3[2])
          {
            if (v13 != v3 || v15 >= (unint64_t)&v3[2 * v17 + 4]) {
              memmove(v13 + 4, v3 + 4, 16 * v17);
            }
            v3[2] = 0;
          }
          char v5 = (unint64_t *)(v15 + 16 * v17);
          uint64_t v4 = (v14 & 0x7FFFFFFFFFFFFFFFLL) - (v16 >> 1);
          swift_release();
          uint64_t v3 = v13;
          long long v9 = v24;
          long long v8 = v25;
        }
        BOOL v19 = __OFSUB__(v4--, 1);
        if (v19) {
          break;
        }
        *char v5 = v6;
        v5[1] = v7;
        v5 += 2;
        long long v28 = v8;
        long long v29 = v9;
        if (__swift_device_tree_node_children_iterator_end(_:)((unint64_t *)&v28)) {
          goto LABEL_23;
        }
      }
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
    }
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = (void *)MEMORY[0x263F8EE78];
  }
LABEL_23:
  unint64_t v20 = v3[3];
  if (v20 >= 2)
  {
    unint64_t v21 = v20 >> 1;
    BOOL v19 = __OFSUB__(v21, v4);
    unint64_t v22 = v21 - v4;
    if (v19) {
      goto LABEL_29;
    }
    v3[2] = v22;
  }
  return v3;
}

{
  char v2;
  unint64_t v3;
  int8x16_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  long long v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  BOOL v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  long long v25;
  uint64_t v26;
  long long v27;
  uint64_t v28;
  char v29;
  int8x16_t v30;
  int8x16_t v31;
  BOOL v32;
  uint64_t v33;

  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v30 = 0u;
  uint64_t v31 = 0u;
  BOOL v2 = __swift_device_tree_node_property_iterator_init(_:_:)(a1, a2, (uint64_t)&v30);
  if (v2) {
    uint64_t v3 = -1;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = (int8x16_t)vdupq_n_s64(v3);
  uint64_t v30 = vandq_s8(v30, v4);
  uint64_t v31 = vandq_s8(v31, v4);
  uint64_t v32 = (v2 & 1) == 0;
  DeviceTreeNodePropertyIterator.next()((uint64_t)&v26);
  char v5 = (void *)MEMORY[0x263F8EE78];
  if ((v29 & 1) == 0)
  {
    unint64_t v6 = 0;
    unint64_t v7 = v28;
    long long v8 = MEMORY[0x263F8EE78] + 32;
    long long v9 = v27;
    while (1)
    {
      unint64_t v10 = v26;
      if (!v6)
      {
        int64_t v11 = v5[3];
        if ((uint64_t)((v11 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_28;
        }
        long long v25 = v9;
        uint64_t v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
        if (v12 <= 1) {
          uint64_t v13 = 1;
        }
        else {
          uint64_t v13 = v12;
        }
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<DeviceTreeNodeProperty>);
        uint64_t v14 = (void *)swift_allocObject();
        unint64_t v15 = (uint64_t)(_swift_stdlib_malloc_size(v14) - 32) / 32;
        v14[2] = v13;
        v14[3] = 2 * v15;
        unint64_t v16 = (unint64_t)(v14 + 4);
        unint64_t v17 = v5[3];
        char v18 = v17 >> 1;
        if (v5[2])
        {
          if (v14 != v5 || v16 >= (unint64_t)&v5[4 * v18 + 4]) {
            memmove(v14 + 4, v5 + 4, 32 * v18);
          }
          v5[2] = 0;
        }
        long long v8 = v16 + 32 * v18;
        unint64_t v6 = (v15 & 0x7FFFFFFFFFFFFFFFLL) - (v17 >> 1);
        swift_release();
        char v5 = v14;
        long long v9 = v25;
      }
      unint64_t v20 = __OFSUB__(v6--, 1);
      if (v20) {
        break;
      }
      *(void *)long long v8 = v10;
      *(void *)(v8 + 24) = v7;
      *(_OWORD *)(v8 + 8) = v9;
      DeviceTreeNodePropertyIterator.next()((uint64_t)&v26);
      long long v9 = v27;
      unint64_t v7 = v28;
      v8 += 32;
      if (v29) {
        goto LABEL_23;
      }
    }
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  unint64_t v6 = 0;
LABEL_23:
  unint64_t v21 = v5[3];
  if (v21 >= 2)
  {
    unint64_t v22 = v21 >> 1;
    unint64_t v20 = __OFSUB__(v22, v6);
    uint64_t v23 = v22 - v6;
    if (!v20)
    {
      v5[2] = v23;
      return v5;
    }
LABEL_29:
    __break(1u);
  }
  return v5;
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }
  return result;
}

void *specialized _copySequenceToContiguousArray<A>(_:)(void *a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  Swift::Int v2 = __swift_device_tree_node_path_size(_:)((Swift::OpaquePointer)a1);
  object = (void *)MEMORY[0x263F8EE78];
  if (v2 >= 1)
  {
    Swift::Int v4 = v2;
    long long v27 = 0uLL;
    if (__swift_device_tree_node_path_node(_:_:_:)(a1, 0, &v27))
    {
      uint64_t v5 = 0;
      unint64_t v6 = object + 4;
      uint64_t v7 = 1;
      while (1)
      {
        long long v8 = v27;
        if (!v5)
        {
          unint64_t v9 = object[3];
          if ((uint64_t)((v9 >> 1) + 0x4000000000000000) < 0) {
            goto LABEL_28;
          }
          long long v26 = v27;
          int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
          if (v10 <= 1) {
            uint64_t v11 = 1;
          }
          else {
            uint64_t v11 = v10;
          }
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<DeviceTreeNode>);
          uint64_t v12 = (void *)swift_allocObject();
          uint64_t v13 = (uint64_t)(_swift_stdlib_malloc_size(v12) - 32) / 16;
          v12[2] = v11;
          v12[3] = 2 * v13;
          unint64_t v14 = (unint64_t)(v12 + 4);
          unint64_t v15 = object[3];
          unint64_t v16 = v15 >> 1;
          if (object[2])
          {
            if (v12 != object || v14 >= (unint64_t)&object[2 * v16 + 4]) {
              memmove(v12 + 4, object + 4, 16 * v16);
            }
            object[2] = 0;
          }
          unint64_t v6 = (_OWORD *)(v14 + 16 * v16);
          uint64_t v5 = (v13 & 0x7FFFFFFFFFFFFFFFLL) - (v15 >> 1);
          swift_release();
          object = v12;
          long long v8 = v26;
        }
        BOOL v18 = __OFSUB__(v5--, 1);
        if (v18) {
          break;
        }
        *unint64_t v6 = v8;
        if (v4 == v7) {
          goto LABEL_23;
        }
        ++v6;
        long long v27 = 0uLL;
        if (!__swift_device_tree_node_path_node(_:_:_:)(a1, v7++, &v27)) {
          goto LABEL_21;
        }
      }
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
    }
LABEL_21:
    _StringGuts.grow(_:)(22);
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type Int and conformance Int();
    v20._countAndFlagsBits = BinaryInteger.description.getter();
    object = v20._object;
    String.append(_:)(v20);
    swift_bridgeObjectRelease();
    v21._countAndFlagsBits = 0x20666F2074756F20;
    v21._object = (void *)0xEE0073646E756F62;
    String.append(_:)(v21);
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  uint64_t v5 = 0;
LABEL_23:
  unint64_t v22 = object[3];
  if (v22 >= 2)
  {
    unint64_t v23 = v22 >> 1;
    BOOL v18 = __OFSUB__(v23, v5);
    unint64_t v24 = v23 - v5;
    if (v18) {
      goto LABEL_29;
    }
    object[2] = v24;
  }
  return object;
}

Swift::Int specialized Sequence._copySequenceContents(initializing:)(void *a1, uint64_t a2, Swift::Int a3, Swift::OpaquePointer a4)
{
  rawValue = a4._rawValue;
  uint64_t v18 = *MEMORY[0x263EF8340];
  Swift::Int v8 = __swift_device_tree_node_path_size(_:)(a4);
  Swift::Int v9 = v8;
  if (!a2) {
    goto LABEL_10;
  }
  if (!a3) {
    goto LABEL_11;
  }
  if (a3 < 0) {
    __break(1u);
  }
  Swift::Int v10 = v8 - 1;
  if (v8 < 1)
  {
LABEL_10:
    a3 = 0;
    goto LABEL_11;
  }
  long long v17 = 0uLL;
  uint64_t v11 = 0;
  if (!__swift_device_tree_node_path_node(_:_:_:)(rawValue, 0, &v17))
  {
LABEL_9:
    _StringGuts.grow(_:)(22);
    swift_bridgeObjectRelease();
    v16[0] = 0x207865646E49;
    v16[1] = 0xE600000000000000;
    lazy protocol witness table accessor for type Int and conformance Int();
    v13._countAndFlagsBits = BinaryInteger.description.getter();
    String.append(_:)(v13);
    swift_bridgeObjectRelease();
    rawValue = v16;
    v14._countAndFlagsBits = 0x20666F2074756F20;
    v14._object = (void *)0xEE0073646E756F62;
    String.append(_:)(v14);
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    goto LABEL_10;
  }
  while (1)
  {
    *(_OWORD *)(a2 + 16 * v11) = v17;
    if (a3 - 1 == v11) {
      break;
    }
    if (v10 == v11)
    {
      a3 = v9;
      break;
    }
    long long v17 = 0uLL;
    if (!__swift_device_tree_node_path_node(_:_:_:)(rawValue, ++v11, &v17)) {
      goto LABEL_9;
    }
  }
LABEL_11:
  *a1 = rawValue;
  a1[1] = a3;
  a1[2] = v9;
  return a3;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(int8x16_t *a1, _OWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int8x16_t v19 = 0u;
  int8x16_t v20 = 0u;
  char v8 = __swift_device_tree_node_property_iterator_init(_:_:)(a4, a5, (uint64_t)&v19);
  if (v8) {
    unint64_t v9 = -1;
  }
  else {
    unint64_t v9 = 0;
  }
  int8x16_t v10 = (int8x16_t)vdupq_n_s64(v9);
  int8x16_t v11 = vandq_s8(v19, v10);
  int8x16_t v12 = vandq_s8(v20, v10);
  char v13 = v8 ^ 1;
  int8x16_t v19 = v11;
  int8x16_t v20 = v12;
  char v21 = (v8 ^ 1) & 1;
  if (a2)
  {
    if (a3)
    {
      if (a3 < 0) {
        __break(1u);
      }
      DeviceTreeNodePropertyIterator.next()((uint64_t)v17);
      if (v18)
      {
        uint64_t v14 = 0;
LABEL_13:
        int8x16_t v11 = v19;
        int8x16_t v12 = v20;
        a3 = v14;
      }
      else
      {
        uint64_t v14 = 0;
        while (1)
        {
          long long v15 = v17[1];
          *a2 = v17[0];
          a2[1] = v15;
          if (a3 - 1 == v14) {
            break;
          }
          DeviceTreeNodePropertyIterator.next()((uint64_t)v17);
          a2 += 2;
          ++v14;
          if (v18) {
            goto LABEL_13;
          }
        }
        int8x16_t v11 = v19;
        int8x16_t v12 = v20;
      }
      char v13 = v21;
    }
  }
  else
  {
    a3 = 0;
  }
  *a1 = v11;
  a1[1] = v12;
  a1[2].i8[0] = v13 & 1;
  return a3;
}

uint64_t specialized Sequence._copySequenceContents(initializing:)(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  char v8 = __swift_device_tree_node_children_iterator_init(_:_:)(a4, a5, (uint64_t)&v20);
  if (v8)
  {
    uint64_t v10 = *((void *)&v20 + 1);
    uint64_t v9 = v20;
    uint64_t v12 = *((void *)&v21 + 1);
    uint64_t v11 = v21;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
  }
  char v13 = v8 ^ 1;
  if (a2)
  {
    if (a3)
    {
      if (a3 < 0) {
        __break(1u);
      }
      uint64_t v14 = 0;
      if (v8)
      {
        while (1)
        {
          *(void *)&long long v20 = v9;
          *((void *)&v20 + 1) = v10;
          *(void *)&long long v21 = v11;
          *((void *)&v21 + 1) = v12;
          if (__swift_device_tree_node_children_iterator_end(_:)((unint64_t *)&v20)
            || (unint64_t v18 = 0,
                unint64_t v19 = 0,
                (__swift_device_tree_node_children_iterator_node(_:_:)((unint64_t *)&v20, &v18) & 1) == 0))
          {
            uint64_t v10 = *((void *)&v20 + 1);
            uint64_t v9 = v20;
            uint64_t v12 = *((void *)&v21 + 1);
            uint64_t v11 = v21;
            goto LABEL_14;
          }
          unint64_t v15 = v18;
          unint64_t v16 = v19;
          __swift_device_tree_node_children_iterator_next(_:)((unint64_t *)&v20);
          uint64_t v10 = *((void *)&v20 + 1);
          uint64_t v9 = v20;
          uint64_t v12 = *((void *)&v21 + 1);
          uint64_t v11 = v21;
          *a2 = v15;
          a2[1] = v16;
          if (a3 - 1 == v14) {
            break;
          }
          char v13 = 0;
          ++v14;
          a2 += 2;
        }
        char v13 = 0;
      }
      else
      {
LABEL_14:
        a3 = v14;
      }
    }
  }
  else
  {
    a3 = 0;
  }
  *(void *)a1 = v9;
  *(void *)(a1 + 8) = v10;
  *(void *)(a1 + 16) = v11;
  *(void *)(a1 + 24) = v12;
  *(unsigned char *)(a1 + 32) = v13 & 1;
  return a3;
}

uint64_t specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return swift_bridgeObjectRelease();
  }
  for (unint64_t i = (uint64_t *)(swift_bridgeObjectRetain() + 48); ; i += 3)
  {
    uint64_t v6 = *(i - 2);
    uint64_t v7 = *(i - 1);
    uint64_t v8 = *i;
    uint64_t v9 = (void *)*a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v11 = specialized __RawDictionaryStorage.find<A>(_:)(v6, v7);
    uint64_t v12 = v9[2];
    BOOL v13 = (v10 & 1) == 0;
    uint64_t v14 = v12 + v13;
    if (__OFADD__(v12, v13))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
      goto LABEL_20;
    }
    char v15 = v10;
    if (v9[3] < v14) {
      break;
    }
    if (a2)
    {
      if (v10) {
        goto LABEL_14;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, [UInt8]>);
      _NativeDictionary.copy()();
      if (v15) {
        goto LABEL_14;
      }
    }
LABEL_10:
    unint64_t v18 = (void *)*a3;
    *(void *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    unint64_t v19 = (uint64_t *)(v18[6] + 16 * v11);
    *unint64_t v19 = v6;
    v19[1] = v7;
    *(void *)(v18[7] + 8 * v11) = v8;
    uint64_t v20 = v18[2];
    BOOL v21 = __OFADD__(v20, 1);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_18;
    }
    v18[2] = v22;
    a2 = 1;
    if (!--v3) {
      return swift_bridgeObjectRelease_n();
    }
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v14, a2 & 1);
  unint64_t v16 = specialized __RawDictionaryStorage.find<A>(_:)(v6, v7);
  if ((v15 & 1) != (v17 & 1)) {
    goto LABEL_19;
  }
  unint64_t v11 = v16;
  if ((v15 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_14:
  lazy protocol witness table accessor for type DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError and conformance DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError();
  swift_allocError();
  *unint64_t v23 = 0;
  swift_willThrow();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_release();
  }
LABEL_20:
  _StringGuts.grow(_:)(30);
  v25._object = (void *)0x800000024CD23130;
  v25._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v25);
  _print_unlocked<A, B>(_:_:)();
  v26._countAndFlagsBits = 39;
  v26._object = (void *)0xE100000000000000;
  String.append(_:)(v26);
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, [UInt8]>);
  char v36 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  if (!v10) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v13 << 6))
  {
    uint64_t v20 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
    uint64_t v22 = *v20;
    uint64_t v21 = v20[1];
    uint64_t v23 = *(void *)(*(void *)(v5 + 56) + 8 * i);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v24 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1 << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) == 0)
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v24) >> 6;
      while (++v26 != v29 || (v28 & 1) == 0)
      {
        BOOL v30 = v26 == v29;
        if (v26 == v29) {
          unint64_t v26 = 0;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v11 + 8 * v26);
        if (v31 != -1)
        {
          unint64_t v27 = __clz(__rbit64(~v31)) + (v26 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    unint64_t v27 = __clz(__rbit64((-1 << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v11 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    uint64_t v32 = (void *)(*(void *)(v7 + 48) + 16 * v27);
    *uint64_t v32 = v22;
    v32[1] = v21;
    *(void *)(*(void *)(v7 + 56) + 8 * v27) = v23;
    ++*(void *)(v7 + 16);
    if (v10) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      goto LABEL_41;
    }
    if (v16 >= v34)
    {
      swift_release();
      char v17 = (void *)(v5 + 64);
      goto LABEL_34;
    }
    char v17 = (void *)(v5 + 64);
    unint64_t v18 = *(void *)(v35 + 8 * v16);
    ++v13;
    if (!v18)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v34) {
        goto LABEL_32;
      }
      unint64_t v18 = *(void *)(v35 + 8 * v13);
      if (!v18) {
        break;
      }
    }
LABEL_18:
    unint64_t v10 = (v18 - 1) & v18;
  }
  int64_t v19 = v16 + 2;
  if (v19 < v34)
  {
    unint64_t v18 = *(void *)(v35 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        int64_t v13 = v19 + 1;
        if (__OFADD__(v19, 1)) {
          goto LABEL_42;
        }
        if (v13 >= v34) {
          goto LABEL_32;
        }
        unint64_t v18 = *(void *)(v35 + 8 * v13);
        ++v19;
        if (v18) {
          goto LABEL_18;
        }
      }
    }
    int64_t v13 = v19;
    goto LABEL_18;
  }
LABEL_32:
  swift_release();
LABEL_34:
  if (v36)
  {
    uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
    if (v33 >= 64) {
      specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(v33 + 63) >> 6, v17);
    }
    else {
      *char v17 = -1 << v33;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t specialized UnsafeMutablePointer.assign(repeating:count:)(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t specialized closure #1 in Collection<>.split(separator:maxSplits:omittingEmptySubsequences:)(uint64_t *a1, uint64_t *a2)
{
  return specialized closure #1 in Collection<>.split(separator:maxSplits:omittingEmptySubsequences:)(*a1, a1[1], *a2, a2[1]) & 1;
}

uint64_t partial apply for specialized closure #1 in Collection<>.split(separator:maxSplits:omittingEmptySubsequences:)(uint64_t *a1)
{
  return specialized closure #1 in Collection<>.split(separator:maxSplits:omittingEmptySubsequences:)(a1, *(uint64_t **)(v1 + 16)) & 1;
}

unint64_t lazy protocol witness table accessor for type UnsafeBufferPointer<UInt8> and conformance UnsafeBufferPointer<A>(uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_35(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

uint64_t outlined init with take of device_tree_node_property_iterator?(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type DeviceTreeNodeRepresentation.CodingKeys and conformance DeviceTreeNodeRepresentation.CodingKeys()
{
  unint64_t result = lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation.CodingKeys and conformance DeviceTreeNodeRepresentation.CodingKeys;
  if (!lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation.CodingKeys and conformance DeviceTreeNodeRepresentation.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation.CodingKeys and conformance DeviceTreeNodeRepresentation.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation.CodingKeys and conformance DeviceTreeNodeRepresentation.CodingKeys;
  if (!lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation.CodingKeys and conformance DeviceTreeNodeRepresentation.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation.CodingKeys and conformance DeviceTreeNodeRepresentation.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation.CodingKeys and conformance DeviceTreeNodeRepresentation.CodingKeys;
  if (!lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation.CodingKeys and conformance DeviceTreeNodeRepresentation.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation.CodingKeys and conformance DeviceTreeNodeRepresentation.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation.CodingKeys and conformance DeviceTreeNodeRepresentation.CodingKeys;
  if (!lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation.CodingKeys and conformance DeviceTreeNodeRepresentation.CodingKeys)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation.CodingKeys and conformance DeviceTreeNodeRepresentation.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [DeviceTreeNodeRepresentation] and conformance <A> [A](uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_35(a1);
  if (!result)
  {
    uint64_t v4 = v3;
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [DeviceTreeNodeRepresentation]);
    v4();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type DeviceTreeNodeRepresentation and conformance DeviceTreeNodeRepresentation()
{
  unint64_t result = lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation and conformance DeviceTreeNodeRepresentation;
  if (!lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation and conformance DeviceTreeNodeRepresentation)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation and conformance DeviceTreeNodeRepresentation);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation and conformance DeviceTreeNodeRepresentation;
  if (!lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation and conformance DeviceTreeNodeRepresentation)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation and conformance DeviceTreeNodeRepresentation);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t associated type witness table accessor for Identifiable.ID : Hashable in DeviceTreeNode()
{
  return lazy protocol witness table accessor for type [UInt8] and conformance <A> [A]((uint64_t)&lazy protocol witness table cache variable for type UnsafeRawPointer? and conformance <A> A?);
}

unint64_t lazy protocol witness table accessor for type [UInt8] and conformance <A> [A](uint64_t a1)
{
  unint64_t result = OUTLINED_FUNCTION_35(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(v3);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type DeviceTreeNode and conformance DeviceTreeNode()
{
  unint64_t result = lazy protocol witness table cache variable for type DeviceTreeNode and conformance DeviceTreeNode;
  if (!lazy protocol witness table cache variable for type DeviceTreeNode and conformance DeviceTreeNode)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DeviceTreeNode and conformance DeviceTreeNode);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type DeviceTreeNodePathIterator and conformance DeviceTreeNodePathIterator()
{
  unint64_t result = lazy protocol witness table cache variable for type DeviceTreeNodePathIterator and conformance DeviceTreeNodePathIterator;
  if (!lazy protocol witness table cache variable for type DeviceTreeNodePathIterator and conformance DeviceTreeNodePathIterator)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DeviceTreeNodePathIterator and conformance DeviceTreeNodePathIterator);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type DeviceTreeNodePropertyIterator and conformance DeviceTreeNodePropertyIterator()
{
  unint64_t result = lazy protocol witness table cache variable for type DeviceTreeNodePropertyIterator and conformance DeviceTreeNodePropertyIterator;
  if (!lazy protocol witness table cache variable for type DeviceTreeNodePropertyIterator and conformance DeviceTreeNodePropertyIterator)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DeviceTreeNodePropertyIterator and conformance DeviceTreeNodePropertyIterator);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type DeviceTreeNodeChildrenIterator and conformance DeviceTreeNodeChildrenIterator()
{
  unint64_t result = lazy protocol witness table cache variable for type DeviceTreeNodeChildrenIterator and conformance DeviceTreeNodeChildrenIterator;
  if (!lazy protocol witness table cache variable for type DeviceTreeNodeChildrenIterator and conformance DeviceTreeNodeChildrenIterator)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DeviceTreeNodeChildrenIterator and conformance DeviceTreeNodeChildrenIterator);
  }
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DeviceTree(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return OUTLINED_FUNCTION_7(*(_DWORD *)a1);
  }
  else {
    return OUTLINED_FUNCTION_27();
  }
}

uint64_t storeEnumTagSinglePayload for DeviceTree(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for DeviceTree()
{
}

void type metadata accessor for DeviceTreeNode()
{
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DeviceTreeNodePath(uint64_t a1, int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_7(-1);
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 8)) {
    return OUTLINED_FUNCTION_7(*(_DWORD *)a1 + 1);
  }
  if (*(void *)a1) {
    return OUTLINED_FUNCTION_7(-1);
  }
  else {
    return OUTLINED_FUNCTION_7(0);
  }
}

uint64_t storeEnumTagSinglePayload for DeviceTreeNodePath(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)__n128 result = a2 - 2;
    if (a3 >= 2) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)__n128 result = 0;
    }
  }
  return result;
}

void type metadata accessor for DeviceTreeNodePath()
{
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for DeviceTreeNodePathIterator(uint64_t a1, int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_7(-1);
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 24)) {
    return OUTLINED_FUNCTION_7(*(_DWORD *)a1 + 1);
  }
  if (*(void *)a1) {
    return OUTLINED_FUNCTION_7(-1);
  }
  else {
    return OUTLINED_FUNCTION_7(0);
  }
}

uint64_t storeEnumTagSinglePayload for DeviceTreeNodePathIterator(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 2;
    if (a3 >= 2) {
      *(unsigned char *)(result + 24) = 1;
    }
  }
  else
  {
    if (a3 >= 2) {
      *(unsigned char *)(result + 24) = 0;
    }
    if (a2) {
      *(void *)__n128 result = 0;
    }
  }
  return result;
}

void type metadata accessor for DeviceTreeNodePathIterator()
{
}

void type metadata accessor for DeviceTreeNodeProperties()
{
}

uint64_t initializeBufferWithCopyOfBuffer for DeviceTreeNodeProperty(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for DeviceTreeNodeProperty(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return OUTLINED_FUNCTION_7(*(_DWORD *)a1);
  }
  else {
    return OUTLINED_FUNCTION_27();
  }
}

uint64_t storeEnumTagSinglePayload for DeviceTreeNodeProperty(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for DeviceTreeNodeProperty()
{
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(unsigned char *)(a1 + 32) = *(unsigned char *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void type metadata accessor for DeviceTreeNodePropertyIterator()
{
}

void type metadata accessor for DeviceTreeNodeChildren()
{
}

uint64_t getEnumTagSinglePayload for DeviceTreeNodeChildrenIterator(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 33)) {
    return OUTLINED_FUNCTION_7(*(_DWORD *)a1);
  }
  else {
    return OUTLINED_FUNCTION_27();
  }
}

uint64_t storeEnumTagSinglePayload for DeviceTreeNodeChildrenIterator(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(unsigned char *)(result + 32) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 33) = v3;
  return result;
}

void type metadata accessor for DeviceTreeNodeChildrenIterator()
{
}

uint64_t destroy for DeviceTreeNodeRepresentation(uint64_t a1)
{
  OUTLINED_FUNCTION_35(a1);
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeBufferWithCopyOfBuffer for DeviceTreeNodeRepresentation(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for DeviceTreeNodeRepresentation(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for DeviceTreeNodeRepresentation(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DeviceTreeNodeRepresentation(uint64_t *a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *((unsigned char *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      uint64_t v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DeviceTreeNodeRepresentation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

void type metadata accessor for DeviceTreeNodeRepresentation()
{
}

void type metadata accessor for device_tree_node(uint64_t a1)
{
}

uint64_t getEnumTagSinglePayload for device_tree(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

void type metadata accessor for device_tree(uint64_t a1)
{
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

void type metadata accessor for DeviceTreeNodeRepresentation.CodingKeys()
{
}

uint64_t getEnumTagSinglePayload for device_tree_node_children_iterator(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

void type metadata accessor for device_tree_node_children_iterator(uint64_t a1)
{
}

void type metadata accessor for device_tree_node_property_iterator(uint64_t a1)
{
}

void type metadata accessor for device_tree_node(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t lazy protocol witness table accessor for type DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError and conformance DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError()
{
  unint64_t result = lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError and conformance DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError;
  if (!lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError and conformance DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError and conformance DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError and conformance DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError;
  if (!lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError and conformance DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError and conformance DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type UInt8 and conformance UInt8()
{
  unint64_t result = lazy protocol witness table cache variable for type UInt8 and conformance UInt8;
  if (!lazy protocol witness table cache variable for type UInt8 and conformance UInt8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UInt8 and conformance UInt8);
  }
  return result;
}

uint64_t sub_24CD21DB8()
{
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_24CD21DF0()
{
  return OUTLINED_FUNCTION_12(v0, 24);
}

uint64_t getEnumTagSinglePayload for DeviceTreeNodeRepresentation.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return OUTLINED_FUNCTION_7(-1);
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return OUTLINED_FUNCTION_7((*a1 | (v4 << 8)) - 2);
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return OUTLINED_FUNCTION_7((*a1 | (v4 << 8)) - 2);
    }
    int v4 = a1[1];
    if (a1[1]) {
      return OUTLINED_FUNCTION_7((*a1 | (v4 << 8)) - 2);
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return OUTLINED_FUNCTION_7(v8);
}

unsigned char *storeEnumTagSinglePayload for DeviceTreeNodeRepresentation.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x24CD21F4CLL);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t getEnumTag for DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *destructiveInjectEnumTag for DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

void type metadata accessor for DeviceTreeNodeRepresentation.DeviceTreeNodeRepresentationError()
{
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9D640](a1, a2, 1, v2, a2, v3);
}

int8x16_t OUTLINED_FUNCTION_3(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int8x16_t a9, int8x16_t a10)
{
  if (a1) {
    unint64_t v11 = -1;
  }
  else {
    unint64_t v11 = 0;
  }
  int8x16_t v12 = (int8x16_t)vdupq_n_s64(v11);
  int8x16_t result = vandq_s8(a9, v12);
  int8x16_t *v10 = result;
  v10[1] = vandq_s8(a10, v12);
  v10[2].i8[0] = (a1 & 1) == 0;
  return result;
}

BOOL OUTLINED_FUNCTION_5@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

void OUTLINED_FUNCTION_6()
{
  uint64_t v1 = 0x20666F2074756F20;
  unint64_t v2 = 0xEE0073646E756F62;
  String.append(_:)(*(Swift::String *)&v1);
}

uint64_t OUTLINED_FUNCTION_7@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

uint64_t OUTLINED_FUNCTION_8(uint64_t result)
{
  *(unsigned char *)(v1 + 16) = (result & 1) == 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  return MEMORY[0x270F9D640](va, v10, 1, v9, v10, v11);
}

uint64_t OUTLINED_FUNCTION_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  return MEMORY[0x270F9D640](va, v7, 1, v5, v7, v6);
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1)
{
  return MEMORY[0x270F9F458](v3 - 72, v3 - 81, v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_12(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA0238](a1, a2, 7);
}

uint64_t OUTLINED_FUNCTION_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9D968](a1, a2, a4, a3);
}

uint64_t OUTLINED_FUNCTION_14()
{
  return 0;
}

__n128 OUTLINED_FUNCTION_15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, __n128 a10, long long a11, char a12)
{
  __n128 result = a10;
  *(__n128 *)uint64_t v12 = a10;
  *(_OWORD *)(v12 + 16) = a11;
  *(unsigned char *)(v12 + 32) = a12;
  return result;
}

double OUTLINED_FUNCTION_16(char a1, int8x16_t a2)
{
  if (a1) {
    unint64_t v2 = -1;
  }
  else {
    unint64_t v2 = 0;
  }
  *(void *)&double result = vandq_s8(a2, (int8x16_t)vdupq_n_s64(v2)).u64[0];
  return result;
}

uint64_t OUTLINED_FUNCTION_17()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

void OUTLINED_FUNCTION_18()
{
  *(void *)uint64_t v0 = 0;
  *(void *)(v0 + 8) = 0;
  *(unsigned char *)(v0 + 16) = 1;
}

uint64_t OUTLINED_FUNCTION_19()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_21()
{
  *(_OWORD *)(v1 - 144) = 0u;
  *(_OWORD *)(v1 - 128) = 0u;
  return v0;
}

uint64_t OUTLINED_FUNCTION_22()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t OUTLINED_FUNCTION_23()
{
  return BidirectionalCollection<>.joined(separator:)();
}

void OUTLINED_FUNCTION_24()
{
  uint64_t v1 = 3026478;
  unint64_t v2 = 0xE300000000000000;
  String.append(_:)(*(Swift::String *)&v1);
}

void OUTLINED_FUNCTION_25()
{
  _StringGuts.grow(_:)(22);
}

void OUTLINED_FUNCTION_26(__n128 *a1@<X8>, __n128 a2@<Q0>)
{
  *a1 = a2;
}

uint64_t OUTLINED_FUNCTION_27()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_28()
{
  return 2;
}

uint64_t OUTLINED_FUNCTION_30()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return v0;
}

uint64_t OUTLINED_FUNCTION_32()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return 0;
}

double OUTLINED_FUNCTION_34()
{
  double result = 0.0;
  *(_OWORD *)uint64_t v0 = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(unsigned char *)(v0 + 32) = 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_35(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t Character.write<A>(to:)()
{
  return MEMORY[0x270F9D3C8]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x270F9D478]();
}

uint64_t String.init<A>(reflecting:)()
{
  return MEMORY[0x270F9D600]();
}

uint64_t static String._fromSubstring(_:)()
{
  return MEMORY[0x270F9D648]();
}

uint64_t static String._uncheckedFromUTF8(_:)()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x270F9D708]();
}

uint64_t String.index(after:)()
{
  return MEMORY[0x270F9D748]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init<A>(_:radix:uppercase:)()
{
  return MEMORY[0x270F9D8A8]();
}

uint64_t String.subscript.getter()
{
  return MEMORY[0x270F9D8B0]();
}

{
  return MEMORY[0x270F9D8F0]();
}

uint64_t UnsafeRawBufferPointer.init(start:count:)()
{
  return MEMORY[0x270F9DA48]();
}

uint64_t BinaryInteger.description.getter()
{
  return MEMORY[0x270F9E658]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x270F9ED70]();
}

Swift::Void __swiftcall _NativeDictionary.copy()()
{
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x270F9F318]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x270F9FC48]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x270F9FD98]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void abort(void)
{
}

int isprint(int _c)
{
  return MEMORY[0x270ED9F10](*(void *)&_c);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}