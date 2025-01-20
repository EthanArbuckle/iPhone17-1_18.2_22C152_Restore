uint64_t sub_2487D5318()
{
  uint64_t v0;

  return v0 + 16;
}

uint64_t _sa_retain_n()
{
  return MEMORY[0x270FA0538]();
}

uint64_t _sa_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t Int8.AtomicRepresentation._storage.setter(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*Int8.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

unsigned char *sub_2487D535C@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_2487D5368(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t Int16.AtomicRepresentation._storage.setter(uint64_t result)
{
  _WORD *v1 = result;
  return result;
}

uint64_t (*Int16.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

_WORD *sub_2487D53D0@<X0>(_WORD *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_2487D53DC(_WORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t Int32.AtomicRepresentation._storage.setter(uint64_t result)
{
  _DWORD *v1 = result;
  return result;
}

uint64_t (*Int32.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

_DWORD *sub_2487D5444@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_2487D5450(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t Int64.AtomicRepresentation._storage.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*Int64.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

unint64_t *sub_2487D54B8@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_2487D7410(result, a2, a3);
}

unint64_t *sub_2487D54C0(unint64_t *result, unint64_t *a2, uint64_t a3)
{
  return sub_2487D74A0(result, a2, a3);
}

unint64_t *sub_2487D54C8@<X0>(unint64_t *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_2487D7528(result, a2, a3, a4);
}

BOOL sub_2487D54D0(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5)
{
  return sub_2487D75F4(a1, a2, a3, a4, a5);
}

BOOL sub_2487D54D8(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5, uint64_t a6)
{
  return sub_2487D76E0(a1, a2, a3, a4, a5, a6);
}

BOOL sub_2487D5504(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5, uint64_t a6)
{
  return sub_2487D7828(a1, a2, a3, a4, a5, a6);
}

unint64_t *sub_2487D5530@<X0>(unint64_t *result@<X0>, atomic_ullong *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_2487D7970(result, a2, a3, a4);
}

uint64_t *sub_2487D5538@<X0>(uint64_t *result@<X0>, atomic_ullong *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_2487D7A3C(result, a2, a3, a4);
}

unint64_t *sub_2487D5540@<X0>(unint64_t *result@<X0>, atomic_ullong *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_2487D7B18(result, a2, a3, a4);
}

unint64_t *sub_2487D5548@<X0>(unint64_t *result@<X0>, atomic_ullong *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_2487D7BF4(result, a2, a3, a4);
}

unint64_t *sub_2487D5550@<X0>(unint64_t *result@<X0>, atomic_ullong *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_2487D7CC0(result, a2, a3, a4);
}

uint64_t UInt8.AtomicRepresentation._storage.setter(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*UInt8.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

unsigned __int8 *sub_2487D5588@<X0>(unsigned __int8 *result@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X8>)
{
  switch(a2)
  {
    case 5:
      unsigned __int8 explicit = atomic_load(result);
      goto LABEL_7;
    case 2:
      unsigned __int8 explicit = atomic_load_explicit((atomic_uchar *volatile)result, memory_order_acquire);
LABEL_7:
      *a3 = explicit;
      return result;
    case 0:
      unsigned __int8 explicit = *result;
      goto LABEL_7;
  }
  result = (unsigned __int8 *)sub_2487E4C50();
  __break(1u);
  return result;
}

unsigned __int8 *sub_2487D561C(unsigned __int8 *result, unsigned __int8 *a2, uint64_t a3)
{
  unsigned __int8 v3 = *result;
  if (a3 == 5 || a3 == 3)
  {
    atomic_store(v3, a2);
  }
  else if (a3)
  {
    result = (unsigned __int8 *)sub_2487E4C50();
    __break(1u);
  }
  else
  {
    *a2 = v3;
  }
  return result;
}

unsigned __int8 *sub_2487D56A8@<X0>(unsigned __int8 *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X8>)
{
  unsigned int v4 = *result;
  switch(a3)
  {
    case 0:
      unsigned __int8 v5 = __swp(v4, a2);
      break;
    case 2:
      unsigned __int8 v5 = atomic_exchange_explicit((atomic_uchar *volatile)a2, v4, memory_order_acquire);
      break;
    case 3:
      unsigned __int8 v5 = atomic_exchange_explicit((atomic_uchar *volatile)a2, v4, memory_order_release);
      break;
    case 4:
    case 5:
      unsigned __int8 v5 = atomic_exchange((atomic_uchar *volatile)a2, v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D5760);
  }
  *a4 = v5;
  return result;
}

BOOL sub_2487D5778(unsigned char *a1, unsigned __int8 *a2, unsigned __int8 *a3, atomic_uchar *a4, uint64_t a5)
{
  int v5 = *a2;
  unsigned __int8 v6 = *a3;
  switch(a5)
  {
    case 0:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v7, v6, memory_order_relaxed, memory_order_relaxed);
      break;
    case 2:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v7, v6, memory_order_acquire, memory_order_acquire);
      break;
    case 3:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v7, v6, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      int v7 = *a2;
      atomic_compare_exchange_strong(a4, (unsigned __int8 *)&v7, v6);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D5850);
  }
  *a1 = v7;
  return v7 == v5;
}

BOOL sub_2487D5868(unsigned char *a1, unsigned __int8 *a2, unsigned __int8 *a3, atomic_uchar *a4, uint64_t a5, uint64_t a6)
{
  int v6 = *a2;
  unsigned __int8 v7 = *a3;
  switch(a5)
  {
    case 0:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 == 2) {
        goto LABEL_12;
      }
      if (a6) {
        goto LABEL_21;
      }
      int v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v8, v7, memory_order_relaxed, memory_order_relaxed);
      break;
    case 2:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 != 2 && a6) {
        goto LABEL_21;
      }
LABEL_12:
      int v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v8, v7, memory_order_acquire, memory_order_acquire);
      break;
    case 3:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_15;
      }
      if (a6) {
        goto LABEL_21;
      }
      int v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v8, v7, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      if (a6 != 5 && a6 != 2 && a6) {
        goto LABEL_21;
      }
LABEL_15:
      int v8 = *a2;
      atomic_compare_exchange_strong(a4, (unsigned __int8 *)&v8, v7);
      break;
    default:
LABEL_21:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D5998);
  }
  *a1 = v8;
  return v8 == v6;
}

BOOL sub_2487D59B0(unsigned char *a1, unsigned __int8 *a2, unsigned __int8 *a3, atomic_uchar *a4, uint64_t a5, uint64_t a6)
{
  int v6 = *a2;
  unsigned __int8 v7 = *a3;
  switch(a5)
  {
    case 0:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 == 2) {
        goto LABEL_12;
      }
      if (a6) {
        goto LABEL_21;
      }
      int v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v8, v7, memory_order_relaxed, memory_order_relaxed);
      break;
    case 2:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 != 2 && a6) {
        goto LABEL_21;
      }
LABEL_12:
      int v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v8, v7, memory_order_acquire, memory_order_acquire);
      break;
    case 3:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_15;
      }
      if (a6) {
        goto LABEL_21;
      }
      int v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v8, v7, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      if (a6 != 5 && a6 != 2 && a6) {
        goto LABEL_21;
      }
LABEL_15:
      int v8 = *a2;
      atomic_compare_exchange_strong(a4, (unsigned __int8 *)&v8, v7);
      break;
    default:
LABEL_21:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D5AE0);
  }
  *a1 = v8;
  return v8 == v6;
}

unsigned __int8 *sub_2487D5AF8@<X0>(unsigned __int8 *result@<X0>, atomic_uchar *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X8>)
{
  unsigned __int8 v4 = *result;
  switch(a3)
  {
    case 0:
      add_unsigned __int8 explicit = atomic_fetch_add_explicit(a2, v4, memory_order_relaxed);
      break;
    case 2:
      add_unsigned __int8 explicit = atomic_fetch_add_explicit(a2, v4, memory_order_acquire);
      break;
    case 3:
      add_unsigned __int8 explicit = atomic_fetch_add_explicit(a2, v4, memory_order_release);
      break;
    case 4:
    case 5:
      add_unsigned __int8 explicit = atomic_fetch_add(a2, v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D5BB0);
  }
  *a4 = add_explicit;
  return result;
}

char *sub_2487D5BC8@<X0>(char *result@<X0>, atomic_uchar *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X8>)
{
  char v4 = *result;
  switch(a3)
  {
    case 0:
      add_unsigned __int8 explicit = atomic_fetch_add_explicit(a2, -v4, memory_order_relaxed);
      break;
    case 2:
      add_unsigned __int8 explicit = atomic_fetch_add_explicit(a2, -v4, memory_order_acquire);
      break;
    case 3:
      add_unsigned __int8 explicit = atomic_fetch_add_explicit(a2, -v4, memory_order_release);
      break;
    case 4:
    case 5:
      add_unsigned __int8 explicit = atomic_fetch_add(a2, -v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D5C90);
  }
  *a4 = add_explicit;
  return result;
}

unsigned __int8 *sub_2487D5CA8@<X0>(unsigned __int8 *result@<X0>, atomic_uchar *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X8>)
{
  unsigned __int8 v4 = *result;
  switch(a3)
  {
    case 0:
      unsigned __int8 v5 = atomic_fetch_and_explicit(a2, v4, memory_order_relaxed);
      break;
    case 2:
      unsigned __int8 v5 = atomic_fetch_and_explicit(a2, v4, memory_order_acquire);
      break;
    case 3:
      unsigned __int8 v5 = atomic_fetch_and_explicit(a2, v4, memory_order_release);
      break;
    case 4:
    case 5:
      unsigned __int8 v5 = atomic_fetch_and(a2, v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D5D70);
  }
  *a4 = v5;
  return result;
}

unsigned __int8 *sub_2487D5D88@<X0>(unsigned __int8 *result@<X0>, atomic_uchar *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X8>)
{
  unsigned __int8 v4 = *result;
  switch(a3)
  {
    case 0:
      unsigned __int8 v5 = atomic_fetch_or_explicit(a2, v4, memory_order_relaxed);
      break;
    case 2:
      unsigned __int8 v5 = atomic_fetch_or_explicit(a2, v4, memory_order_acquire);
      break;
    case 3:
      unsigned __int8 v5 = atomic_fetch_or_explicit(a2, v4, memory_order_release);
      break;
    case 4:
    case 5:
      unsigned __int8 v5 = atomic_fetch_or(a2, v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D5E40);
  }
  *a4 = v5;
  return result;
}

unsigned __int8 *sub_2487D5E58@<X0>(unsigned __int8 *result@<X0>, atomic_uchar *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X8>)
{
  unsigned __int8 v4 = *result;
  switch(a3)
  {
    case 0:
      xor_unsigned __int8 explicit = atomic_fetch_xor_explicit(a2, v4, memory_order_relaxed);
      break;
    case 2:
      xor_unsigned __int8 explicit = atomic_fetch_xor_explicit(a2, v4, memory_order_acquire);
      break;
    case 3:
      xor_unsigned __int8 explicit = atomic_fetch_xor_explicit(a2, v4, memory_order_release);
      break;
    case 4:
    case 5:
      xor_unsigned __int8 explicit = atomic_fetch_xor(a2, v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D5F10);
  }
  *a4 = xor_explicit;
  return result;
}

uint64_t UInt16.AtomicRepresentation._storage.setter(uint64_t result)
{
  _WORD *v1 = result;
  return result;
}

uint64_t (*UInt16.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

unsigned __int16 *sub_2487D5F58@<X0>(unsigned __int16 *result@<X0>, uint64_t a2@<X1>, unsigned __int16 *a3@<X8>)
{
  switch(a2)
  {
    case 5:
      unsigned __int16 explicit = atomic_load(result);
      goto LABEL_7;
    case 2:
      unsigned __int16 explicit = atomic_load_explicit((atomic_ushort *volatile)result, memory_order_acquire);
LABEL_7:
      *a3 = explicit;
      return result;
    case 0:
      unsigned __int16 explicit = *result;
      goto LABEL_7;
  }
  result = (unsigned __int16 *)sub_2487E4C50();
  __break(1u);
  return result;
}

unsigned __int16 *sub_2487D5FEC(unsigned __int16 *result, unsigned __int16 *a2, uint64_t a3)
{
  unsigned __int16 v3 = *result;
  if (a3 == 5 || a3 == 3)
  {
    atomic_store(v3, a2);
  }
  else if (a3)
  {
    result = (unsigned __int16 *)sub_2487E4C50();
    __break(1u);
  }
  else
  {
    *a2 = v3;
  }
  return result;
}

unsigned __int16 *sub_2487D6078@<X0>(unsigned __int16 *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unsigned __int16 *a4@<X8>)
{
  unsigned int v4 = *result;
  switch(a3)
  {
    case 0:
      unsigned __int16 v5 = __swp(v4, a2);
      break;
    case 2:
      unsigned __int16 v5 = atomic_exchange_explicit((atomic_ushort *volatile)a2, v4, memory_order_acquire);
      break;
    case 3:
      unsigned __int16 v5 = atomic_exchange_explicit((atomic_ushort *volatile)a2, v4, memory_order_release);
      break;
    case 4:
    case 5:
      unsigned __int16 v5 = atomic_exchange((atomic_ushort *volatile)a2, v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D6130);
  }
  *a4 = v5;
  return result;
}

BOOL sub_2487D6148(_WORD *a1, unsigned __int16 *a2, unsigned __int16 *a3, atomic_ushort *a4, uint64_t a5)
{
  int v5 = *a2;
  unsigned __int16 v6 = *a3;
  switch(a5)
  {
    case 0:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int16 *)&v7, v6, memory_order_relaxed, memory_order_relaxed);
      break;
    case 2:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int16 *)&v7, v6, memory_order_acquire, memory_order_acquire);
      break;
    case 3:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int16 *)&v7, v6, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      int v7 = *a2;
      atomic_compare_exchange_strong(a4, (unsigned __int16 *)&v7, v6);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D6220);
  }
  *a1 = v7;
  return v7 == v5;
}

BOOL sub_2487D6238(_WORD *a1, unsigned __int16 *a2, unsigned __int16 *a3, atomic_ushort *a4, uint64_t a5, uint64_t a6)
{
  int v6 = *a2;
  unsigned __int16 v7 = *a3;
  switch(a5)
  {
    case 0:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 == 2) {
        goto LABEL_12;
      }
      if (a6) {
        goto LABEL_21;
      }
      int v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int16 *)&v8, v7, memory_order_relaxed, memory_order_relaxed);
      break;
    case 2:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 != 2 && a6) {
        goto LABEL_21;
      }
LABEL_12:
      int v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int16 *)&v8, v7, memory_order_acquire, memory_order_acquire);
      break;
    case 3:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_15;
      }
      if (a6) {
        goto LABEL_21;
      }
      int v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int16 *)&v8, v7, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      if (a6 != 5 && a6 != 2 && a6) {
        goto LABEL_21;
      }
LABEL_15:
      int v8 = *a2;
      atomic_compare_exchange_strong(a4, (unsigned __int16 *)&v8, v7);
      break;
    default:
LABEL_21:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D6368);
  }
  *a1 = v8;
  return v8 == v6;
}

BOOL sub_2487D6380(_WORD *a1, unsigned __int16 *a2, unsigned __int16 *a3, atomic_ushort *a4, uint64_t a5, uint64_t a6)
{
  int v6 = *a2;
  unsigned __int16 v7 = *a3;
  switch(a5)
  {
    case 0:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 == 2) {
        goto LABEL_12;
      }
      if (a6) {
        goto LABEL_21;
      }
      int v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int16 *)&v8, v7, memory_order_relaxed, memory_order_relaxed);
      break;
    case 2:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 != 2 && a6) {
        goto LABEL_21;
      }
LABEL_12:
      int v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int16 *)&v8, v7, memory_order_acquire, memory_order_acquire);
      break;
    case 3:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_15;
      }
      if (a6) {
        goto LABEL_21;
      }
      int v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int16 *)&v8, v7, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      if (a6 != 5 && a6 != 2 && a6) {
        goto LABEL_21;
      }
LABEL_15:
      int v8 = *a2;
      atomic_compare_exchange_strong(a4, (unsigned __int16 *)&v8, v7);
      break;
    default:
LABEL_21:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D64B0);
  }
  *a1 = v8;
  return v8 == v6;
}

unsigned __int16 *sub_2487D64C8@<X0>(unsigned __int16 *result@<X0>, atomic_ushort *a2@<X1>, uint64_t a3@<X2>, unsigned __int16 *a4@<X8>)
{
  unsigned __int16 v4 = *result;
  switch(a3)
  {
    case 0:
      add_unsigned __int16 explicit = atomic_fetch_add_explicit(a2, v4, memory_order_relaxed);
      break;
    case 2:
      add_unsigned __int16 explicit = atomic_fetch_add_explicit(a2, v4, memory_order_acquire);
      break;
    case 3:
      add_unsigned __int16 explicit = atomic_fetch_add_explicit(a2, v4, memory_order_release);
      break;
    case 4:
    case 5:
      add_unsigned __int16 explicit = atomic_fetch_add(a2, v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D6580);
  }
  *a4 = add_explicit;
  return result;
}

__int16 *sub_2487D6598@<X0>(__int16 *result@<X0>, atomic_ushort *a2@<X1>, uint64_t a3@<X2>, unsigned __int16 *a4@<X8>)
{
  __int16 v4 = *result;
  switch(a3)
  {
    case 0:
      add_unsigned __int16 explicit = atomic_fetch_add_explicit(a2, -v4, memory_order_relaxed);
      break;
    case 2:
      add_unsigned __int16 explicit = atomic_fetch_add_explicit(a2, -v4, memory_order_acquire);
      break;
    case 3:
      add_unsigned __int16 explicit = atomic_fetch_add_explicit(a2, -v4, memory_order_release);
      break;
    case 4:
    case 5:
      add_unsigned __int16 explicit = atomic_fetch_add(a2, -v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D6660);
  }
  *a4 = add_explicit;
  return result;
}

unsigned __int16 *sub_2487D6678@<X0>(unsigned __int16 *result@<X0>, atomic_ushort *a2@<X1>, uint64_t a3@<X2>, unsigned __int16 *a4@<X8>)
{
  unsigned __int16 v4 = *result;
  switch(a3)
  {
    case 0:
      unsigned __int16 v5 = atomic_fetch_and_explicit(a2, v4, memory_order_relaxed);
      break;
    case 2:
      unsigned __int16 v5 = atomic_fetch_and_explicit(a2, v4, memory_order_acquire);
      break;
    case 3:
      unsigned __int16 v5 = atomic_fetch_and_explicit(a2, v4, memory_order_release);
      break;
    case 4:
    case 5:
      unsigned __int16 v5 = atomic_fetch_and(a2, v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D6740);
  }
  *a4 = v5;
  return result;
}

unsigned __int16 *sub_2487D6758@<X0>(unsigned __int16 *result@<X0>, atomic_ushort *a2@<X1>, uint64_t a3@<X2>, unsigned __int16 *a4@<X8>)
{
  unsigned __int16 v4 = *result;
  switch(a3)
  {
    case 0:
      unsigned __int16 v5 = atomic_fetch_or_explicit(a2, v4, memory_order_relaxed);
      break;
    case 2:
      unsigned __int16 v5 = atomic_fetch_or_explicit(a2, v4, memory_order_acquire);
      break;
    case 3:
      unsigned __int16 v5 = atomic_fetch_or_explicit(a2, v4, memory_order_release);
      break;
    case 4:
    case 5:
      unsigned __int16 v5 = atomic_fetch_or(a2, v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D6810);
  }
  *a4 = v5;
  return result;
}

unsigned __int16 *sub_2487D6828@<X0>(unsigned __int16 *result@<X0>, atomic_ushort *a2@<X1>, uint64_t a3@<X2>, unsigned __int16 *a4@<X8>)
{
  unsigned __int16 v4 = *result;
  switch(a3)
  {
    case 0:
      xor_unsigned __int16 explicit = atomic_fetch_xor_explicit(a2, v4, memory_order_relaxed);
      break;
    case 2:
      xor_unsigned __int16 explicit = atomic_fetch_xor_explicit(a2, v4, memory_order_acquire);
      break;
    case 3:
      xor_unsigned __int16 explicit = atomic_fetch_xor_explicit(a2, v4, memory_order_release);
      break;
    case 4:
    case 5:
      xor_unsigned __int16 explicit = atomic_fetch_xor(a2, v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D68E0);
  }
  *a4 = xor_explicit;
  return result;
}

uint64_t UInt32.AtomicRepresentation._storage.setter(uint64_t result)
{
  _DWORD *v1 = result;
  return result;
}

uint64_t (*UInt32.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

unsigned int *sub_2487D6928@<X0>(unsigned int *result@<X0>, uint64_t a2@<X1>, unsigned int *a3@<X8>)
{
  switch(a2)
  {
    case 5:
      unsigned int explicit = atomic_load(result);
      goto LABEL_7;
    case 2:
      unsigned int explicit = atomic_load_explicit((atomic_uint *volatile)result, memory_order_acquire);
LABEL_7:
      *a3 = explicit;
      return result;
    case 0:
      unsigned int explicit = *result;
      goto LABEL_7;
  }
  result = (unsigned int *)sub_2487E4C50();
  __break(1u);
  return result;
}

unsigned int *sub_2487D69BC(unsigned int *result, unsigned int *a2, uint64_t a3)
{
  unsigned int v3 = *result;
  if (a3 == 5 || a3 == 3)
  {
    atomic_store(v3, a2);
  }
  else if (a3)
  {
    result = (unsigned int *)sub_2487E4C50();
    __break(1u);
  }
  else
  {
    *a2 = v3;
  }
  return result;
}

unsigned int *sub_2487D6A48@<X0>(unsigned int *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unsigned int *a4@<X8>)
{
  unsigned int v4 = *result;
  switch(a3)
  {
    case 0:
      unsigned int v5 = __swp(v4, a2);
      break;
    case 2:
      unsigned int v5 = atomic_exchange_explicit((atomic_uint *volatile)a2, v4, memory_order_acquire);
      break;
    case 3:
      unsigned int v5 = atomic_exchange_explicit((atomic_uint *volatile)a2, v4, memory_order_release);
      break;
    case 4:
    case 5:
      unsigned int v5 = atomic_exchange((atomic_uint *volatile)a2, v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D6B00);
  }
  *a4 = v5;
  return result;
}

BOOL sub_2487D6B18(_DWORD *a1, int *a2, unsigned int *a3, atomic_uint *a4, uint64_t a5)
{
  int v5 = *a2;
  unsigned int v6 = *a3;
  switch(a5)
  {
    case 0:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned int *)&v7, v6, memory_order_relaxed, memory_order_relaxed);
      break;
    case 2:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned int *)&v7, v6, memory_order_acquire, memory_order_acquire);
      break;
    case 3:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned int *)&v7, v6, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      int v7 = *a2;
      atomic_compare_exchange_strong(a4, (unsigned int *)&v7, v6);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D6BF0);
  }
  *a1 = v7;
  return v7 == v5;
}

BOOL sub_2487D6C08(_DWORD *a1, int *a2, unsigned int *a3, atomic_uint *a4, uint64_t a5, uint64_t a6)
{
  int v6 = *a2;
  unsigned int v7 = *a3;
  switch(a5)
  {
    case 0:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 == 2) {
        goto LABEL_12;
      }
      if (a6) {
        goto LABEL_21;
      }
      int v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned int *)&v8, v7, memory_order_relaxed, memory_order_relaxed);
      break;
    case 2:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 != 2 && a6) {
        goto LABEL_21;
      }
LABEL_12:
      int v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned int *)&v8, v7, memory_order_acquire, memory_order_acquire);
      break;
    case 3:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_15;
      }
      if (a6) {
        goto LABEL_21;
      }
      int v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned int *)&v8, v7, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      if (a6 != 5 && a6 != 2 && a6) {
        goto LABEL_21;
      }
LABEL_15:
      int v8 = *a2;
      atomic_compare_exchange_strong(a4, (unsigned int *)&v8, v7);
      break;
    default:
LABEL_21:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D6D38);
  }
  *a1 = v8;
  return v8 == v6;
}

BOOL sub_2487D6D50(_DWORD *a1, int *a2, unsigned int *a3, atomic_uint *a4, uint64_t a5, uint64_t a6)
{
  int v6 = *a2;
  unsigned int v7 = *a3;
  switch(a5)
  {
    case 0:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 == 2) {
        goto LABEL_12;
      }
      if (a6) {
        goto LABEL_21;
      }
      int v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned int *)&v8, v7, memory_order_relaxed, memory_order_relaxed);
      break;
    case 2:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 != 2 && a6) {
        goto LABEL_21;
      }
LABEL_12:
      int v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned int *)&v8, v7, memory_order_acquire, memory_order_acquire);
      break;
    case 3:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_15;
      }
      if (a6) {
        goto LABEL_21;
      }
      int v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned int *)&v8, v7, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      if (a6 != 5 && a6 != 2 && a6) {
        goto LABEL_21;
      }
LABEL_15:
      int v8 = *a2;
      atomic_compare_exchange_strong(a4, (unsigned int *)&v8, v7);
      break;
    default:
LABEL_21:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D6E80);
  }
  *a1 = v8;
  return v8 == v6;
}

unsigned int *sub_2487D6E98@<X0>(unsigned int *result@<X0>, atomic_uint *a2@<X1>, uint64_t a3@<X2>, unsigned int *a4@<X8>)
{
  unsigned int v4 = *result;
  switch(a3)
  {
    case 0:
      add_unsigned int explicit = atomic_fetch_add_explicit(a2, v4, memory_order_relaxed);
      break;
    case 2:
      add_unsigned int explicit = atomic_fetch_add_explicit(a2, v4, memory_order_acquire);
      break;
    case 3:
      add_unsigned int explicit = atomic_fetch_add_explicit(a2, v4, memory_order_release);
      break;
    case 4:
    case 5:
      add_unsigned int explicit = atomic_fetch_add(a2, v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D6F50);
  }
  *a4 = add_explicit;
  return result;
}

int *sub_2487D6F68@<X0>(int *result@<X0>, atomic_uint *a2@<X1>, uint64_t a3@<X2>, unsigned int *a4@<X8>)
{
  int v4 = *result;
  switch(a3)
  {
    case 0:
      add_unsigned int explicit = atomic_fetch_add_explicit(a2, -v4, memory_order_relaxed);
      break;
    case 2:
      add_unsigned int explicit = atomic_fetch_add_explicit(a2, -v4, memory_order_acquire);
      break;
    case 3:
      add_unsigned int explicit = atomic_fetch_add_explicit(a2, -v4, memory_order_release);
      break;
    case 4:
    case 5:
      add_unsigned int explicit = atomic_fetch_add(a2, -v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D7030);
  }
  *a4 = add_explicit;
  return result;
}

unsigned int *sub_2487D7048@<X0>(unsigned int *result@<X0>, atomic_uint *a2@<X1>, uint64_t a3@<X2>, unsigned int *a4@<X8>)
{
  unsigned int v4 = *result;
  switch(a3)
  {
    case 0:
      unsigned int v5 = atomic_fetch_and_explicit(a2, v4, memory_order_relaxed);
      break;
    case 2:
      unsigned int v5 = atomic_fetch_and_explicit(a2, v4, memory_order_acquire);
      break;
    case 3:
      unsigned int v5 = atomic_fetch_and_explicit(a2, v4, memory_order_release);
      break;
    case 4:
    case 5:
      unsigned int v5 = atomic_fetch_and(a2, v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D7110);
  }
  *a4 = v5;
  return result;
}

unsigned int *sub_2487D7128@<X0>(unsigned int *result@<X0>, atomic_uint *a2@<X1>, uint64_t a3@<X2>, unsigned int *a4@<X8>)
{
  unsigned int v4 = *result;
  switch(a3)
  {
    case 0:
      unsigned int v5 = atomic_fetch_or_explicit(a2, v4, memory_order_relaxed);
      break;
    case 2:
      unsigned int v5 = atomic_fetch_or_explicit(a2, v4, memory_order_acquire);
      break;
    case 3:
      unsigned int v5 = atomic_fetch_or_explicit(a2, v4, memory_order_release);
      break;
    case 4:
    case 5:
      unsigned int v5 = atomic_fetch_or(a2, v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D71E0);
  }
  *a4 = v5;
  return result;
}

unsigned int *sub_2487D71F8@<X0>(unsigned int *result@<X0>, atomic_uint *a2@<X1>, uint64_t a3@<X2>, unsigned int *a4@<X8>)
{
  unsigned int v4 = *result;
  switch(a3)
  {
    case 0:
      xor_unsigned int explicit = atomic_fetch_xor_explicit(a2, v4, memory_order_relaxed);
      break;
    case 2:
      xor_unsigned int explicit = atomic_fetch_xor_explicit(a2, v4, memory_order_acquire);
      break;
    case 3:
      xor_unsigned int explicit = atomic_fetch_xor_explicit(a2, v4, memory_order_release);
      break;
    case 4:
    case 5:
      xor_unsigned int explicit = atomic_fetch_xor(a2, v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D72B0);
  }
  *a4 = xor_explicit;
  return result;
}

uint64_t UInt64.AtomicRepresentation._storage.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*UInt64.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

uint64_t Int.AtomicRepresentation._storage.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*Int.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

void *sub_2487D7328@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_2487D7334(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t *sub_2487D7340@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_2487D7410(result, a2, a3);
}

unint64_t *sub_2487D7348(unint64_t *result, unint64_t *a2, uint64_t a3)
{
  return sub_2487D74A0(result, a2, a3);
}

unint64_t *sub_2487D7350@<X0>(unint64_t *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_2487D7528(result, a2, a3, a4);
}

BOOL sub_2487D7358(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5)
{
  return sub_2487D75F4(a1, a2, a3, a4, a5);
}

BOOL sub_2487D7360(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5, uint64_t a6)
{
  return sub_2487D76E0(a1, a2, a3, a4, a5, a6);
}

BOOL sub_2487D738C(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5, uint64_t a6)
{
  return sub_2487D7828(a1, a2, a3, a4, a5, a6);
}

unint64_t *sub_2487D73B8@<X0>(unint64_t *result@<X0>, atomic_ullong *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_2487D7970(result, a2, a3, a4);
}

uint64_t *sub_2487D73C0@<X0>(uint64_t *result@<X0>, atomic_ullong *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_2487D7A3C(result, a2, a3, a4);
}

unint64_t *sub_2487D73C8@<X0>(unint64_t *result@<X0>, atomic_ullong *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_2487D7B18(result, a2, a3, a4);
}

unint64_t *sub_2487D73D0@<X0>(unint64_t *result@<X0>, atomic_ullong *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_2487D7BF4(result, a2, a3, a4);
}

unint64_t *sub_2487D73D8@<X0>(unint64_t *result@<X0>, atomic_ullong *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_2487D7CC0(result, a2, a3, a4);
}

uint64_t UInt.AtomicRepresentation._storage.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*UInt.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

unint64_t *sub_2487D7410@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  switch(a2)
  {
    case 5:
      unint64_t explicit = atomic_load(result);
      goto LABEL_7;
    case 2:
      unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)result, memory_order_acquire);
LABEL_7:
      *a3 = explicit;
      return result;
    case 0:
      unint64_t explicit = *result;
      goto LABEL_7;
  }
  result = (unint64_t *)sub_2487E4C50();
  __break(1u);
  return result;
}

unint64_t *sub_2487D74A0(unint64_t *result, unint64_t *a2, uint64_t a3)
{
  unint64_t v3 = *result;
  if (a3 == 5 || a3 == 3)
  {
    atomic_store(v3, a2);
  }
  else if (a3)
  {
    result = (unint64_t *)sub_2487E4C50();
    __break(1u);
  }
  else
  {
    *a2 = v3;
  }
  return result;
}

unint64_t *sub_2487D7528@<X0>(unint64_t *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  unint64_t v4 = *result;
  switch(a3)
  {
    case 0:
      unint64_t v5 = __swp(v4, a2);
      break;
    case 2:
      unint64_t v5 = atomic_exchange_explicit((atomic_ullong *volatile)a2, v4, memory_order_acquire);
      break;
    case 3:
      unint64_t v5 = atomic_exchange_explicit((atomic_ullong *volatile)a2, v4, memory_order_release);
      break;
    case 4:
    case 5:
      unint64_t v5 = atomic_exchange((atomic_ullong *volatile)a2, v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D75DCLL);
  }
  *a4 = v5;
  return result;
}

BOOL sub_2487D75F4(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5)
{
  uint64_t v5 = *a2;
  unint64_t v6 = *a3;
  switch(a5)
  {
    case 0:
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v7, v6, memory_order_relaxed, memory_order_relaxed);
      break;
    case 2:
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v7, v6, memory_order_acquire, memory_order_acquire);
      break;
    case 3:
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v7, v6, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong(a4, (unint64_t *)&v7, v6);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D76C8);
  }
  *a1 = v7;
  return v7 == v5;
}

BOOL sub_2487D76E0(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *a2;
  unint64_t v7 = *a3;
  switch(a5)
  {
    case 0:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 == 2) {
        goto LABEL_12;
      }
      if (a6) {
        goto LABEL_21;
      }
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v7, memory_order_relaxed, memory_order_relaxed);
      break;
    case 2:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 != 2 && a6) {
        goto LABEL_21;
      }
LABEL_12:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v7, memory_order_acquire, memory_order_acquire);
      break;
    case 3:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_15;
      }
      if (a6) {
        goto LABEL_21;
      }
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v7, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      if (a6 != 5 && a6 != 2 && a6) {
        goto LABEL_21;
      }
LABEL_15:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong(a4, (unint64_t *)&v8, v7);
      break;
    default:
LABEL_21:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D7810);
  }
  *a1 = v8;
  return v8 == v6;
}

BOOL sub_2487D7828(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *a2;
  unint64_t v7 = *a3;
  switch(a5)
  {
    case 0:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 == 2) {
        goto LABEL_12;
      }
      if (a6) {
        goto LABEL_21;
      }
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v7, memory_order_relaxed, memory_order_relaxed);
      break;
    case 2:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 != 2 && a6) {
        goto LABEL_21;
      }
LABEL_12:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v7, memory_order_acquire, memory_order_acquire);
      break;
    case 3:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_15;
      }
      if (a6) {
        goto LABEL_21;
      }
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v7, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      if (a6 != 5 && a6 != 2 && a6) {
        goto LABEL_21;
      }
LABEL_15:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong(a4, (unint64_t *)&v8, v7);
      break;
    default:
LABEL_21:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D7958);
  }
  *a1 = v8;
  return v8 == v6;
}

unint64_t *sub_2487D7970@<X0>(unint64_t *result@<X0>, atomic_ullong *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  unint64_t v4 = *result;
  switch(a3)
  {
    case 0:
      add_unint64_t explicit = atomic_fetch_add_explicit(a2, v4, memory_order_relaxed);
      break;
    case 2:
      add_unint64_t explicit = atomic_fetch_add_explicit(a2, v4, memory_order_acquire);
      break;
    case 3:
      add_unint64_t explicit = atomic_fetch_add_explicit(a2, v4, memory_order_release);
      break;
    case 4:
    case 5:
      add_unint64_t explicit = atomic_fetch_add(a2, v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D7A24);
  }
  *a4 = add_explicit;
  return result;
}

uint64_t *sub_2487D7A3C@<X0>(uint64_t *result@<X0>, atomic_ullong *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  uint64_t v4 = *result;
  switch(a3)
  {
    case 0:
      add_unint64_t explicit = atomic_fetch_add_explicit(a2, -v4, memory_order_relaxed);
      break;
    case 2:
      add_unint64_t explicit = atomic_fetch_add_explicit(a2, -v4, memory_order_acquire);
      break;
    case 3:
      add_unint64_t explicit = atomic_fetch_add_explicit(a2, -v4, memory_order_release);
      break;
    case 4:
    case 5:
      add_unint64_t explicit = atomic_fetch_add(a2, -v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D7B00);
  }
  *a4 = add_explicit;
  return result;
}

unint64_t *sub_2487D7B18@<X0>(unint64_t *result@<X0>, atomic_ullong *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  unint64_t v4 = *result;
  switch(a3)
  {
    case 0:
      unint64_t v5 = atomic_fetch_and_explicit(a2, v4, memory_order_relaxed);
      break;
    case 2:
      unint64_t v5 = atomic_fetch_and_explicit(a2, v4, memory_order_acquire);
      break;
    case 3:
      unint64_t v5 = atomic_fetch_and_explicit(a2, v4, memory_order_release);
      break;
    case 4:
    case 5:
      unint64_t v5 = atomic_fetch_and(a2, v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D7BDCLL);
  }
  *a4 = v5;
  return result;
}

unint64_t *sub_2487D7BF4@<X0>(unint64_t *result@<X0>, atomic_ullong *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  unint64_t v4 = *result;
  switch(a3)
  {
    case 0:
      unint64_t v5 = atomic_fetch_or_explicit(a2, v4, memory_order_relaxed);
      break;
    case 2:
      unint64_t v5 = atomic_fetch_or_explicit(a2, v4, memory_order_acquire);
      break;
    case 3:
      unint64_t v5 = atomic_fetch_or_explicit(a2, v4, memory_order_release);
      break;
    case 4:
    case 5:
      unint64_t v5 = atomic_fetch_or(a2, v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D7CA8);
  }
  *a4 = v5;
  return result;
}

unint64_t *sub_2487D7CC0@<X0>(unint64_t *result@<X0>, atomic_ullong *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  unint64_t v4 = *result;
  switch(a3)
  {
    case 0:
      xor_unint64_t explicit = atomic_fetch_xor_explicit(a2, v4, memory_order_relaxed);
      break;
    case 2:
      xor_unint64_t explicit = atomic_fetch_xor_explicit(a2, v4, memory_order_acquire);
      break;
    case 3:
      xor_unint64_t explicit = atomic_fetch_xor_explicit(a2, v4, memory_order_release);
      break;
    case 4:
    case 5:
      xor_unint64_t explicit = atomic_fetch_xor(a2, v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D7D74);
  }
  *a4 = xor_explicit;
  return result;
}

uint64_t DoubleWord.AtomicRepresentation._storage.setter(uint64_t result, uint64_t a2)
{
  void *v2 = result;
  v2[1] = a2;
  return result;
}

uint64_t (*DoubleWord.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

_UNKNOWN **sub_2487D7DBC()
{
  return &protocol witness table for Int8.AtomicRepresentation;
}

_UNKNOWN **sub_2487D7DC8()
{
  return &protocol witness table for Int8.AtomicRepresentation;
}

unint64_t sub_2487D7DD4(uint64_t a1)
{
  unint64_t result = sub_2487D7DFC();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_2487D7DFC()
{
  unint64_t result = qword_26932A000;
  if (!qword_26932A000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26932A000);
  }
  return result;
}

_UNKNOWN **sub_2487D7E50()
{
  return &protocol witness table for Int16.AtomicRepresentation;
}

_UNKNOWN **sub_2487D7E5C()
{
  return &protocol witness table for Int16.AtomicRepresentation;
}

unint64_t sub_2487D7E68(uint64_t a1)
{
  unint64_t result = sub_2487D7E90();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_2487D7E90()
{
  unint64_t result = qword_26932A008;
  if (!qword_26932A008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26932A008);
  }
  return result;
}

_UNKNOWN **sub_2487D7EE4()
{
  return &protocol witness table for Int32.AtomicRepresentation;
}

_UNKNOWN **sub_2487D7EF0()
{
  return &protocol witness table for Int32.AtomicRepresentation;
}

unint64_t sub_2487D7EFC(uint64_t a1)
{
  unint64_t result = sub_2487D7F24();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_2487D7F24()
{
  unint64_t result = qword_26932A010;
  if (!qword_26932A010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26932A010);
  }
  return result;
}

_UNKNOWN **sub_2487D7F78()
{
  return &protocol witness table for Int64.AtomicRepresentation;
}

_UNKNOWN **sub_2487D7F84()
{
  return &protocol witness table for Int64.AtomicRepresentation;
}

unint64_t sub_2487D7F90(uint64_t a1)
{
  unint64_t result = sub_2487D7FB8();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_2487D7FB8()
{
  unint64_t result = qword_26932A018;
  if (!qword_26932A018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26932A018);
  }
  return result;
}

_UNKNOWN **sub_2487D800C()
{
  return &protocol witness table for UInt8.AtomicRepresentation;
}

_UNKNOWN **sub_2487D8018()
{
  return &protocol witness table for UInt8.AtomicRepresentation;
}

unint64_t sub_2487D8024(uint64_t a1)
{
  unint64_t result = sub_2487D804C();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_2487D804C()
{
  unint64_t result = qword_26932A020;
  if (!qword_26932A020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26932A020);
  }
  return result;
}

_UNKNOWN **sub_2487D80A0()
{
  return &protocol witness table for UInt16.AtomicRepresentation;
}

_UNKNOWN **sub_2487D80AC()
{
  return &protocol witness table for UInt16.AtomicRepresentation;
}

unint64_t sub_2487D80B8(uint64_t a1)
{
  unint64_t result = sub_2487D80E0();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_2487D80E0()
{
  unint64_t result = qword_26932A028;
  if (!qword_26932A028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26932A028);
  }
  return result;
}

_UNKNOWN **sub_2487D8134()
{
  return &protocol witness table for UInt32.AtomicRepresentation;
}

_UNKNOWN **sub_2487D8140()
{
  return &protocol witness table for UInt32.AtomicRepresentation;
}

unint64_t sub_2487D814C(uint64_t a1)
{
  unint64_t result = sub_2487D8174();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_2487D8174()
{
  unint64_t result = qword_26932A030;
  if (!qword_26932A030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26932A030);
  }
  return result;
}

_UNKNOWN **sub_2487D81C8()
{
  return &protocol witness table for UInt64.AtomicRepresentation;
}

_UNKNOWN **sub_2487D81D4()
{
  return &protocol witness table for UInt64.AtomicRepresentation;
}

unint64_t sub_2487D81E0(uint64_t a1)
{
  unint64_t result = sub_2487D8208();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_2487D8208()
{
  unint64_t result = qword_26932A038;
  if (!qword_26932A038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26932A038);
  }
  return result;
}

_UNKNOWN **sub_2487D825C()
{
  return &protocol witness table for Int.AtomicRepresentation;
}

_UNKNOWN **sub_2487D8268()
{
  return &protocol witness table for Int.AtomicRepresentation;
}

unint64_t sub_2487D8274(uint64_t a1)
{
  unint64_t result = sub_2487D829C();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_2487D829C()
{
  unint64_t result = qword_26932A040;
  if (!qword_26932A040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26932A040);
  }
  return result;
}

_UNKNOWN **sub_2487D82F0()
{
  return &protocol witness table for UInt.AtomicRepresentation;
}

_UNKNOWN **sub_2487D82FC()
{
  return &protocol witness table for UInt.AtomicRepresentation;
}

unint64_t sub_2487D8308(uint64_t a1)
{
  unint64_t result = sub_2487D8330();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_2487D8330()
{
  unint64_t result = qword_26932A048[0];
  if (!qword_26932A048[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26932A048);
  }
  return result;
}

_UNKNOWN **sub_2487D8384()
{
  return &protocol witness table for DoubleWord.AtomicRepresentation;
}

__n128 sub_2487D8390@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

__n128 sub_2487D839C@<Q0>(__n128 *a1@<X8>)
{
  __n128 result = *v1;
  *a1 = *v1;
  return result;
}

uint64_t sub_2487D83A8@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  switch(a1)
  {
    case 5:
      _X2 = 0;
      _X3 = 0;
      __asm { CASPAL          X2, X3, X2, X3, [X0] }
      goto LABEL_7;
    case 2:
      _X2 = 0;
      _X3 = 0;
      __asm { CASPA           X2, X3, X2, X3, [X0] }
LABEL_7:
      *a2 = _X2;
      a2[1] = 0;
      return result;
    case 0:
      _X2 = 0;
      _X3 = 0;
      __asm { CASP            X2, X3, X2, X3, [X0] }
      goto LABEL_7;
  }
  uint64_t result = sub_2487E4C50();
  __break(1u);
  return result;
}

uint64_t *sub_2487D8454(uint64_t *result, uint64_t *a2, uint64_t a3)
{
  _X4 = *result;
  if (a3 == 5)
  {
    uint64_t v11 = *a2;
    do
    {
      _X7 = a2[1];
      __asm { CASPAL          X6, X7, X4, X5, [X1] }
      _ZF = _X6 == v11;
      uint64_t v11 = _X6;
    }
    while (!_ZF);
  }
  else if (a3 == 3)
  {
    uint64_t v4 = *a2;
    do
    {
      _X7 = a2[1];
      __asm { CASPL           X6, X7, X4, X5, [X1] }
      _ZF = _X6 == v4;
      uint64_t v4 = _X6;
    }
    while (!_ZF);
  }
  else if (a3)
  {
    uint64_t result = (uint64_t *)sub_2487E4C50();
    __break(1u);
  }
  else
  {
    uint64_t v14 = *a2;
    do
    {
      _X7 = a2[1];
      __asm { CASP            X6, X7, X4, X5, [X1] }
      _ZF = _X6 == v14;
      uint64_t v14 = _X6;
    }
    while (!_ZF);
  }
  return result;
}

uint64_t *sub_2487D8548@<X0>(uint64_t *result@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  _X4 = *result;
  switch(a3)
  {
    case 0:
      uint64_t v5 = *a2;
      do
      {
        _X3 = a2[1];
        __asm { CASP            X2, X3, X4, X5, [X1] }
        _ZF = _X2 == v5;
        uint64_t v5 = _X2;
      }
      while (!_ZF);
      break;
    case 2:
      uint64_t v12 = *a2;
      do
      {
        _X3 = a2[1];
        __asm { CASPA           X2, X3, X4, X5, [X1] }
        _ZF = _X2 == v12;
        uint64_t v12 = _X2;
      }
      while (!_ZF);
      break;
    case 3:
      uint64_t v14 = *a2;
      do
      {
        _X3 = a2[1];
        __asm { CASPL           X2, X3, X4, X5, [X1] }
        _ZF = _X2 == v14;
        uint64_t v14 = _X2;
      }
      while (!_ZF);
      break;
    case 4:
      uint64_t v13 = *a2;
      do
      {
        _X3 = a2[1];
        __asm { CASPAL          X2, X3, X4, X5, [X1] }
        _ZF = _X2 == v13;
        uint64_t v13 = _X2;
      }
      while (!_ZF);
      break;
    case 5:
      uint64_t v15 = *a2;
      do
      {
        _X3 = a2[1];
        __asm { CASPAL          X2, X3, X4, X5, [X1] }
        _ZF = _X2 == v15;
        uint64_t v15 = _X2;
      }
      while (!_ZF);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D86A8);
  }
  *a4 = _X2;
  a4[1] = _X3;
  return result;
}

BOOL sub_2487D86C0(void *a1, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  _X8 = *a3;
  switch(a5)
  {
    case 0:
      _X5 = a2[1];
      __asm { CASP            X4, X5, X8, X9, [X3] }
      break;
    case 2:
      _X5 = a2[1];
      __asm { CASPA           X4, X5, X8, X9, [X3] }
      break;
    case 3:
      _X5 = a2[1];
      __asm { CASPL           X4, X5, X8, X9, [X3] }
      break;
    case 4:
    case 5:
      _X5 = a2[1];
      __asm { CASPAL          X4, X5, X8, X9, [X3] }
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D87ACLL);
  }
  BOOL v12 = _X4 == *a2 && _X5 == a2[1];
  *a1 = _X4;
  a1[1] = _X5;
  return v12;
}

BOOL sub_2487D87C4(void *a1, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _X8 = *a3;
  switch(a5)
  {
    case 0:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 == 2) {
        goto LABEL_12;
      }
      if (a6) {
        goto LABEL_27;
      }
      _X5 = a2[1];
      __asm { CASP            X4, X5, X8, X9, [X3] }
      break;
    case 2:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 != 2 && a6) {
        goto LABEL_27;
      }
LABEL_12:
      _X5 = a2[1];
      __asm { CASPA           X4, X5, X8, X9, [X3] }
      break;
    case 3:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_15;
      }
      if (a6) {
        goto LABEL_27;
      }
      _X5 = a2[1];
      __asm { CASPL           X4, X5, X8, X9, [X3] }
      break;
    case 4:
    case 5:
      if (a6 != 5 && a6 != 2 && a6) {
        goto LABEL_27;
      }
LABEL_15:
      _X5 = a2[1];
      __asm { CASPAL          X4, X5, X8, X9, [X3] }
      break;
    default:
LABEL_27:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D8908);
  }
  BOOL v13 = _X4 == *a2 && _X5 == a2[1];
  *a1 = _X4;
  a1[1] = _X5;
  return v13;
}

BOOL sub_2487D8920(void *a1, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _X8 = *a3;
  switch(a5)
  {
    case 0:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 == 2) {
        goto LABEL_12;
      }
      if (a6) {
        goto LABEL_27;
      }
      _X5 = a2[1];
      __asm { CASP            X4, X5, X8, X9, [X3] }
      break;
    case 2:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 != 2 && a6) {
        goto LABEL_27;
      }
LABEL_12:
      _X5 = a2[1];
      __asm { CASPA           X4, X5, X8, X9, [X3] }
      break;
    case 3:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_15;
      }
      if (a6) {
        goto LABEL_27;
      }
      _X5 = a2[1];
      __asm { CASPL           X4, X5, X8, X9, [X3] }
      break;
    case 4:
    case 5:
      if (a6 != 5 && a6 != 2 && a6) {
        goto LABEL_27;
      }
LABEL_15:
      _X5 = a2[1];
      __asm { CASPAL          X4, X5, X8, X9, [X3] }
      break;
    default:
LABEL_27:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487D8A64);
  }
  BOOL v13 = _X4 == *a2 && _X5 == a2[1];
  *a1 = _X4;
  a1[1] = _X5;
  return v13;
}

ValueMetadata *type metadata accessor for Int8.AtomicRepresentation()
{
  return &type metadata for Int8.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for Int16.AtomicRepresentation()
{
  return &type metadata for Int16.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for Int32.AtomicRepresentation()
{
  return &type metadata for Int32.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for Int64.AtomicRepresentation()
{
  return &type metadata for Int64.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for UInt8.AtomicRepresentation()
{
  return &type metadata for UInt8.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for UInt16.AtomicRepresentation()
{
  return &type metadata for UInt16.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for UInt32.AtomicRepresentation()
{
  return &type metadata for UInt32.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for UInt64.AtomicRepresentation()
{
  return &type metadata for UInt64.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for Int.AtomicRepresentation()
{
  return &type metadata for Int.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for UInt.AtomicRepresentation()
{
  return &type metadata for UInt.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for DoubleWord.AtomicRepresentation()
{
  return &type metadata for DoubleWord.AtomicRepresentation;
}

uint64_t AtomicOptionalRawRepresentableStorage._storage.getter@<X0>(uint64_t a1@<X8>)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16);
  return v4(a1, v1, AssociatedTypeWitness);
}

uint64_t AtomicOptionalRawRepresentableStorage._storage.setter(uint64_t a1)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 40);
  return v4(v1, a1, AssociatedTypeWitness);
}

uint64_t (*AtomicOptionalRawRepresentableStorage._storage.modify())()
{
  return nullsub_1;
}

uint64_t sub_2487D8CC0@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v29 = a2;
  v30 = a1;
  uint64_t v10 = *(void *)(a3 - 8);
  uint64_t v27 = a5;
  uint64_t v28 = v10;
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  BOOL v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void *)(v14 + 16);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v11);
  v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  v21 = (char *)&v26 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v22 + 16))(v21, v23);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v21, 1, v15) == 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 56))(a6, 1, 1, a4);
  }
  uint64_t v25 = v28;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v19, v21, v15);
  v30(v19, v13);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v19, v15);
  if (v6) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v25 + 32))(v27, v13, a3);
  }
  return result;
}

uint64_t sub_2487D8F6C(uint64_t a1)
{
  return sub_2487D8F84(a1);
}

uint64_t sub_2487D8F84(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - v3, a1);
  return sub_2487E4BE0();
}

uint64_t sub_2487D908C@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v25 = a3;
  uint64_t v5 = a2[2];
  uint64_t v6 = sub_2487E4C20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)v23 - v8;
  v23[1] = a2[3];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = sub_2487E4C20();
  MEMORY[0x270FA5388](v11 - 8);
  BOOL v13 = (char *)v23 - v12;
  v23[2] = a2[4];
  uint64_t v14 = swift_getAssociatedTypeWitness();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)v23 - v16;
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v24 = a1;
  uint64_t v26 = v6;
  v18(v9, a1, v6);
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v20 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v9, 1, v5) == 1)
  {
    uint64_t v19 = v7;
    uint64_t v5 = v26;
  }
  else
  {
    sub_2487E4BD0();
    uint64_t v20 = 0;
  }
  (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v5);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56))(v13, v20, 1, AssociatedTypeWitness);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *, uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(v13, v14, AssociatedConformanceWitness);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v24, v26);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(v25, v17, v14);
}

uint64_t sub_2487D93C0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2;
  uint64_t v5 = a1[3];
  uint64_t v20 = a1[4];
  uint64_t v21 = v5;
  uint64_t v22 = a2;
  uint64_t v6 = a1[2];
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = sub_2487E4C20();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v19 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v4, AssociatedTypeWitness);
  uint64_t v15 = v20;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(AssociatedTypeWitness, AssociatedConformanceWitness);
  uint64_t v24 = v6;
  uint64_t v25 = v21;
  uint64_t v26 = v15;
  uint64_t v27 = v6;
  sub_2487D8CC0((void (*)(char *, char *))sub_2487DB9B8, (uint64_t)v23, MEMORY[0x263F8E628], v6, v17, v22);
  (*(void (**)(uint64_t, void *))(*(a1 - 1) + 8))(v4, a1);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_2487D9634@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v18 = a4;
  uint64_t v6 = a3[2];
  uint64_t v7 = a3[3];
  swift_getAssociatedTypeWitness();
  uint64_t v8 = sub_2487E4C20();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v17 - v10;
  uint64_t v12 = a3[4];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(a1, v17, AssociatedTypeWitness, AssociatedConformanceWitness);
  uint64_t v20 = v6;
  uint64_t v21 = v7;
  uint64_t v22 = v12;
  uint64_t v23 = v6;
  sub_2487D8CC0((void (*)(char *, char *))sub_2487DB964, (uint64_t)v19, MEMORY[0x263F8E628], v6, v15, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_2487D97F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = a2;
  uint64_t v22 = a3;
  uint64_t v5 = *(void *)(a4 + 16);
  uint64_t v6 = sub_2487E4C20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v20 - v8;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = sub_2487E4C20();
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v20 - v12;
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v23 = a1;
  v14(v9, a1, v6);
  uint64_t v15 = *(void *)(v5 - 8);
  uint64_t v16 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v9, 1, v5) == 1)
  {
    uint64_t v15 = v7;
    uint64_t v5 = v6;
  }
  else
  {
    sub_2487E4BD0();
    uint64_t v16 = 0;
  }
  (*(void (**)(char *, uint64_t))(v15 + 8))(v9, v5);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56))(v13, v16, 1, AssociatedTypeWitness);
  uint64_t v17 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 40))(v13, v21, v22, v17, AssociatedConformanceWitness);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v23, v6);
}

uint64_t sub_2487D9AA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v33 = a3;
  uint64_t v34 = a5;
  uint64_t v7 = a4[2];
  uint64_t v8 = sub_2487E4C20();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v31 - v10;
  uint64_t v36 = a4[3];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v31 = sub_2487E4C20();
  uint64_t v13 = *(void *)(v31 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v31);
  uint64_t v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v31 - v17;
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v35 = a1;
  uint64_t v37 = v8;
  v19(v11, a1, v8);
  uint64_t v20 = *(void *)(v7 - 8);
  uint64_t v21 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v11, 1, v7) == 1)
  {
    uint64_t v20 = v9;
    uint64_t v22 = v37;
  }
  else
  {
    sub_2487E4BD0();
    uint64_t v21 = 0;
    uint64_t v22 = v7;
  }
  (*(void (**)(char *, uint64_t))(v20 + 8))(v11, v22);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56))(v16, v21, 1, AssociatedTypeWitness);
  uint64_t v23 = a4[4];
  uint64_t v24 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v26 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 48))(v16, v32, v33, v24, AssociatedConformanceWitness);
  MEMORY[0x270FA5388](v26);
  uint64_t v27 = v36;
  *(&v31 - 4) = v7;
  *(&v31 - 3) = v27;
  *(&v31 - 2) = v23;
  *(&v31 - 1) = v7;
  uint64_t v28 = v31;
  sub_2487D8CC0((void (*)(char *, char *))sub_2487DB9B8, (uint64_t)(&v31 - 6), MEMORY[0x263F8E628], v7, v29, v34);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v35, v37);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v28);
}

uint64_t sub_2487D9E3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v64 = a4;
  uint64_t v65 = a5;
  uint64_t v72 = a3;
  uint64_t v67 = a1;
  uint64_t v8 = *(void *)(a6 + 16);
  uint64_t v9 = sub_2487E4C20();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v59 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v54 - v13;
  uint64_t v63 = a6;
  uint64_t v15 = *(void *)(a6 + 24);
  uint64_t AssociatedTypeWitness = (void (*)(char *, uint64_t))swift_getAssociatedTypeWitness();
  uint64_t v16 = sub_2487E4C20();
  uint64_t v61 = *(void *)(v16 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](v16);
  v57 = (char *)&v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v17);
  uint64_t v20 = (char *)&v54 - v19;
  uint64_t v66 = v21;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v62 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v22 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  v56 = (char *)&v54 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v22);
  v60 = (char *)&v54 - v24;
  uint64_t v25 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v73 = v9;
  v55 = v25;
  v25(v14, a2, v9);
  uint64_t v26 = *(void *)(v8 - 8);
  uint64_t v27 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v26 + 48);
  uint64_t v28 = 1;
  int v29 = v27(v14, 1, v8);
  uint64_t v68 = v10;
  uint64_t v69 = v15;
  if (v29 == 1)
  {
    uint64_t v30 = v10;
    uint64_t v31 = v73;
  }
  else
  {
    sub_2487E4BD0();
    uint64_t v28 = 0;
    uint64_t v30 = v26;
    uint64_t v31 = v8;
  }
  (*(void (**)(char *, uint64_t))(v30 + 8))(v14, v31);
  uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t))(*((void *)AssociatedTypeWitness - 1) + 56);
  uint64_t v33 = 1;
  v58 = v20;
  v32(v20, v28, 1);
  uint64_t v34 = v59;
  uint64_t v35 = v73;
  v55(v59, v72, v73);
  int v36 = v27(v34, 1, v8);
  uint64_t v54 = v8;
  if (v36 == 1)
  {
    uint64_t v26 = v68;
    uint64_t v37 = v35;
    v38 = v57;
  }
  else
  {
    v38 = v57;
    sub_2487E4BD0();
    uint64_t v33 = 0;
    uint64_t v37 = v8;
  }
  (*(void (**)(char *, uint64_t))(v26 + 8))(v34, v37);
  ((void (*)(char *, uint64_t, uint64_t, void (*)(char *, uint64_t)))v32)(v38, v33, 1, AssociatedTypeWitness);
  uint64_t v39 = TupleTypeMetadata2;
  v40 = v60;
  v41 = &v60[*(int *)(TupleTypeMetadata2 + 48)];
  uint64_t v42 = *(void *)(v63 + 32);
  uint64_t v43 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v45 = v58;
  LOBYTE(v43) = (*(uint64_t (**)(char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 56))(v41, v58, v38, v64, v65, v43, AssociatedConformanceWitness);
  uint64_t v46 = v61;
  uint64_t AssociatedTypeWitness = *(void (**)(char *, uint64_t))(v61 + 8);
  uint64_t v47 = v66;
  AssociatedTypeWitness(v45, v66);
  unsigned char *v40 = v43 & 1;
  v48 = &v56[*(int *)(v39 + 48)];
  unsigned char *v56 = v43 & 1;
  uint64_t v49 = (*(uint64_t (**)(char *, char *, uint64_t))(v46 + 16))(v48, v41, v47);
  MEMORY[0x270FA5388](v49);
  uint64_t v50 = v54;
  uint64_t v51 = v69;
  *(&v54 - 4) = v54;
  *(&v54 - 3) = v51;
  *(&v54 - 2) = v42;
  *(&v54 - 1) = v50;
  sub_2487D8CC0((void (*)(char *, char *))sub_2487DB9B8, (uint64_t)(&v54 - 6), MEMORY[0x263F8E628], v50, v52, v67);
  (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v72, v73);
  (*(void (**)(unsigned char *, uint64_t))(v62 + 8))(v40, TupleTypeMetadata2);
  AssociatedTypeWitness(v48, v47);
  return v43 & 1;
}

uint64_t sub_2487DA418(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v67 = a5;
  uint64_t v68 = a6;
  uint64_t v66 = a4;
  uint64_t v75 = a3;
  uint64_t v70 = a1;
  uint64_t v9 = *(void *)(a7 + 16);
  uint64_t v10 = sub_2487E4C20();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v60 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v55 - v14;
  uint64_t v65 = a7;
  uint64_t v16 = *(void *)(a7 + 24);
  uint64_t AssociatedTypeWitness = (void (*)(char *, uint64_t))swift_getAssociatedTypeWitness();
  uint64_t v17 = sub_2487E4C20();
  uint64_t v63 = *(void *)(v17 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  v59 = (char *)&v55 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v55 - v20;
  uint64_t v69 = v22;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v64 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  v58 = (char *)&v55 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v62 = (char *)&v55 - v25;
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v76 = v10;
  v56 = v26;
  v26(v15, a2, v10);
  uint64_t v27 = *(void *)(v9 - 8);
  uint64_t v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
  uint64_t v29 = 1;
  int v30 = v28(v15, 1, v9);
  uint64_t v71 = v11;
  uint64_t v72 = v16;
  if (v30 == 1)
  {
    uint64_t v31 = v11;
    uint64_t v32 = v76;
  }
  else
  {
    sub_2487E4BD0();
    uint64_t v29 = 0;
    uint64_t v31 = v27;
    uint64_t v32 = v9;
  }
  (*(void (**)(char *, uint64_t))(v31 + 8))(v15, v32);
  uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(*((void *)AssociatedTypeWitness - 1) + 56);
  uint64_t v34 = 1;
  uint64_t v61 = v21;
  v33(v21, v29, 1);
  uint64_t v35 = v60;
  uint64_t v36 = v76;
  v56(v60, v75, v76);
  int v37 = v28(v35, 1, v9);
  uint64_t v57 = v9;
  if (v37 == 1)
  {
    uint64_t v27 = v71;
    uint64_t v38 = v36;
    uint64_t v39 = v59;
  }
  else
  {
    uint64_t v39 = v59;
    sub_2487E4BD0();
    uint64_t v34 = 0;
    uint64_t v38 = v9;
  }
  (*(void (**)(char *, uint64_t))(v27 + 8))(v35, v38);
  ((void (*)(char *, uint64_t, uint64_t, void (*)(char *, uint64_t)))v33)(v39, v34, 1, AssociatedTypeWitness);
  uint64_t v40 = TupleTypeMetadata2;
  v41 = v62;
  uint64_t v42 = &v62[*(int *)(TupleTypeMetadata2 + 48)];
  uint64_t v43 = *(void *)(v65 + 32);
  uint64_t v44 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v46 = v61;
  LOBYTE(v44) = (*(uint64_t (**)(char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 64))(v42, v61, v39, v66, v67, v68, v44, AssociatedConformanceWitness);
  uint64_t v47 = v63;
  uint64_t AssociatedTypeWitness = *(void (**)(char *, uint64_t))(v63 + 8);
  uint64_t v48 = v69;
  AssociatedTypeWitness(v46, v69);
  unsigned char *v41 = v44 & 1;
  uint64_t v49 = &v58[*(int *)(v40 + 48)];
  unsigned char *v58 = v44 & 1;
  uint64_t v50 = (*(uint64_t (**)(char *, char *, uint64_t))(v47 + 16))(v49, v42, v48);
  MEMORY[0x270FA5388](v50);
  uint64_t v51 = v57;
  uint64_t v52 = v72;
  *(&v55 - 4) = v57;
  *(&v55 - 3) = v52;
  *(&v55 - 2) = v43;
  *(&v55 - 1) = v51;
  sub_2487D8CC0((void (*)(char *, char *))sub_2487DB9B8, (uint64_t)(&v55 - 6), MEMORY[0x263F8E628], v51, v53, v70);
  (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v75, v76);
  (*(void (**)(unsigned char *, uint64_t))(v64 + 8))(v41, TupleTypeMetadata2);
  AssociatedTypeWitness(v49, v48);
  return v44 & 1;
}

uint64_t sub_2487DA9FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v67 = a5;
  uint64_t v68 = a6;
  uint64_t v66 = a4;
  uint64_t v75 = a3;
  uint64_t v70 = a1;
  uint64_t v9 = *(void *)(a7 + 16);
  uint64_t v10 = sub_2487E4C20();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  v60 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v55 - v14;
  uint64_t v65 = a7;
  uint64_t v16 = *(void *)(a7 + 24);
  uint64_t AssociatedTypeWitness = (void (*)(char *, uint64_t))swift_getAssociatedTypeWitness();
  uint64_t v17 = sub_2487E4C20();
  uint64_t v63 = *(void *)(v17 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v17);
  v59 = (char *)&v55 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  uint64_t v21 = (char *)&v55 - v20;
  uint64_t v69 = v22;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v64 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v23 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  v58 = (char *)&v55 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v23);
  uint64_t v62 = (char *)&v55 - v25;
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v76 = v10;
  v56 = v26;
  v26(v15, a2, v10);
  uint64_t v27 = *(void *)(v9 - 8);
  uint64_t v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
  uint64_t v29 = 1;
  int v30 = v28(v15, 1, v9);
  uint64_t v71 = v11;
  uint64_t v72 = v16;
  if (v30 == 1)
  {
    uint64_t v31 = v11;
    uint64_t v32 = v76;
  }
  else
  {
    sub_2487E4BD0();
    uint64_t v29 = 0;
    uint64_t v31 = v27;
    uint64_t v32 = v9;
  }
  (*(void (**)(char *, uint64_t))(v31 + 8))(v15, v32);
  uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(*((void *)AssociatedTypeWitness - 1) + 56);
  uint64_t v34 = 1;
  uint64_t v61 = v21;
  v33(v21, v29, 1);
  uint64_t v35 = v60;
  uint64_t v36 = v76;
  v56(v60, v75, v76);
  int v37 = v28(v35, 1, v9);
  uint64_t v57 = v9;
  if (v37 == 1)
  {
    uint64_t v27 = v71;
    uint64_t v38 = v36;
    uint64_t v39 = v59;
  }
  else
  {
    uint64_t v39 = v59;
    sub_2487E4BD0();
    uint64_t v34 = 0;
    uint64_t v38 = v9;
  }
  (*(void (**)(char *, uint64_t))(v27 + 8))(v35, v38);
  ((void (*)(char *, uint64_t, uint64_t, void (*)(char *, uint64_t)))v33)(v39, v34, 1, AssociatedTypeWitness);
  uint64_t v40 = TupleTypeMetadata2;
  v41 = v62;
  uint64_t v42 = &v62[*(int *)(TupleTypeMetadata2 + 48)];
  uint64_t v43 = *(void *)(v65 + 32);
  uint64_t v44 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v46 = v61;
  LOBYTE(v44) = (*(uint64_t (**)(char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 80))(v42, v61, v39, v66, v67, v68, v44, AssociatedConformanceWitness);
  uint64_t v47 = v63;
  uint64_t AssociatedTypeWitness = *(void (**)(char *, uint64_t))(v63 + 8);
  uint64_t v48 = v69;
  AssociatedTypeWitness(v46, v69);
  unsigned char *v41 = v44 & 1;
  uint64_t v49 = &v58[*(int *)(v40 + 48)];
  unsigned char *v58 = v44 & 1;
  uint64_t v50 = (*(uint64_t (**)(char *, char *, uint64_t))(v47 + 16))(v49, v42, v48);
  MEMORY[0x270FA5388](v50);
  uint64_t v51 = v57;
  uint64_t v52 = v72;
  *(&v55 - 4) = v57;
  *(&v55 - 3) = v52;
  *(&v55 - 2) = v43;
  *(&v55 - 1) = v51;
  sub_2487D8CC0((void (*)(char *, char *))sub_2487DB9B8, (uint64_t)(&v55 - 6), MEMORY[0x263F8E628], v51, v53, v70);
  (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v75, v76);
  (*(void (**)(unsigned char *, uint64_t))(v64 + 8))(v41, TupleTypeMetadata2);
  AssociatedTypeWitness(v49, v48);
  return v44 & 1;
}

uint64_t sub_2487DAFE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 32);
}

uint64_t sub_2487DAFE8()
{
  swift_getAssociatedTypeWitness();
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_2487DB0AC(uint64_t *a1, uint64_t *a2)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 <= 7
    && *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v5 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  }
  else
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~v6));
    swift_retain();
  }
  return a1;
}

uint64_t sub_2487DB1B4(uint64_t a1)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8);
  return v3(a1, AssociatedTypeWitness);
}

uint64_t sub_2487DB254(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_2487DB2F8(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 24))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_2487DB39C(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_2487DB440(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 40))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_2487DB4E4(unsigned __int16 *a1, unsigned int a2)
{
  swift_getAssociatedTypeWitness();
  uint64_t v4 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v7 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v9 = ((a2 - v5 + ~(-1 << v7)) >> v7) + 1;
    if (HIWORD(v9))
    {
      int v8 = *(_DWORD *)((char *)a1 + v6);
      if (!v8) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v9 > 0xFF)
    {
      int v8 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v9 < 2)
    {
LABEL_19:
      if (v5)
      {
        uint64_t v11 = *(uint64_t (**)(unsigned __int16 *))(v4 + 48);
        return v11(a1);
      }
      return 0;
    }
  }
  int v8 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v10 = (v8 - 1) << v7;
  if (v6 > 3) {
    int v10 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v10) + 1;
}

void sub_2487DB6C4(unsigned char *a1, uint64_t a2, unsigned int a3)
{
  swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  if (a3 <= v7)
  {
    int v9 = 0;
  }
  else if (v8 <= 3)
  {
    unsigned int v12 = ((a3 - v7 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
    if (HIWORD(v12))
    {
      int v9 = 4;
    }
    else if (v12 >= 0x100)
    {
      int v9 = 2;
    }
    else
    {
      int v9 = v12 > 1;
    }
  }
  else
  {
    int v9 = 1;
  }
  if (v7 < a2)
  {
    unsigned int v10 = ~v7 + a2;
    if (v8 < 4)
    {
      int v11 = (v10 >> (8 * v8)) + 1;
      if (v8)
      {
        int v13 = v10 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v13;
          a1[2] = BYTE2(v13);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v13;
        }
        else
        {
          *a1 = v13;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v10;
      int v11 = 1;
    }
    switch(v9)
    {
      case 1:
        a1[v8] = v11;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v11;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v11;
        return;
      default:
        return;
    }
  }
  switch(v9)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x2487DB924);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v14 = *(void (**)(unsigned char *, uint64_t))(v6 + 56);
        v14(a1, a2);
      }
      return;
  }
}

uint64_t type metadata accessor for AtomicOptionalRawRepresentableStorage()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2487DB964(uint64_t a1)
{
  return sub_2487D8F84(a1);
}

uint64_t __swift_instantiateGenericMetadata()
{
  return swift_getGenericMetadata();
}

uint64_t sub_2487DB9B8(uint64_t a1)
{
  return sub_2487DB964(a1);
}

uint64_t _concurrencyWindow.getter()
{
  return 20;
}

uint64_t _AtomicReferenceStorage.dispose()(uint64_t a1, __int16 a2)
{
  if (a2)
  {
    sub_2487E4C30();
    sub_2487E4BC0();
    DoubleWord.description.getter();
    sub_2487E4BC0();
    swift_bridgeObjectRelease();
    uint64_t result = sub_2487E4C50();
    __break(1u);
  }
  return result;
}

uint64_t sub_2487DBAA8(unint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, unint64_t))
{
  if ((a1 & 0x8000000000000000) != 0 || HIDWORD(a1))
  {
    uint64_t result = sub_2487E4C40();
    __break(1u);
  }
  else
  {
    return a3(a2, a1);
  }
  return result;
}

uint64_t static _AtomicReferenceStorage.atomicExchange(_:at:)(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectRetain();
  v10[0] = sub_2487DCCBC(a2, 0, 0, 1);
  v10[1] = v4;
  if (sub_2487DCD94(v10, a1, a2))
  {
    uint64_t v6 = v5;
  }
  else
  {
    do
    {
      char v7 = sub_2487DCD94(v10, a1, a2);
      uint64_t v6 = v8;
      swift_unknownObjectRelease();
    }
    while ((v7 & 1) == 0);
  }
  swift_unknownObjectRelease();
  return v6;
}

uint64_t static _AtomicReferenceStorage.atomicCompareExchange(expected:desired:at:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = sub_2487DD07C(a1, a2, a3);
  swift_unknownObjectRelease();
  return v3 & 1;
}

uint64_t AtomicReferenceStorage._storage.setter(uint64_t result, uint64_t a2)
{
  void *v2 = result;
  v2[1] = a2;
  return result;
}

uint64_t (*AtomicReferenceStorage._storage.modify())()
{
  return nullsub_1;
}

uint64_t AtomicReferenceStorage.dispose()(uint64_t a1, __int16 a2)
{
  if (_AtomicReferenceStorage.dispose()(a1, a2))
  {
    swift_unknownObjectRetain();
    if (swift_dynamicCast())
    {
      swift_unknownObjectRelease();
      return a1;
    }
  }
  else
  {
    sub_2487E4C40();
    __break(1u);
  }
  uint64_t result = sub_2487E4C60();
  __break(1u);
  return result;
}

void sub_2487DBD98(void *a1@<X8>)
{
  AtomicReferenceStorage.init(_:)();
  *a1 = v2;
  a1[1] = 0;
}

uint64_t sub_2487DBDC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AtomicReferenceStorage.dispose()(*v1, v1[1]);
  *a1 = result;
  return result;
}

uint64_t sub_2487DBDF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = _s15AtomicsInternal23_AtomicReferenceStorageV10atomicLoad2atyXlSgSpyACG_tFZ_0();
  if (v2)
  {
    uint64_t v3 = v2;
    swift_unknownObjectRetain_n();
    if (swift_dynamicCast())
    {
      swift_unknownObjectRelease();
      uint64_t result = swift_unknownObjectRelease();
      *a1 = v3;
      return result;
    }
  }
  else
  {
    sub_2487E4C40();
    __break(1u);
  }
  uint64_t result = sub_2487E4C60();
  __break(1u);
  return result;
}

uint64_t sub_2487DBF10(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  swift_unknownObjectRetain();
  v7[0] = sub_2487DCCBC(a2, 0, 0, 1);
  v7[1] = v4;
  if ((sub_2487DCD94(v7, v3, a2) & 1) == 0)
  {
    do
    {
      char v5 = sub_2487DCD94(v7, v3, a2);
      swift_unknownObjectRelease();
    }
    while ((v5 & 1) == 0);
  }
  swift_unknownObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t sub_2487DBFD0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = *a1;
  swift_unknownObjectRetain_n();
  v12[0] = sub_2487DCCBC(a2, 0, 0, 1);
  v12[1] = v6;
  if (sub_2487DCD94(v12, v5, a2))
  {
    uint64_t v8 = v7;
  }
  else
  {
    do
    {
      char v9 = sub_2487DCD94(v12, v5, a2);
      uint64_t v8 = v10;
      swift_unknownObjectRelease();
    }
    while ((v9 & 1) == 0);
  }
  swift_unknownObjectRelease();
  if (v8)
  {
    v12[0] = v8;
    swift_unknownObjectRetain_n();
    if (swift_dynamicCast())
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      uint64_t result = swift_unknownObjectRelease();
      *a3 = v8;
      return result;
    }
  }
  else
  {
    sub_2487E4C40();
    __break(1u);
  }
  uint64_t result = sub_2487E4C60();
  __break(1u);
  return result;
}

uint64_t sub_2487DC178(void *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a3;
  swift_unknownObjectRetain();
  char v8 = sub_2487DD07C(v6, v7, a4);
  uint64_t v10 = v9;
  swift_unknownObjectRelease();
  if (v10)
  {
    swift_unknownObjectRetain_n();
    if (swift_dynamicCast())
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      *a1 = v10;
      return v8 & 1;
    }
  }
  else
  {
    sub_2487E4C40();
    __break(1u);
  }
  uint64_t result = sub_2487E4C60();
  __break(1u);
  return result;
}

uint64_t sub_2487DC2D4(void *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  return sub_2487DC32C(a1, a2, a3, a4) & 1;
}

uint64_t sub_2487DC300(void *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  return sub_2487DC32C(a1, a2, a3, a4) & 1;
}

uint64_t sub_2487DC32C(void *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a3;
  swift_unknownObjectRetain();
  char v8 = sub_2487DD07C(v6, v7, a4);
  uint64_t v10 = v9;
  swift_unknownObjectRelease();
  if (v10)
  {
    swift_unknownObjectRetain_n();
    if (swift_dynamicCast())
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      *a1 = v10;
      return v8 & 1;
    }
  }
  else
  {
    sub_2487E4C40();
    __break(1u);
  }
  uint64_t result = sub_2487E4C60();
  __break(1u);
  return result;
}

uint64_t (*AtomicOptionalReferenceStorage._storage.modify())()
{
  return nullsub_1;
}

uint64_t AtomicOptionalReferenceStorage.dispose()(uint64_t a1, __int16 a2)
{
  if (!_AtomicReferenceStorage.dispose()(a1, a2)) {
    return a1;
  }
  swift_unknownObjectRetain();
  if (swift_dynamicCast())
  {
    swift_unknownObjectRelease();
    return a1;
  }
  uint64_t result = sub_2487E4C60();
  __break(1u);
  return result;
}

void sub_2487DC568(void *a1@<X8>)
{
  AtomicOptionalReferenceStorage.init(_:)();
  *a1 = v2;
  a1[1] = 0;
}

uint64_t sub_2487DC594@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = AtomicOptionalReferenceStorage.dispose()(*v1, v1[1]);
  *a1 = v3;
  return result;
}

uint64_t sub_2487DC5D0@<X0>(uint64_t *a1@<X8>)
{
  _X4 = 0;
  _X5 = 0;
  __asm { CASP            X4, X5, X4, X5, [X0] }
  if (_X4)
  {
    while (1)
    {
      _X8 = _X4;
      _X7 = 0;
      __asm { CASPA           X6, X7, X8, X9, [X2] }
      if (_X6 == _X4) {
        break;
      }
      _X4 = _X6;
      if (!_X6)
      {
        uint64_t v12 = 0;
        goto LABEL_7;
      }
    }
    uint64_t v12 = _X4;
    _X5 = 1;
  }
  else
  {
    uint64_t v12 = 0;
    __dmb(9u);
  }
LABEL_7:
  uint64_t result = sub_2487DCAFC(v12, _X5);
  uint64_t v14 = result;
  if (!result) {
    goto LABEL_10;
  }
  swift_unknownObjectRetain_n();
  if (swift_dynamicCast())
  {
    swift_unknownObjectRelease();
    uint64_t result = swift_unknownObjectRelease();
LABEL_10:
    *a1 = v14;
    return result;
  }
  uint64_t result = sub_2487E4C60();
  __break(1u);
  return result;
}

uint64_t sub_2487DC758@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = *a1;
  swift_unknownObjectRetain_n();
  v12[0] = sub_2487DCCBC(a2, 0, 0, 1);
  v12[1] = v6;
  if (sub_2487DCD94(v12, v5, a2))
  {
    uint64_t v8 = v7;
  }
  else
  {
    do
    {
      char v9 = sub_2487DCD94(v12, v5, a2);
      uint64_t v8 = v10;
      swift_unknownObjectRelease();
    }
    while ((v9 & 1) == 0);
  }
  swift_unknownObjectRelease();
  if (!v8) {
    goto LABEL_7;
  }
  v12[0] = v8;
  swift_unknownObjectRetain_n();
  if (swift_dynamicCast())
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
LABEL_7:
    uint64_t result = swift_unknownObjectRelease();
    *a3 = v8;
    return result;
  }
  uint64_t result = sub_2487E4C60();
  __break(1u);
  return result;
}

uint64_t sub_2487DC8C0(void *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a3;
  swift_unknownObjectRetain();
  char v8 = sub_2487DD07C(v6, v7, a4);
  uint64_t v10 = v9;
  swift_unknownObjectRelease();
  if (!v10) {
    goto LABEL_4;
  }
  swift_unknownObjectRetain_n();
  if (swift_dynamicCast())
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
LABEL_4:
    swift_unknownObjectRelease();
    *a1 = v10;
    return v8 & 1;
  }
  uint64_t result = sub_2487E4C60();
  __break(1u);
  return result;
}

uint64_t sub_2487DC9E0(void *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v6 = *a2;
  uint64_t v7 = *a3;
  swift_unknownObjectRetain();
  char v8 = sub_2487DD07C(v6, v7, a4);
  uint64_t v10 = v9;
  swift_unknownObjectRelease();
  if (!v10) {
    goto LABEL_4;
  }
  swift_unknownObjectRetain_n();
  if (swift_dynamicCast())
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
LABEL_4:
    swift_unknownObjectRelease();
    *a1 = v10;
    return v8 & 1;
  }
  uint64_t result = sub_2487E4C60();
  __break(1u);
  return result;
}

uint64_t sub_2487DCAFC(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return a1;
  }
  uint64_t v4 = swift_unknownObjectRetain();
  while ((_WORD)a2)
  {
    _X4 = v4;
    _X3 = a2;
    __asm { CASPAL          X2, X3, X4, X5, [X20] }
    if (_X2 == v4) {
      return a1;
    }
    if (_X2) {
      _ZF = _X2 == a1;
    }
    else {
      _ZF = 0;
    }
    if (!_ZF)
    {
      swift_unknownObjectRelease();
      return a1;
    }
    uint64_t v4 = _X2;
  }
  uint64_t result = sub_2487E4C50();
  __break(1u);
  return result;
}

uint64_t _s15AtomicsInternal23_AtomicReferenceStorageV10atomicLoad2atyXlSgSpyACG_tFZ_0()
{
  _X4 = 0;
  _X5 = 0;
  __asm { CASP            X4, X5, X4, X5, [X0] }
  if (_X4)
  {
    while (1)
    {
      _X8 = _X4;
      _X7 = 0;
      __asm { CASPA           X6, X7, X8, X9, [X2] }
      if (_X6 == _X4) {
        break;
      }
      _X4 = _X6;
      if (!_X6)
      {
        uint64_t v10 = 0;
        goto LABEL_7;
      }
    }
    uint64_t v10 = _X4;
    _X5 = 1;
  }
  else
  {
    uint64_t v10 = 0;
    __dmb(9u);
  }
LABEL_7:
  return sub_2487DCAFC(v10, _X5);
}

uint64_t sub_2487DCCBC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _X5 = a3;
  _X4 = a2;
  if (a4)
  {
    _X4 = 0;
    _X5 = 0;
    __asm { CASP            X4, X5, X4, X5, [X0] }
  }
  if (_X4)
  {
    while ((_WORD)_X5 != 0xFFFF)
    {
      _X6 = _X4;
      _X3 = _X5;
      __asm { CASPA           X2, X3, X6, X7, [X0] }
      if (_X2 == _X4) {
        return _X4;
      }
      _X4 = _X2;
      if (!_X2) {
        return 0;
      }
    }
    uint64_t result = sub_2487E4C50();
    __break(1u);
  }
  else
  {
    uint64_t result = 0;
    __dmb(9u);
  }
  return result;
}

uint64_t sub_2487DCD94(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _X24 = a2;
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  if (*a1)
  {
    uint64_t v8 = (unsigned __int16)a1[1];
    if (!(unsigned __int16)a1[1]) {
      goto LABEL_34;
    }
    sub_2487DBAA8(v8 + 20, v6, (uint64_t (*)(uint64_t, unint64_t))_sa_retain_n);
    _X27 = v7;
    __asm { CASPAL          X26, X27, X24, X25, [X22] }
    if (_X26 == v6)
    {
      uint64_t v14 = v6;
      _X24 = _X26;
      LOWORD(_X25) = v7;
      uint64_t v22 = v8 + 20;
    }
    else
    {
      _X0 = _X24;
      unint64_t v20 = (v7 & 0xFFFFFFFFFFFF0000) + 0x10000;
      uint64_t v21 = v6;
      uint64_t v22 = v8 + 20;
      while (1)
      {
        if (!_X26) {
          goto LABEL_27;
        }
        if (_X26 != v21) {
          goto LABEL_27;
        }
        uint64_t v8 = (unsigned __int16)v7;
        if (!(_WORD)v7) {
          goto LABEL_27;
        }
        if (v22 < (unsigned __int16)v7)
        {
          uint64_t v23 = a3;
          uint64_t v24 = _X0;
          unint64_t v25 = v20;
          if ((unsigned __int16)v7 + 20 - v22 < 0) {
            goto LABEL_28;
          }
          _sa_retain_n();
          uint64_t v22 = (unsigned __int16)v7 + 20;
          _X0 = v24;
          unint64_t v20 = v25;
          a3 = v23;
        }
        *a1 = _X26;
        a1[1] = v7;
        _X25 = v7;
        __asm { CASPAL          X24, X25, X0, X1, [X22] }
        if (_X24 == _X26) {
          break;
        }
        uint64_t v21 = _X26;
        _X26 = _X24;
      }
      uint64_t v14 = _X26;
    }
    if ((unsigned __int16)_X25 != v8 || (_X24 ? (_ZF = _X24 == v14) : (_ZF = 0), !_ZF || v22 < (unsigned __int16)_X25))
    {
LABEL_34:
      while (1)
      {
LABEL_27:
        sub_2487E4C50();
        __break(1u);
LABEL_28:
        sub_2487E4C40();
        __break(1u);
      }
    }
    sub_2487DBAA8(v22 - (unsigned __int16)_X25 + 1, v6, (uint64_t (*)(uint64_t, unint64_t))_sa_release_n);
  }
  else
  {
    _X3 = a1[1];
    __asm { CASPAL          X2, X3, X24, X25, [X22] }
    if (_X2)
    {
      uint64_t v26 = sub_2487DCCBC(a3, _X2, v7, 0);
      uint64_t result = 0;
      *a1 = v26;
      a1[1] = v28;
      return result;
    }
  }
  return 1;
}

uint64_t sub_2487DD07C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_unknownObjectRetain();
  uint64_t v6 = sub_2487DCCBC(a3, 0, 0, 1);
  uint64_t v10 = v6;
  uint64_t v11 = v7;
  if (!v6) {
    goto LABEL_5;
  }
LABEL_2:
  if (a1 && v6 == a1)
  {
    while ((sub_2487DCD94(&v10, a2, a3) & 1) == 0)
    {
      swift_unknownObjectRelease();
      uint64_t v6 = v10;
      if (v10) {
        goto LABEL_2;
      }
LABEL_5:
      if (a1) {
        goto LABEL_9;
      }
    }
    if (v8)
    {
      if (!a1 || v8 != a1) {
        goto LABEL_18;
      }
    }
    else if (a1)
    {
LABEL_18:
      uint64_t result = sub_2487E4C50();
      __break(1u);
      return result;
    }
    return 1;
  }
LABEL_9:
  if (a2) {
    swift_unknownObjectRelease();
  }
  sub_2487DCAFC(v6, v11);
  return 0;
}

ValueMetadata *type metadata accessor for _AtomicReferenceStorage()
{
  return &type metadata for _AtomicReferenceStorage;
}

uint64_t sub_2487DD1AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 16);
}

uint64_t type metadata accessor for AtomicReferenceStorage()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for AtomicOptionalReferenceStorage()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2487DD1EC()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t Bool.AtomicRepresentation._storage.setter(uint64_t result)
{
  unsigned char *v1 = result;
  return result;
}

uint64_t (*Bool.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

_UNKNOWN **sub_2487DD238()
{
  return &protocol witness table for Bool.AtomicRepresentation;
}

void sub_2487DD244(unsigned char *a1@<X8>)
{
  *a1 = *v1 & 1;
}

unsigned __int8 *sub_2487DD254@<X0>(unsigned __int8 *result@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  switch(a2)
  {
    case 5:
      unsigned __int8 explicit = atomic_load(result);
      goto LABEL_7;
    case 2:
      unsigned __int8 explicit = atomic_load_explicit((atomic_uchar *volatile)result, memory_order_acquire);
LABEL_7:
      *a3 = explicit & 1;
      return result;
    case 0:
      unsigned __int8 explicit = *result;
      goto LABEL_7;
  }
  uint64_t result = (unsigned __int8 *)sub_2487E4C50();
  __break(1u);
  return result;
}

unsigned __int8 *sub_2487DD2EC@<X0>(unsigned __int8 *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unsigned char *a4@<X8>)
{
  unsigned int v4 = *result;
  switch(a3)
  {
    case 0:
      unsigned __int8 v5 = __swp(v4, a2);
      break;
    case 2:
      unsigned __int8 v5 = atomic_exchange_explicit((atomic_uchar *volatile)a2, v4, memory_order_acquire);
      break;
    case 3:
      unsigned __int8 v5 = atomic_exchange_explicit((atomic_uchar *volatile)a2, v4, memory_order_release);
      break;
    case 4:
    case 5:
      unsigned __int8 v5 = atomic_exchange((atomic_uchar *volatile)a2, v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487DD3A8);
  }
  *a4 = v5 & 1;
  return result;
}

BOOL sub_2487DD3C0(unsigned char *a1, unsigned __int8 *a2, unsigned __int8 *a3, atomic_uchar *a4, uint64_t a5)
{
  int v5 = *a2;
  unsigned __int8 v6 = *a3;
  switch(a5)
  {
    case 0:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v7, v6, memory_order_relaxed, memory_order_relaxed);
      break;
    case 2:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v7, v6, memory_order_acquire, memory_order_acquire);
      break;
    case 3:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v7, v6, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      int v7 = *a2;
      atomic_compare_exchange_strong(a4, (unsigned __int8 *)&v7, v6);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487DD49CLL);
  }
  *a1 = v7 & 1;
  return v7 == v5;
}

uint64_t sub_2487DD4B4(unsigned char *a1, unsigned char *a2, unsigned char *a3, atomic_uchar *a4, uint64_t a5, uint64_t a6)
{
  if (*a2)
  {
    if (*a3)
    {
      int v6 = 1;
      switch(a5)
      {
        case 0:
          goto LABEL_12;
        case 2:
          goto LABEL_36;
        case 3:
          goto LABEL_39;
        case 4:
          goto LABEL_31;
        default:
          goto LABEL_17;
      }
    }
    switch(a5)
    {
      case 0:
        LOBYTE(v6) = 0;
LABEL_12:
        int v7 = 1;
        if (!a6) {
          goto LABEL_16;
        }
        goto LABEL_45;
      case 2:
        LOBYTE(v6) = 0;
LABEL_36:
        int v7 = 1;
        if (!a6) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 3:
        LOBYTE(v6) = 0;
LABEL_39:
        int v7 = 1;
        if (a6) {
          goto LABEL_40;
        }
        goto LABEL_55;
      case 4:
        LOBYTE(v6) = 0;
LABEL_31:
        int v7 = 1;
        if (!a6) {
          goto LABEL_48;
        }
        goto LABEL_40;
      case 5:
        unsigned __int8 v9 = 0;
        int v6 = 1;
        if (!a6) {
          goto LABEL_59;
        }
        goto LABEL_57;
      default:
        goto LABEL_60;
    }
  }
  if (*a3)
  {
    int v6 = 0;
    switch(a5)
    {
      case 0:
        int v7 = 0;
        LOBYTE(v6) = 1;
        if (a6 == 5) {
          goto LABEL_48;
        }
        if (a6 == 2) {
          goto LABEL_46;
        }
        if (a6) {
          goto LABEL_60;
        }
        goto LABEL_16;
      case 2:
        int v7 = 0;
        LOBYTE(v6) = 1;
        if (!a6) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 3:
        int v7 = 0;
        LOBYTE(v6) = 1;
        if (a6 == 5 || a6 == 2) {
          goto LABEL_48;
        }
        if (a6) {
          goto LABEL_60;
        }
        goto LABEL_55;
      case 4:
        int v7 = 0;
        LOBYTE(v6) = 1;
        if (!a6) {
          goto LABEL_48;
        }
        goto LABEL_40;
      default:
LABEL_17:
        if (a5 != 5) {
          goto LABEL_60;
        }
        unsigned __int8 v9 = 1;
        if (a6 != 5 && a6 != 2 && a6) {
          goto LABEL_60;
        }
        goto LABEL_59;
    }
  }
  switch(a5)
  {
    case 0:
      LOBYTE(v6) = 0;
      int v7 = 0;
      if (a6) {
        goto LABEL_45;
      }
LABEL_16:
      int v8 = v7;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v8, v6, memory_order_relaxed, memory_order_relaxed);
      goto LABEL_49;
    case 2:
      LOBYTE(v6) = 0;
      int v7 = 0;
      if (!a6) {
        goto LABEL_46;
      }
LABEL_45:
      if (a6 != 2) {
        goto LABEL_47;
      }
LABEL_46:
      int v8 = v7;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v8, v6, memory_order_acquire, memory_order_acquire);
      goto LABEL_49;
    case 3:
      LOBYTE(v6) = 0;
      int v7 = 0;
      if (a6) {
        goto LABEL_40;
      }
LABEL_55:
      int v8 = v7;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v8, v6, memory_order_release, memory_order_relaxed);
      goto LABEL_49;
    case 4:
      LOBYTE(v6) = 0;
      int v7 = 0;
      if (!a6) {
        goto LABEL_48;
      }
LABEL_40:
      if (a6 == 2) {
        goto LABEL_48;
      }
LABEL_47:
      if (a6 != 5) {
        goto LABEL_60;
      }
LABEL_48:
      int v8 = v7;
      atomic_compare_exchange_strong(a4, (unsigned __int8 *)&v8, v6);
LABEL_49:
      BOOL v10 = v8 == v7;
      break;
    case 5:
      unsigned __int8 v9 = 0;
      int v6 = 0;
      if (!a6) {
        goto LABEL_59;
      }
LABEL_57:
      if (a6 != 2 && a6 != 5)
      {
LABEL_60:
        sub_2487E4BB0();
        sub_2487E4C50();
        __break(1u);
        JUMPOUT(0x2487DD778);
      }
LABEL_59:
      int v8 = v6;
      atomic_compare_exchange_strong(a4, (unsigned __int8 *)&v8, v9);
      BOOL v10 = v8 == v6;
      break;
    default:
      goto LABEL_60;
  }
  char v11 = v10;
  *a1 = v8 & 1;
  return v11 & 1;
}

uint64_t sub_2487DD7D0(unsigned char *a1, unsigned char *a2, unsigned char *a3, atomic_uchar *a4, uint64_t a5, uint64_t a6)
{
  if (*a2)
  {
    if (*a3)
    {
      int v6 = 1;
      switch(a5)
      {
        case 0:
          goto LABEL_12;
        case 2:
          goto LABEL_36;
        case 3:
          goto LABEL_39;
        case 4:
          goto LABEL_31;
        default:
          goto LABEL_17;
      }
    }
    switch(a5)
    {
      case 0:
        LOBYTE(v6) = 0;
LABEL_12:
        int v7 = 1;
        if (!a6) {
          goto LABEL_16;
        }
        goto LABEL_45;
      case 2:
        LOBYTE(v6) = 0;
LABEL_36:
        int v7 = 1;
        if (!a6) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 3:
        LOBYTE(v6) = 0;
LABEL_39:
        int v7 = 1;
        if (a6) {
          goto LABEL_40;
        }
        goto LABEL_55;
      case 4:
        LOBYTE(v6) = 0;
LABEL_31:
        int v7 = 1;
        if (!a6) {
          goto LABEL_48;
        }
        goto LABEL_40;
      case 5:
        unsigned __int8 v9 = 0;
        int v6 = 1;
        if (!a6) {
          goto LABEL_59;
        }
        goto LABEL_57;
      default:
        goto LABEL_60;
    }
  }
  if (*a3)
  {
    int v6 = 0;
    switch(a5)
    {
      case 0:
        int v7 = 0;
        LOBYTE(v6) = 1;
        if (a6 == 5) {
          goto LABEL_48;
        }
        if (a6 == 2) {
          goto LABEL_46;
        }
        if (a6) {
          goto LABEL_60;
        }
        goto LABEL_16;
      case 2:
        int v7 = 0;
        LOBYTE(v6) = 1;
        if (!a6) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 3:
        int v7 = 0;
        LOBYTE(v6) = 1;
        if (a6 == 5 || a6 == 2) {
          goto LABEL_48;
        }
        if (a6) {
          goto LABEL_60;
        }
        goto LABEL_55;
      case 4:
        int v7 = 0;
        LOBYTE(v6) = 1;
        if (!a6) {
          goto LABEL_48;
        }
        goto LABEL_40;
      default:
LABEL_17:
        if (a5 != 5) {
          goto LABEL_60;
        }
        unsigned __int8 v9 = 1;
        if (a6 != 5 && a6 != 2 && a6) {
          goto LABEL_60;
        }
        goto LABEL_59;
    }
  }
  switch(a5)
  {
    case 0:
      LOBYTE(v6) = 0;
      int v7 = 0;
      if (a6) {
        goto LABEL_45;
      }
LABEL_16:
      int v8 = v7;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v8, v6, memory_order_relaxed, memory_order_relaxed);
      goto LABEL_49;
    case 2:
      LOBYTE(v6) = 0;
      int v7 = 0;
      if (!a6) {
        goto LABEL_46;
      }
LABEL_45:
      if (a6 != 2) {
        goto LABEL_47;
      }
LABEL_46:
      int v8 = v7;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v8, v6, memory_order_acquire, memory_order_acquire);
      goto LABEL_49;
    case 3:
      LOBYTE(v6) = 0;
      int v7 = 0;
      if (a6) {
        goto LABEL_40;
      }
LABEL_55:
      int v8 = v7;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v8, v6, memory_order_release, memory_order_relaxed);
      goto LABEL_49;
    case 4:
      LOBYTE(v6) = 0;
      int v7 = 0;
      if (!a6) {
        goto LABEL_48;
      }
LABEL_40:
      if (a6 == 2) {
        goto LABEL_48;
      }
LABEL_47:
      if (a6 != 5) {
        goto LABEL_60;
      }
LABEL_48:
      int v8 = v7;
      atomic_compare_exchange_strong(a4, (unsigned __int8 *)&v8, v6);
LABEL_49:
      BOOL v10 = v8 == v7;
      break;
    case 5:
      unsigned __int8 v9 = 0;
      int v6 = 0;
      if (!a6) {
        goto LABEL_59;
      }
LABEL_57:
      if (a6 != 2 && a6 != 5)
      {
LABEL_60:
        sub_2487E4BB0();
        sub_2487E4C50();
        __break(1u);
        JUMPOUT(0x2487DDA94);
      }
LABEL_59:
      int v8 = v6;
      atomic_compare_exchange_strong(a4, (unsigned __int8 *)&v8, v9);
      BOOL v10 = v8 == v6;
      break;
    default:
      goto LABEL_60;
  }
  char v11 = v10;
  *a1 = v8 & 1;
  return v11 & 1;
}

ValueMetadata *type metadata accessor for Bool.AtomicRepresentation()
{
  return &type metadata for Bool.AtomicRepresentation;
}

uint64_t sub_2487DDB00@<X0>(void *a1@<X8>)
{
  if (*v1)
  {
    *a1 = *v1;
  }
  else
  {
    uint64_t result = sub_2487E4C40();
    __break(1u);
  }
  return result;
}

unint64_t *sub_2487DDB70@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_2487DDF0C(result, a2, a3);
}

unint64_t *sub_2487DDB7C@<X0>(unint64_t *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_2487DE07C(result, a2, a3, a4);
}

BOOL sub_2487DDB84(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5)
{
  return sub_2487DE19C(a1, a2, a3, a4, a5);
}

BOOL sub_2487DDB8C(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5, uint64_t a6)
{
  return sub_2487DE300(a1, a2, a3, a4, a5, a6);
}

BOOL sub_2487DDBB8(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5, uint64_t a6)
{
  return sub_2487DE4C0(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_2487DDBE8@<X0>(void *a1@<X8>)
{
  if (*v1)
  {
    *a1 = *v1;
  }
  else
  {
    uint64_t result = sub_2487E4C40();
    __break(1u);
  }
  return result;
}

unint64_t *sub_2487DDC58@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_2487DDF0C(result, a2, a3);
}

unint64_t *sub_2487DDC60@<X0>(unint64_t *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_2487DE07C(result, a2, a3, a4);
}

BOOL sub_2487DDC68(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5)
{
  return sub_2487DE19C(a1, a2, a3, a4, a5);
}

BOOL sub_2487DDC70(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5, uint64_t a6)
{
  return sub_2487DE300(a1, a2, a3, a4, a5, a6);
}

BOOL sub_2487DDC9C(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5, uint64_t a6)
{
  return sub_2487DE4C0(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_2487DDCCC@<X0>(void *a1@<X8>)
{
  if (*v1)
  {
    *a1 = *v1;
  }
  else
  {
    uint64_t result = sub_2487E4C40();
    __break(1u);
  }
  return result;
}

unint64_t *sub_2487DDD3C@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_2487DDF0C(result, a2, a3);
}

unint64_t *sub_2487DDD44@<X0>(unint64_t *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_2487DE07C(result, a2, a3, a4);
}

BOOL sub_2487DDD4C(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5)
{
  return sub_2487DE19C(a1, a2, a3, a4, a5);
}

BOOL sub_2487DDD54(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5, uint64_t a6)
{
  return sub_2487DE300(a1, a2, a3, a4, a5, a6);
}

BOOL sub_2487DDD80(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5, uint64_t a6)
{
  return sub_2487DE4C0(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_2487DDDB0@<X0>(void *a1@<X8>)
{
  if (*v1)
  {
    *a1 = *v1;
  }
  else
  {
    uint64_t result = sub_2487E4C40();
    __break(1u);
  }
  return result;
}

unint64_t *sub_2487DDE20@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_2487DDF0C(result, a2, a3);
}

unint64_t *sub_2487DDE28@<X0>(unint64_t *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_2487DE07C(result, a2, a3, a4);
}

BOOL sub_2487DDE30(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5)
{
  return sub_2487DE19C(a1, a2, a3, a4, a5);
}

BOOL sub_2487DDE38(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5, uint64_t a6)
{
  return sub_2487DE300(a1, a2, a3, a4, a5, a6);
}

BOOL sub_2487DDE64(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5, uint64_t a6)
{
  return sub_2487DE4C0(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_2487DDE94@<X0>(void *a1@<X8>)
{
  if (*v1)
  {
    *a1 = *v1;
  }
  else
  {
    uint64_t result = sub_2487E4C40();
    __break(1u);
  }
  return result;
}

unint64_t *sub_2487DDF04@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_2487DDF0C(result, a2, a3);
}

unint64_t *sub_2487DDF0C@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  if (a2 == 5)
  {
    unint64_t explicit = atomic_load(result);
  }
  else if (a2 == 2)
  {
    unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)result, memory_order_acquire);
  }
  else
  {
    if (a2) {
      goto LABEL_10;
    }
    unint64_t explicit = *result;
  }
  if (explicit)
  {
    *a3 = explicit;
    return result;
  }
  sub_2487E4C40();
  __break(1u);
LABEL_10:
  uint64_t result = (unint64_t *)sub_2487E4C50();
  __break(1u);
  return result;
}

unint64_t *sub_2487DDFE8(unint64_t *result, unint64_t *a2, uint64_t a3)
{
  unint64_t v3 = *result;
  if (a3 == 5 || a3 == 3)
  {
    atomic_store(v3, a2);
  }
  else if (a3)
  {
    uint64_t result = (unint64_t *)sub_2487E4C50();
    __break(1u);
  }
  else
  {
    *a2 = v3;
  }
  return result;
}

unint64_t *sub_2487DE074@<X0>(unint64_t *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_2487DE07C(result, a2, a3, a4);
}

unint64_t *sub_2487DE07C@<X0>(unint64_t *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  unint64_t v4 = *result;
  switch(a3)
  {
    case 0:
      unint64_t v5 = __swp(v4, a2);
      goto LABEL_6;
    case 2:
      unint64_t v5 = atomic_exchange_explicit((atomic_ullong *volatile)a2, v4, memory_order_acquire);
      goto LABEL_6;
    case 3:
      unint64_t v5 = atomic_exchange_explicit((atomic_ullong *volatile)a2, v4, memory_order_release);
      goto LABEL_6;
    case 4:
    case 5:
      unint64_t v5 = atomic_exchange((atomic_ullong *volatile)a2, v4);
LABEL_6:
      if (!v5) {
        goto LABEL_9;
      }
      *a4 = v5;
      return result;
    default:
      sub_2487E4C50();
      __break(1u);
LABEL_9:
      sub_2487E4C40();
      __break(1u);
      JUMPOUT(0x2487DE17CLL);
  }
}

BOOL sub_2487DE194(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5)
{
  return sub_2487DE19C(a1, a2, a3, a4, a5);
}

BOOL sub_2487DE19C(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5)
{
  uint64_t v5 = *a2;
  unint64_t v6 = *a3;
  switch(a5)
  {
    case 0:
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v7, v6, memory_order_relaxed, memory_order_relaxed);
      goto LABEL_6;
    case 2:
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v7, v6, memory_order_acquire, memory_order_acquire);
      goto LABEL_6;
    case 3:
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v7, v6, memory_order_release, memory_order_relaxed);
      goto LABEL_6;
    case 4:
    case 5:
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong(a4, (unint64_t *)&v7, v6);
LABEL_6:
      BOOL v8 = v7 == v5;
      if (!v7) {
        goto LABEL_9;
      }
      *a1 = v7;
      return v8;
    default:
      sub_2487E4C50();
      __break(1u);
LABEL_9:
      sub_2487E4C40();
      __break(1u);
      JUMPOUT(0x2487DE2BCLL);
  }
}

BOOL sub_2487DE2D4(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5, uint64_t a6)
{
  return sub_2487DE300(a1, a2, a3, a4, a5, a6);
}

BOOL sub_2487DE300(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *a2;
  unint64_t v7 = *a3;
  switch(a5)
  {
    case 0:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 == 2) {
        goto LABEL_12;
      }
      if (a6) {
        goto LABEL_22;
      }
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v7, memory_order_relaxed, memory_order_relaxed);
      goto LABEL_16;
    case 2:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 != 2 && a6) {
        goto LABEL_22;
      }
LABEL_12:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v7, memory_order_acquire, memory_order_acquire);
      goto LABEL_16;
    case 3:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_15;
      }
      if (a6) {
        goto LABEL_22;
      }
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v7, memory_order_release, memory_order_relaxed);
LABEL_16:
      BOOL v9 = v8 == v6;
      if (!v8) {
        goto LABEL_23;
      }
      *a1 = v8;
      return v9;
    case 4:
    case 5:
      if (a6 != 5 && a6 != 2 && a6) {
        goto LABEL_22;
      }
LABEL_15:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong(a4, (unint64_t *)&v8, v7);
      goto LABEL_16;
    default:
LABEL_22:
      sub_2487E4C50();
      __break(1u);
LABEL_23:
      sub_2487E4C40();
      __break(1u);
      JUMPOUT(0x2487DE47CLL);
  }
}

BOOL sub_2487DE494(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5, uint64_t a6)
{
  return sub_2487DE4C0(a1, a2, a3, a4, a5, a6);
}

BOOL sub_2487DE4C0(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *a2;
  unint64_t v7 = *a3;
  switch(a5)
  {
    case 0:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 == 2) {
        goto LABEL_12;
      }
      if (a6) {
        goto LABEL_22;
      }
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v7, memory_order_relaxed, memory_order_relaxed);
      goto LABEL_16;
    case 2:
      if (a6 == 5) {
        goto LABEL_15;
      }
      if (a6 != 2 && a6) {
        goto LABEL_22;
      }
LABEL_12:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v7, memory_order_acquire, memory_order_acquire);
      goto LABEL_16;
    case 3:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_15;
      }
      if (a6) {
        goto LABEL_22;
      }
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v7, memory_order_release, memory_order_relaxed);
LABEL_16:
      BOOL v9 = v8 == v6;
      if (!v8) {
        goto LABEL_23;
      }
      *a1 = v8;
      return v9;
    case 4:
    case 5:
      if (a6 != 5 && a6 != 2 && a6) {
        goto LABEL_22;
      }
LABEL_15:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong(a4, (unint64_t *)&v8, v7);
      goto LABEL_16;
    default:
LABEL_22:
      sub_2487E4C50();
      __break(1u);
LABEL_23:
      sub_2487E4C40();
      __break(1u);
      JUMPOUT(0x2487DE63CLL);
  }
}

_UNKNOWN **sub_2487DE67C()
{
  return &protocol witness table for UnsafeRawPointer.AtomicRepresentation;
}

_UNKNOWN **sub_2487DE688()
{
  return &protocol witness table for UnsafeMutableRawPointer.AtomicRepresentation;
}

uint64_t sub_2487DE694()
{
  return swift_getWitnessTable();
}

uint64_t sub_2487DE6B0()
{
  return swift_getWitnessTable();
}

uint64_t sub_2487DE6CC()
{
  return swift_getWitnessTable();
}

_UNKNOWN **sub_2487DE6E8()
{
  return &protocol witness table for UnsafeRawPointer.AtomicOptionalRepresentation;
}

_UNKNOWN **sub_2487DE6F4()
{
  return &protocol witness table for UnsafeMutableRawPointer.AtomicOptionalRepresentation;
}

uint64_t sub_2487DE700()
{
  return swift_getWitnessTable();
}

uint64_t sub_2487DE71C(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2487DE758()
{
  return swift_getWitnessTable();
}

uint64_t sub_2487DE774(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2487DE7B0()
{
  return swift_getWitnessTable();
}

uint64_t sub_2487DE7CC(uint64_t a1)
{
  uint64_t result = swift_getWitnessTable();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t *sub_2487DE808@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  switch(a2)
  {
    case 5:
      unint64_t explicit = atomic_load(result);
      goto LABEL_7;
    case 2:
      unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)result, memory_order_acquire);
LABEL_7:
      *a3 = explicit;
      return result;
    case 0:
      unint64_t explicit = *result;
      goto LABEL_7;
  }
  uint64_t result = (unint64_t *)sub_2487E4C50();
  __break(1u);
  return result;
}

unint64_t *sub_2487DE89C@<X0>(unint64_t *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  unint64_t v4 = *result;
  switch(a3)
  {
    case 0:
      unint64_t v5 = __swp(v4, a2);
      break;
    case 2:
      unint64_t v5 = atomic_exchange_explicit((atomic_ullong *volatile)a2, v4, memory_order_acquire);
      break;
    case 3:
      unint64_t v5 = atomic_exchange_explicit((atomic_ullong *volatile)a2, v4, memory_order_release);
      break;
    case 4:
    case 5:
      unint64_t v5 = atomic_exchange((atomic_ullong *volatile)a2, v4);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487DE954);
  }
  *a4 = v5;
  return result;
}

BOOL sub_2487DE96C(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5)
{
  uint64_t v5 = *a2;
  unint64_t v6 = *a3;
  switch(a5)
  {
    case 0:
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v7, v6, memory_order_relaxed, memory_order_relaxed);
      break;
    case 2:
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v7, v6, memory_order_acquire, memory_order_acquire);
      break;
    case 3:
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v7, v6, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong(a4, (unint64_t *)&v7, v6);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487DEA44);
  }
  *a1 = v7;
  return v7 == v5;
}

BOOL sub_2487DEA5C(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *a2;
  unint64_t v7 = *a3;
  if (*a3)
  {
    switch(a5)
    {
      case 0:
        if (a6 == 5) {
          goto LABEL_30;
        }
        if (a6 == 2) {
          goto LABEL_26;
        }
        if (a6) {
          goto LABEL_34;
        }
        goto LABEL_32;
      case 2:
        if (a6 == 5) {
          goto LABEL_30;
        }
        if (a6 != 2 && a6) {
          goto LABEL_34;
        }
        goto LABEL_26;
      case 3:
        if (a6 == 5 || a6 == 2) {
          goto LABEL_30;
        }
        if (a6) {
          goto LABEL_34;
        }
        goto LABEL_33;
      case 4:
      case 5:
        if (a6 != 5 && a6 != 2 && a6) {
          goto LABEL_34;
        }
        goto LABEL_30;
      default:
        goto LABEL_34;
    }
  }
  switch(a5)
  {
    case 0:
      if (a6) {
        goto LABEL_25;
      }
LABEL_32:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v7, memory_order_relaxed, memory_order_relaxed);
      goto LABEL_31;
    case 2:
      if (!a6) {
        goto LABEL_26;
      }
LABEL_25:
      if (a6 != 2) {
        goto LABEL_29;
      }
LABEL_26:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v7, memory_order_acquire, memory_order_acquire);
      goto LABEL_31;
    case 3:
      if (a6) {
        goto LABEL_28;
      }
LABEL_33:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v7, memory_order_release, memory_order_relaxed);
      goto LABEL_31;
    case 4:
    case 5:
      if (!a6) {
        goto LABEL_30;
      }
LABEL_28:
      if (a6 == 2) {
        goto LABEL_30;
      }
LABEL_29:
      if (a6 != 5)
      {
LABEL_34:
        sub_2487E4BB0();
        sub_2487E4C50();
        __break(1u);
        JUMPOUT(0x2487DEBF8);
      }
LABEL_30:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong(a4, (unint64_t *)&v8, v7);
LABEL_31:
      *a1 = v8;
      return v8 == v6;
    default:
      goto LABEL_34;
  }
}

BOOL sub_2487DEC28(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *a2;
  unint64_t v7 = *a3;
  if (*a3)
  {
    switch(a5)
    {
      case 0:
        if (a6 == 5) {
          goto LABEL_30;
        }
        if (a6 == 2) {
          goto LABEL_26;
        }
        if (a6) {
          goto LABEL_34;
        }
        goto LABEL_32;
      case 2:
        if (a6 == 5) {
          goto LABEL_30;
        }
        if (a6 != 2 && a6) {
          goto LABEL_34;
        }
        goto LABEL_26;
      case 3:
        if (a6 == 5 || a6 == 2) {
          goto LABEL_30;
        }
        if (a6) {
          goto LABEL_34;
        }
        goto LABEL_33;
      case 4:
      case 5:
        if (a6 != 5 && a6 != 2 && a6) {
          goto LABEL_34;
        }
        goto LABEL_30;
      default:
        goto LABEL_34;
    }
  }
  switch(a5)
  {
    case 0:
      if (a6) {
        goto LABEL_25;
      }
LABEL_32:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v7, memory_order_relaxed, memory_order_relaxed);
      goto LABEL_31;
    case 2:
      if (!a6) {
        goto LABEL_26;
      }
LABEL_25:
      if (a6 != 2) {
        goto LABEL_29;
      }
LABEL_26:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v7, memory_order_acquire, memory_order_acquire);
      goto LABEL_31;
    case 3:
      if (a6) {
        goto LABEL_28;
      }
LABEL_33:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v7, memory_order_release, memory_order_relaxed);
      goto LABEL_31;
    case 4:
    case 5:
      if (!a6) {
        goto LABEL_30;
      }
LABEL_28:
      if (a6 == 2) {
        goto LABEL_30;
      }
LABEL_29:
      if (a6 != 5)
      {
LABEL_34:
        sub_2487E4BB0();
        sub_2487E4C50();
        __break(1u);
        JUMPOUT(0x2487DEDC4);
      }
LABEL_30:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong(a4, (unint64_t *)&v8, v7);
LABEL_31:
      *a1 = v8;
      return v8 == v6;
    default:
      goto LABEL_34;
  }
}

ValueMetadata *type metadata accessor for UnsafeRawPointer.AtomicRepresentation()
{
  return &type metadata for UnsafeRawPointer.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for UnsafeMutableRawPointer.AtomicRepresentation()
{
  return &type metadata for UnsafeMutableRawPointer.AtomicRepresentation;
}

uint64_t type metadata accessor for UnsafePointer.AtomicRepresentation()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for UnsafeMutablePointer.AtomicRepresentation()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Unmanaged.AtomicRepresentation()
{
  return __swift_instantiateGenericMetadata();
}

ValueMetadata *type metadata accessor for UnsafeRawPointer.AtomicOptionalRepresentation()
{
  return &type metadata for UnsafeRawPointer.AtomicOptionalRepresentation;
}

ValueMetadata *type metadata accessor for UnsafeMutableRawPointer.AtomicOptionalRepresentation()
{
  return &type metadata for UnsafeMutableRawPointer.AtomicOptionalRepresentation;
}

uint64_t type metadata accessor for UnsafePointer.AtomicOptionalRepresentation()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for UnsafeMutablePointer.AtomicOptionalRepresentation()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for Unmanaged.AtomicOptionalRepresentation()
{
  return __swift_instantiateGenericMetadata();
}

BOOL sub_2487DEED4(unsigned char *a1, unsigned __int8 *a2, unsigned __int8 *a3, atomic_uchar *a4, uint64_t a5)
{
  unsigned __int8 v5 = *a3;
  int v6 = *a2;
  switch(a5)
  {
    case 0:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v7, v5, memory_order_relaxed, memory_order_relaxed);
      break;
    case 2:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v7, v5, memory_order_acquire, memory_order_acquire);
      break;
    case 3:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v7, v5, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      int v7 = *a2;
      atomic_compare_exchange_strong(a4, (unsigned __int8 *)&v7, v5);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487DEFACLL);
  }
  *a1 = v7;
  return v7 == v6;
}

BOOL sub_2487DEFC4(_WORD *a1, unsigned __int16 *a2, unsigned __int16 *a3, atomic_ushort *a4, uint64_t a5)
{
  unsigned __int16 v5 = *a3;
  int v6 = *a2;
  switch(a5)
  {
    case 0:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int16 *)&v7, v5, memory_order_relaxed, memory_order_relaxed);
      break;
    case 2:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int16 *)&v7, v5, memory_order_acquire, memory_order_acquire);
      break;
    case 3:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int16 *)&v7, v5, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      int v7 = *a2;
      atomic_compare_exchange_strong(a4, (unsigned __int16 *)&v7, v5);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487DF09CLL);
  }
  *a1 = v7;
  return v7 == v6;
}

BOOL sub_2487DF0B4(_DWORD *a1, int *a2, unsigned int *a3, atomic_uint *a4, uint64_t a5)
{
  unsigned int v5 = *a3;
  int v6 = *a2;
  switch(a5)
  {
    case 0:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned int *)&v7, v5, memory_order_relaxed, memory_order_relaxed);
      break;
    case 2:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned int *)&v7, v5, memory_order_acquire, memory_order_acquire);
      break;
    case 3:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned int *)&v7, v5, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      int v7 = *a2;
      atomic_compare_exchange_strong(a4, (unsigned int *)&v7, v5);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487DF18CLL);
  }
  *a1 = v7;
  return v7 == v6;
}

BOOL sub_2487DF1A4(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5)
{
  unint64_t v5 = *a3;
  uint64_t v6 = *a2;
  switch(a5)
  {
    case 0:
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v7, v5, memory_order_relaxed, memory_order_relaxed);
      break;
    case 2:
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v7, v5, memory_order_acquire, memory_order_acquire);
      break;
    case 3:
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v7, v5, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong(a4, (unint64_t *)&v7, v5);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487DF27CLL);
  }
  *a1 = v7;
  return v7 == v6;
}

BOOL sub_2487DF294(void *a1, void *a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  _X8 = *a3;
  switch(a5)
  {
    case 0:
      _X5 = a2[1];
      __asm { CASP            X4, X5, X8, X9, [X3] }
      break;
    case 2:
      _X5 = a2[1];
      __asm { CASPA           X4, X5, X8, X9, [X3] }
      break;
    case 3:
      _X5 = a2[1];
      __asm { CASPL           X4, X5, X8, X9, [X3] }
      break;
    case 4:
    case 5:
      _X5 = a2[1];
      __asm { CASPAL          X4, X5, X8, X9, [X3] }
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487DF380);
  }
  BOOL v12 = _X4 == *a2 && _X5 == a2[1];
  *a1 = _X4;
  a1[1] = _X5;
  return v12;
}

uint64_t sub_2487DF398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v77 = a4;
  uint64_t v81 = a1;
  uint64_t v10 = *(void *)(a6 + 16);
  uint64_t v9 = *(void *)(a6 + 24);
  uint64_t v74 = a6;
  uint64_t v88 = v9;
  uint64_t AssociatedTypeWitness = (void (*)(char *, uint64_t))swift_getAssociatedTypeWitness();
  uint64_t v11 = sub_2487E4C20();
  uint64_t v76 = *(void *)(v11 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v11);
  uint64_t v73 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  v85 = (char *)&v65 - v14;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v79 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v80 = TupleTypeMetadata2;
  uint64_t v16 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v72 = (char *)&v65 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v75 = (char *)&v65 - v18;
  uint64_t v19 = sub_2487E4C20();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v71 = (char *)&v65 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = MEMORY[0x270FA5388](v21);
  unint64_t v25 = (char *)&v65 - v24;
  MEMORY[0x270FA5388](v23);
  uint64_t v87 = v20;
  uint64_t v26 = *(void (**)(void))(v20 + 16);
  v84 = (char *)&v65 - v27;
  v26();
  if (a5 <= 5 && ((0x3Du >> a5) & 1) != 0)
  {
    unint64_t v78 = a5;
    uint64_t v28 = qword_2487E5710[a5];
    uint64_t v68 = v26;
    ((void (*)(char *, uint64_t, uint64_t))v26)(v25, a2, v19);
    uint64_t v29 = *(void *)(v10 - 8);
    uint64_t v30 = 1;
    uint64_t v66 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48);
    int v31 = v66(v25, 1, v10);
    uint64_t v82 = v11;
    uint64_t v83 = a3;
    uint64_t v70 = v28;
    if (v31 == 1)
    {
      uint64_t v32 = v87;
      uint64_t v33 = v19;
      uint64_t v34 = v85;
    }
    else
    {
      uint64_t v34 = v85;
      sub_2487E4BD0();
      uint64_t v30 = 0;
      uint64_t v32 = v29;
      uint64_t v33 = v10;
    }
    (*(void (**)(char *, uint64_t))(v32 + 8))(v25, v33);
    uint64_t v35 = *(void (**)(char *, uint64_t, uint64_t))(*((void *)AssociatedTypeWitness - 1) + 56);
    uint64_t v36 = 1;
    v35(v34, v30, 1);
    int v37 = v71;
    ((void (*)(char *, char *, uint64_t))v68)(v71, v84, v19);
    int v38 = v66(v37, 1, v10);
    uint64_t v69 = v19;
    uint64_t v67 = v10;
    if (v38 == 1)
    {
      uint64_t v39 = v37;
      uint64_t v29 = v87;
      uint64_t v40 = v19;
      uint64_t v41 = v77;
      uint64_t v43 = v73;
      uint64_t v42 = v74;
    }
    else
    {
      uint64_t v43 = v73;
      sub_2487E4BD0();
      uint64_t v36 = 0;
      uint64_t v40 = v10;
      uint64_t v41 = v77;
      uint64_t v39 = v37;
      uint64_t v42 = v74;
    }
    (*(void (**)(char *, uint64_t))(v29 + 8))(v39, v40);
    ((void (*)(char *, uint64_t, uint64_t, void (*)(char *, uint64_t)))v35)(v43, v36, 1, AssociatedTypeWitness);
    uint64_t v44 = v80;
    v45 = v75;
    uint64_t v46 = &v75[*(int *)(v80 + 48)];
    uint64_t v47 = *(void *)(v42 + 32);
    uint64_t v48 = swift_getAssociatedTypeWitness();
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    uint64_t v50 = v85;
    char v51 = (*(uint64_t (**)(char *, char *, char *, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 80))(v46, v85, v43, v41, v78, v70, v48, AssociatedConformanceWitness);
    uint64_t v52 = v76;
    uint64_t AssociatedTypeWitness = *(void (**)(char *, uint64_t))(v76 + 8);
    uint64_t v53 = v82;
    AssociatedTypeWitness(v50, v82);
    uint64_t v54 = v51 & 1;
    unsigned char *v45 = v54;
    uint64_t v55 = &v72[*(int *)(v44 + 48)];
    *uint64_t v72 = v54;
    uint64_t v56 = (*(uint64_t (**)(char *, char *, uint64_t))(v52 + 16))(v55, v46, v53);
    v85 = (char *)&v65;
    MEMORY[0x270FA5388](v56);
    uint64_t v57 = v67;
    uint64_t v58 = v88;
    *(&v65 - 4) = v67;
    *(&v65 - 3) = v58;
    uint64_t v63 = v47;
    uint64_t v64 = v57;
    sub_2487D8CC0((void (*)(char *, char *))sub_2487E0C30, (uint64_t)(&v65 - 6), MEMORY[0x263F8E628], v57, v59, v81);
    v60 = *(void (**)(uint64_t, uint64_t))(v87 + 8);
    uint64_t v61 = v69;
    v60(v83, v69);
    (*(void (**)(unsigned char *, uint64_t))(v79 + 8))(v45, v44);
    v60((uint64_t)v84, v61);
    AssociatedTypeWitness(v55, v53);
    return v54;
  }
  else
  {
    uint64_t result = sub_2487E4C50();
    __break(1u);
  }
  return result;
}

uint64_t sub_2487DFA7C(void *a1, uint64_t *a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  if ((unint64_t)(a5 - 2) >= 4 && a5 != 0)
  {
    sub_2487E4C50();
    __break(1u);
LABEL_9:
    sub_2487E4C40();
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v8 = *a3;
  uint64_t v9 = *a2;
  swift_unknownObjectRetain_n();
  char v10 = sub_2487DD07C(v9, v8, a4);
  uint64_t v12 = v11;
  swift_unknownObjectRelease();
  if (!v12) {
    goto LABEL_9;
  }
  swift_unknownObjectRetain_n();
  if (swift_dynamicCast())
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    *a1 = v12;
    return v10 & 1;
  }
LABEL_10:
  uint64_t result = sub_2487E4C60();
  __break(1u);
  return result;
}

uint64_t sub_2487DFC3C(void *a1, uint64_t *a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  if ((unint64_t)(a5 - 2) < 4 || a5 == 0)
  {
    uint64_t v8 = *a3;
    uint64_t v9 = *a2;
    swift_unknownObjectRetain_n();
    char v10 = sub_2487DD07C(v9, v8, a4);
    uint64_t v12 = v11;
    swift_unknownObjectRelease();
    if (v12)
    {
      swift_unknownObjectRetain_n();
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_10;
      }
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
    }
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    *a1 = v12;
    return v10 & 1;
  }
  sub_2487E4C50();
  __break(1u);
LABEL_10:
  uint64_t result = sub_2487E4C60();
  __break(1u);
  return result;
}

BOOL sub_2487DFDC0(unsigned char *a1, unsigned __int8 *a2, unsigned __int8 *a3, atomic_uchar *a4, uint64_t a5)
{
  unsigned __int8 v5 = *a3;
  int v6 = *a2;
  switch(a5)
  {
    case 0:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v7, v5, memory_order_relaxed, memory_order_relaxed);
      break;
    case 2:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v7, v5, memory_order_acquire, memory_order_acquire);
      break;
    case 3:
      int v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unsigned __int8 *)&v7, v5, memory_order_release, memory_order_relaxed);
      break;
    case 4:
    case 5:
      int v7 = *a2;
      atomic_compare_exchange_strong(a4, (unsigned __int8 *)&v7, v5);
      break;
    default:
      sub_2487E4BB0();
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487DFEA0);
  }
  *a1 = v7 & 1;
  return v7 == v6;
}

BOOL sub_2487DFEB8(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5)
{
  return sub_2487DFEC8(a1, a2, a3, a4, a5);
}

BOOL sub_2487DFEC0(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5)
{
  return sub_2487DFEC8(a1, a2, a3, a4, a5);
}

BOOL sub_2487DFEC8(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5)
{
  unint64_t v5 = *a3;
  uint64_t v6 = *a2;
  switch(a5)
  {
    case 0:
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v7, v5, memory_order_relaxed, memory_order_relaxed);
      goto LABEL_9;
    case 2:
    case 4:
      if (a5 == 4 || a5 == 3) {
        goto LABEL_4;
      }
      if (a5 != 2) {
        goto LABEL_11;
      }
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v7, v5, memory_order_acquire, memory_order_acquire);
LABEL_9:
      BOOL v8 = v7 == v6;
      if (!v7)
      {
        while (1)
        {
          sub_2487E4C40();
          __break(1u);
LABEL_11:
          sub_2487E4BB0();
          sub_2487E4C50();
          __break(1u);
        }
      }
      *a1 = v7;
      return v8;
    case 3:
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v7, v5, memory_order_release, memory_order_relaxed);
      goto LABEL_9;
    case 5:
LABEL_4:
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong(a4, (unint64_t *)&v7, v5);
      goto LABEL_9;
    default:
      goto LABEL_11;
  }
}

BOOL sub_2487E0064(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5)
{
  return sub_2487E007C(a1, a2, a3, a4, a5);
}

BOOL sub_2487E006C(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5)
{
  return sub_2487E007C(a1, a2, a3, a4, a5);
}

BOOL sub_2487E0074(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5)
{
  return sub_2487E007C(a1, a2, a3, a4, a5);
}

BOOL sub_2487E007C(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5)
{
  unint64_t v5 = *a3;
  switch(a5)
  {
    case 0:
      uint64_t v6 = *a2;
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v7, v5, memory_order_relaxed, memory_order_relaxed);
      goto LABEL_10;
    case 2:
    case 4:
      uint64_t v6 = *a2;
      if (a5 == 4 || a5 == 3) {
        goto LABEL_7;
      }
      if (a5 != 2) {
        goto LABEL_12;
      }
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v7, v5, memory_order_acquire, memory_order_acquire);
LABEL_10:
      if (!v7)
      {
        while (1)
        {
          sub_2487E4C40();
          __break(1u);
LABEL_12:
          sub_2487E4BB0();
          sub_2487E4C50();
          __break(1u);
        }
      }
      *a1 = v7;
      return v7 == v6;
    case 3:
      uint64_t v6 = *a2;
      uint64_t v7 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v7, v5, memory_order_release, memory_order_relaxed);
      goto LABEL_10;
    case 5:
      uint64_t v6 = *a2;
LABEL_7:
      uint64_t v7 = v6;
      atomic_compare_exchange_strong(a4, (unint64_t *)&v7, v5);
      goto LABEL_10;
    default:
      goto LABEL_12;
  }
}

BOOL sub_2487E0228(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5)
{
  unint64_t v5 = *a3;
  uint64_t v6 = *a2;
  uint64_t v7 = 2;
  switch(a5)
  {
    case 0:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v5, memory_order_relaxed, memory_order_relaxed);
LABEL_18:
      *a1 = v8;
      return v8 == v6;
    case 2:
    case 4:
      break;
    case 3:
      uint64_t v7 = 0;
      break;
    case 5:
      uint64_t v7 = 5;
      break;
    default:
LABEL_20:
      sub_2487E4BB0();
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487E0420);
  }
  if (v5)
  {
    switch(a5)
    {
      case 2:
        if (v7 != 5) {
          goto LABEL_15;
        }
        goto LABEL_17;
      case 3:
        if (v7 != 5 && v7 != 2) {
          goto LABEL_19;
        }
        goto LABEL_17;
      case 4:
      case 5:
        goto LABEL_17;
      default:
        goto LABEL_20;
    }
  }
  switch(a5)
  {
    case 2:
      if (v7 && v7 != 2) {
        goto LABEL_17;
      }
LABEL_15:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v5, memory_order_acquire, memory_order_acquire);
      goto LABEL_18;
    case 3:
      if (v7) {
        goto LABEL_17;
      }
LABEL_19:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v5, memory_order_release, memory_order_relaxed);
      goto LABEL_18;
    case 4:
    case 5:
LABEL_17:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong(a4, (unint64_t *)&v8, v5);
      goto LABEL_18;
    default:
      goto LABEL_20;
  }
}

BOOL sub_2487E045C(void *a1, uint64_t *a2, unint64_t *a3, atomic_ullong *a4, uint64_t a5)
{
  unint64_t v5 = *a3;
  uint64_t v6 = 2;
  switch(a5)
  {
    case 0:
      uint64_t v7 = *a2;
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v5, memory_order_relaxed, memory_order_relaxed);
LABEL_18:
      *a1 = v8;
      return v8 == v7;
    case 2:
    case 4:
      break;
    case 3:
      uint64_t v6 = 0;
      break;
    case 5:
      uint64_t v6 = 5;
      break;
    default:
LABEL_20:
      sub_2487E4BB0();
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487E0658);
  }
  uint64_t v7 = *a2;
  if (v5)
  {
    switch(a5)
    {
      case 2:
        if (v6 != 5) {
          goto LABEL_15;
        }
        goto LABEL_17;
      case 3:
        if (v6 != 5 && v6 != 2) {
          goto LABEL_19;
        }
        goto LABEL_17;
      case 4:
      case 5:
        goto LABEL_17;
      default:
        goto LABEL_20;
    }
  }
  switch(a5)
  {
    case 2:
      if (v6 && v6 != 2) {
        goto LABEL_17;
      }
LABEL_15:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v5, memory_order_acquire, memory_order_acquire);
      goto LABEL_18;
    case 3:
      if (v6) {
        goto LABEL_17;
      }
LABEL_19:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v8, v5, memory_order_release, memory_order_relaxed);
      goto LABEL_18;
    case 4:
    case 5:
LABEL_17:
      uint64_t v8 = *a2;
      atomic_compare_exchange_strong(a4, (unint64_t *)&v8, v5);
      goto LABEL_18;
    default:
      goto LABEL_20;
  }
}

uint64_t sub_2487E0690(uint64_t a1, unsigned char *a2, uint64_t a3, void (*a4)(char *, uint64_t), unint64_t a5, uint64_t a6)
{
  uint64_t v54 = a4;
  uint64_t v52 = a2;
  uint64_t v58 = a1;
  uint64_t v8 = *(void *)(a6 + 16);
  uint64_t v9 = sub_2487E4C20();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v56 = (char *)&v46 - v10;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v53 = *(unsigned char **)(AssociatedTypeWitness - 8);
  uint64_t v12 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v46 - v15;
  uint64_t v18 = v17;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v55 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v20 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v50 = (char *)&v46 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = MEMORY[0x270FA5388](v20);
  uint64_t v49 = (char *)&v46 - v23;
  uint64_t v24 = MEMORY[0x270FA5388](v22);
  uint64_t v26 = (char *)&v46 - v25;
  MEMORY[0x270FA5388](v24);
  uint64_t v51 = v28;
  uint64_t v29 = *(void (**)(void))(v28 + 16);
  uint64_t v59 = (char *)&v46 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = a3;
  v29();
  if (a5 <= 5 && ((0x3Du >> a5) & 1) != 0)
  {
    uint64_t v47 = qword_2487E5710[a5];
    uint64_t v48 = TupleTypeMetadata2;
    uint64_t v30 = v26;
    int v31 = &v26[*(int *)(TupleTypeMetadata2 + 48)];
    uint64_t v32 = swift_getAssociatedTypeWitness();
    unint64_t v46 = a5;
    uint64_t v33 = v32;
    sub_2487E4BD0();
    sub_2487E4BD0();
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    char v35 = (*(uint64_t (**)(char *, char *, char *, void (*)(char *, uint64_t), unint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 80))(v31, v16, v14, v54, v46, v47, v33, AssociatedConformanceWitness);
    uint64_t v36 = v53;
    int v37 = v16;
    uint64_t v38 = v48;
    uint64_t v54 = (void (*)(char *, uint64_t))*((void *)v53 + 1);
    v54(v37, v18);
    uint64_t v52 = v30;
    *uint64_t v30 = v35 & 1;
    uint64_t v39 = *(int *)(v38 + 48);
    uint64_t v40 = v49;
    *uint64_t v49 = v35 & 1;
    uint64_t v41 = (void (*)(void))*((void *)v36 + 2);
    uint64_t v53 = &v40[v39];
    v41();
    ((void (*)(char *, char *, uint64_t))v41)(&v50[*(int *)(v38 + 48)], v31, v18);
    uint64_t v42 = v56;
    sub_2487E4BE0();
    uint64_t v43 = v51;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48))(v42, 1, v8) != 1)
    {
      uint64_t v44 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
      v44(v57, v8);
      (*(void (**)(unsigned char *, uint64_t))(v55 + 8))(v52, v38);
      v44((uint64_t)v59, v8);
      (*(void (**)(uint64_t, char *, uint64_t))(v43 + 32))(v58, v42, v8);
      v54(v53, v18);
      return v35 & 1;
    }
  }
  else
  {
    sub_2487E4C50();
    __break(1u);
  }
  uint64_t result = sub_2487E4C40();
  __break(1u);
  return result;
}

uint64_t sub_2487E0C30(uint64_t a1)
{
  return sub_2487D8F6C(a1);
}

uint64_t UnsafeAtomicLazyReference.Storage._storage.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*UnsafeAtomicLazyReference.Storage._storage.modify())()
{
  return nullsub_1;
}

uint64_t UnsafeAtomicLazyReference.Storage.init()()
{
  return 0;
}

uint64_t UnsafeAtomicLazyReference.Storage.dispose()()
{
  uint64_t result = *v0;
  uint64_t *v0 = 0;
  return result;
}

uint64_t static UnsafeAtomicLazyReference.create()()
{
  uint64_t v0 = type metadata accessor for UnsafeAtomicLazyReference.Storage();
  uint64_t v1 = sub_2487E4C10();
  uint64_t v3 = 0;
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v0 - 8) + 32))(v1, &v3, v0);
  return v1;
}

uint64_t type metadata accessor for UnsafeAtomicLazyReference.Storage()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2487E0D30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(a2, a1);
}

uint64_t UnsafeAtomicLazyReference.destroy()(uint64_t *a1)
{
  uint64_t v1 = *a1;
  *a1 = 0;
  type metadata accessor for UnsafeAtomicLazyReference.Storage();
  sub_2487E4BF0();
  return v1;
}

uint64_t ManagedAtomicLazyReference._storage.getter()
{
  return 0;
}

uint64_t ManagedAtomicLazyReference.__allocating_init()()
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0;
  return result;
}

uint64_t ManagedAtomicLazyReference.init()()
{
  uint64_t result = v0;
  *(void *)(v0 + 16) = 0;
  return result;
}

uint64_t ManagedAtomicLazyReference.deinit()
{
  if (*(void *)(v0 + 16)) {
    swift_unknownObjectRelease();
  }
  return v0;
}

uint64_t ManagedAtomicLazyReference.__deallocating_deinit()
{
  if (*(void *)(v0 + 16)) {
    swift_unknownObjectRelease();
  }
  return MEMORY[0x270FA0228](v0, 24, 7);
}

uint64_t UnsafeAtomicLazyReference.storeIfNilThenLoad(_:)(uint64_t a1, atomic_ullong *a2)
{
  uint64_t v3 = 0;
  atomic_compare_exchange_strong(a2, (unint64_t *)&v3, swift_unknownObjectRetain());
  if (v3)
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRelease_n();
    return v3;
  }
  return a1;
}

uint64_t UnsafeAtomicLazyReference.load()(atomic_ullong *a1)
{
  uint64_t result = atomic_load_explicit(a1, memory_order_acquire);
  if (result) {
    return swift_unknownObjectRetain();
  }
  return result;
}

uint64_t ManagedAtomicLazyReference.storeIfNilThenLoad(_:)(uint64_t a1)
{
  uint64_t v3 = (atomic_ullong *)(v1 + 16);
  uint64_t v4 = 0;
  atomic_compare_exchange_strong(v3, (unint64_t *)&v4, swift_unknownObjectRetain());
  if (v4)
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRelease_n();
    return v4;
  }
  return a1;
}

uint64_t ManagedAtomicLazyReference.load()()
{
  uint64_t result = atomic_load_explicit((atomic_ullong *volatile)(v0 + 16), memory_order_acquire);
  if (result) {
    return swift_unknownObjectRetain();
  }
  return result;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_2487E0F4C(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 != 1 && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)a1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t sub_2487E0F90(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)uint64_t result = a2 - 2;
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
      *(void *)uint64_t result = 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for UnsafeAtomicLazyReference()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2487E0FE8()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for ManagedAtomicLazyReference()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t static UnsafeAtomic.create(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v9 = (char *)&v13 - v8;
  uint64_t v10 = sub_2487E4C10();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *, uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(v6, AssociatedTypeWitness, AssociatedConformanceWitness);
  sub_2487E0D30((uint64_t)v9, v10, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
  return v10;
}

uint64_t UnsafeAtomic.destroy()(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v7 - v3, a1, AssociatedTypeWitness);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(AssociatedTypeWitness, AssociatedConformanceWitness);
  sub_2487E4C00();
  return sub_2487E4BF0();
}

uint64_t ManagedAtomic._storage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 96);
  swift_beginAccess();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(a1, v3, AssociatedTypeWitness);
}

uint64_t ManagedAtomic._storage.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 96);
  swift_beginAccess();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 40))(v3, a1, AssociatedTypeWitness);
  return swift_endAccess();
}

uint64_t (*ManagedAtomic._storage.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_2487E1578(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](a1);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v10 = (char *)&v14 - v9;
  uint64_t v11 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *, uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(v6, AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v11 + *(void *)(*(void *)v11 + 96), v10, AssociatedTypeWitness);
  return v11;
}

uint64_t ManagedAtomic.deinit()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 80);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v4 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v6 = (char *)&v12 - v5;
  uint64_t v7 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v0 + 16, AssociatedTypeWitness);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + *(void *)(*(void *)v0 + 96), AssociatedTypeWitness);
  return v0;
}

uint64_t ManagedAtomic.__deallocating_deinit()
{
  ManagedAtomic.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);
  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t sub_2487E19EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t type metadata accessor for UnsafeAtomic()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t sub_2487E1A0C()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for ManagedAtomic()
{
  return __swift_instantiateGenericMetadata();
}

AtomicsInternal::DoubleWord __swiftcall DoubleWord.init(high:low:)(Swift::UInt high, Swift::UInt low)
{
  Swift::UInt v4 = high;
  result.second = v4;
  result.first = low;
  return result;
}

uint64_t DoubleWord.high.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t DoubleWord.high.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

void *(*DoubleWord.high.modify(void *a1))(void *result)
{
  *a1 = *(void *)(v1 + 8);
  a1[1] = v1;
  return sub_2487E1B10;
}

void *sub_2487E1B10(void *result)
{
  *(void *)(result[1] + 8) = *result;
  return result;
}

uint64_t DoubleWord.low.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*DoubleWord.low.modify(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  return sub_2487E1B50;
}

uint64_t sub_2487E1B50(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

BOOL static DoubleWord.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

BOOL sub_2487E1B6C(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

uint64_t DoubleWord.hash(into:)()
{
  return sub_2487E4C90();
}

uint64_t DoubleWord.hashValue.getter()
{
  return sub_2487E4CA0();
}

uint64_t sub_2487E1C18()
{
  return sub_2487E4CA0();
}

uint64_t sub_2487E1C74()
{
  return sub_2487E4C90();
}

uint64_t sub_2487E1CB0()
{
  return sub_2487E4CA0();
}

unint64_t DoubleWord.description.getter()
{
  return 0xD000000000000012;
}

unint64_t sub_2487E1E14()
{
  unint64_t result = qword_26932A6D0;
  if (!qword_26932A6D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26932A6D0);
  }
  return result;
}

unint64_t sub_2487E1E68()
{
  return DoubleWord.description.getter();
}

Swift::Void __swiftcall atomicMemoryFence(ordering:)(AtomicsInternal::AtomicUpdateOrdering ordering)
{
  switch(ordering._rawValue)
  {
    case 0:
      return;
    case 2:
      __dmb(9u);
      break;
    case 3:
    case 4:
    case 5:
      __dmb(0xBu);
      break;
    default:
      sub_2487E4C50();
      __break(1u);
      JUMPOUT(0x2487E1F10);
  }
}

uint64_t AtomicLoadOrdering._rawValue.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*AtomicLoadOrdering._rawValue.modify())()
{
  return nullsub_1;
}

BOOL static AtomicLoadOrdering.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

BOOL sub_2487E1F64(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t AtomicLoadOrdering.hash(into:)()
{
  return sub_2487E4C90();
}

uint64_t sub_2487E1FA8()
{
  return sub_2487E4C90();
}

uint64_t AtomicLoadOrdering.description.getter(uint64_t a1)
{
  switch(a1)
  {
    case 5:
      return sub_2487E4BB0();
    case 2:
      return 0x6E69726975716361;
    case 0:
      return 0x646578616C6572;
  }
  sub_2487E4C30();
  uint64_t v2 = sub_2487E4BB0();
  swift_bridgeObjectRelease();
  sub_2487E4C70();
  sub_2487E4BC0();
  swift_bridgeObjectRelease();
  sub_2487E4BB0();
  sub_2487E4BC0();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_2487E2104()
{
  return AtomicLoadOrdering.description.getter(*v0);
}

uint64_t AtomicStoreOrdering._rawValue.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*AtomicStoreOrdering._rawValue.modify())()
{
  return nullsub_1;
}

BOOL static AtomicStoreOrdering.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t AtomicStoreOrdering.description.getter(uint64_t a1)
{
  switch(a1)
  {
    case 5:
      return sub_2487E4BB0();
    case 3:
      return 0x6E697361656C6572;
    case 0:
      return 0x646578616C6572;
  }
  sub_2487E4C30();
  uint64_t v2 = sub_2487E4BB0();
  swift_bridgeObjectRelease();
  sub_2487E4C70();
  sub_2487E4BC0();
  swift_bridgeObjectRelease();
  sub_2487E4BB0();
  sub_2487E4BC0();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_2487E2278()
{
  return AtomicStoreOrdering.description.getter(*v0);
}

uint64_t AtomicUpdateOrdering._rawValue.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*AtomicUpdateOrdering._rawValue.modify())()
{
  return nullsub_1;
}

BOOL static AtomicUpdateOrdering.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _s15AtomicsInternal18AtomicLoadOrderingV9hashValueSivg_0()
{
  return sub_2487E4CA0();
}

uint64_t sub_2487E2308()
{
  return sub_2487E4CA0();
}

uint64_t sub_2487E2350()
{
  return sub_2487E4CA0();
}

uint64_t AtomicUpdateOrdering.description.getter(uint64_t a1)
{
  uint64_t result = 0x6E69726975716361;
  switch(a1)
  {
    case 0:
      uint64_t result = 0x646578616C6572;
      break;
    case 2:
      return result;
    case 3:
    case 4:
    case 5:
      uint64_t result = sub_2487E4BB0();
      break;
    default:
      sub_2487E4C30();
      uint64_t v3 = sub_2487E4BB0();
      swift_bridgeObjectRelease();
      sub_2487E4C70();
      sub_2487E4BC0();
      swift_bridgeObjectRelease();
      sub_2487E4BB0();
      sub_2487E4BC0();
      swift_bridgeObjectRelease();
      uint64_t result = v3;
      break;
  }
  return result;
}

unint64_t sub_2487E2510()
{
  unint64_t result = qword_26932A6D8;
  if (!qword_26932A6D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26932A6D8);
  }
  return result;
}

unint64_t sub_2487E2568()
{
  unint64_t result = qword_26932A6E0;
  if (!qword_26932A6E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26932A6E0);
  }
  return result;
}

unint64_t sub_2487E25C0()
{
  unint64_t result = qword_26932A6E8[0];
  if (!qword_26932A6E8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_26932A6E8);
  }
  return result;
}

uint64_t sub_2487E2614()
{
  return AtomicUpdateOrdering.description.getter(*v0);
}

ValueMetadata *type metadata accessor for AtomicLoadOrdering()
{
  return &type metadata for AtomicLoadOrdering;
}

ValueMetadata *type metadata accessor for AtomicStoreOrdering()
{
  return &type metadata for AtomicStoreOrdering;
}

ValueMetadata *type metadata accessor for AtomicUpdateOrdering()
{
  return &type metadata for AtomicUpdateOrdering;
}

uint64_t AtomicRawRepresentableStorage._storage.getter@<X0>(uint64_t a1@<X8>)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  Swift::UInt v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16);
  return v4(a1, v1, AssociatedTypeWitness);
}

uint64_t AtomicRawRepresentableStorage._storage.setter(uint64_t a1)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  Swift::UInt v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 40);
  return v4(v1, a1, AssociatedTypeWitness);
}

uint64_t (*AtomicRawRepresentableStorage._storage.modify())()
{
  return nullsub_1;
}

uint64_t sub_2487E27D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v15 = a3;
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v7 = (char *)&v14 - v6;
  uint64_t v8 = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v14 - v10;
  sub_2487E4BD0();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *, uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(v7, v8, AssociatedConformanceWitness);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v15, v11, v8);
}

uint64_t sub_2487E29BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v19 = a2;
  v17[1] = *(void *)(a1 + 24);
  uint64_t v4 = *(void *)(a1 + 16);
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v8 = (char *)v17 - v7;
  uint64_t v9 = swift_checkMetadataState();
  MEMORY[0x270FA5388](v9);
  uint64_t v10 = sub_2487E4C20();
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)v17 - v11;
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v18 = v2;
  v13(v8, v2, AssociatedTypeWitness);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(AssociatedTypeWitness, AssociatedConformanceWitness);
  sub_2487E4BE0();
  uint64_t v15 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v4) == 1)
  {
    uint64_t result = sub_2487E4C40();
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8))(v18, a1);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(v19, v12, v4);
  }
  return result;
}

uint64_t sub_2487E2CBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  uint64_t v22 = a4;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = sub_2487E4C20();
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v19 - v6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v19 - v13;
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(v20, v21, v15, AssociatedConformanceWitness);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, AssociatedTypeWitness);
  sub_2487E4BE0();
  uint64_t v17 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v7, 1, v4) == 1)
  {
    uint64_t result = sub_2487E4C40();
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, AssociatedTypeWitness);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32))(v22, v7, v4);
  }
  return result;
}

uint64_t sub_2487E2F84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = a3;
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v9 = (char *)&v13 - v8;
  uint64_t v10 = swift_getAssociatedTypeWitness();
  sub_2487E4BD0();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 40))(v9, a2, v14, v10, AssociatedConformanceWitness);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
}

uint64_t sub_2487E30F4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  uint64_t v22 = a5;
  uint64_t v23 = a1;
  uint64_t v5 = *(void *)(a4 + 16);
  uint64_t v6 = sub_2487E4C20();
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v20 - v7;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v20 - v14;
  uint64_t v16 = swift_getAssociatedTypeWitness();
  sub_2487E4BD0();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 48))(v13, v20, v21, v16, AssociatedConformanceWitness);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, AssociatedTypeWitness);
  sub_2487E4BE0();
  uint64_t v18 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v8, 1, v5) == 1)
  {
    uint64_t result = sub_2487E4C40();
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v23, v5);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, AssociatedTypeWitness);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v18 + 32))(v22, v8, v5);
  }
  return result;
}

uint64_t sub_2487E33F4(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, unsigned char *a5, uint64_t a6)
{
  v45 = a4;
  unint64_t v46 = a5;
  uint64_t v49 = a1;
  uint64_t v50 = a3;
  uint64_t v7 = *(void *)(a6 + 16);
  uint64_t v8 = sub_2487E4C20();
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v48 = (char *)&v39 - v9;
  uint64_t v10 = *(void *)(a6 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v44 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v39 - v15;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v47 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v17 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v43 = (char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = MEMORY[0x270FA5388](v17);
  uint64_t v42 = (char *)&v39 - v20;
  uint64_t v21 = MEMORY[0x270FA5388](v19);
  uint64_t v23 = (char *)&v39 - v22;
  uint64_t v24 = (char *)&v39 + *(int *)(v21 + 48) - v22;
  uint64_t v25 = swift_getAssociatedTypeWitness();
  uint64_t v41 = v10;
  sub_2487E4BD0();
  sub_2487E4BD0();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  char v27 = (*(uint64_t (**)(char *, char *, char *, char *, unsigned char *, uint64_t, uint64_t))(AssociatedConformanceWitness
                                                                                             + 56))(v24, v16, v14, v45, v46, v25, AssociatedConformanceWitness);
  uint64_t v28 = v44;
  uint64_t v29 = *(void (**)(char *, uint64_t))(v44 + 8);
  uint64_t v30 = v16;
  uint64_t v31 = TupleTypeMetadata2;
  v29(v30, AssociatedTypeWitness);
  uint64_t v32 = v27 & 1;
  unint64_t v46 = v23;
  *uint64_t v23 = v27 & 1;
  uint64_t v33 = *(int *)(v31 + 48);
  uint64_t v34 = v42;
  *uint64_t v42 = v27 & 1;
  char v35 = *(void (**)(void))(v28 + 16);
  v45 = &v34[v33];
  v35();
  ((void (*)(char *, char *, uint64_t))v35)(&v43[*(int *)(v31 + 48)], v24, AssociatedTypeWitness);
  uint64_t v36 = v48;
  sub_2487E4BE0();
  uint64_t v37 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v36, 1, v7) == 1)
  {
    uint64_t result = sub_2487E4C40();
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v50, v7);
    (*(void (**)(unsigned char *, uint64_t))(v47 + 8))(v46, v31);
    (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(v49, v36, v7);
    v29(v45, AssociatedTypeWitness);
    return v32;
  }
  return result;
}

uint64_t sub_2487E3874(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(char *, uint64_t), unsigned char *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v50 = a6;
  uint64_t v51 = a1;
  unint64_t v46 = a4;
  uint64_t v47 = a5;
  uint64_t v53 = a3;
  uint64_t v8 = *(void *)(a7 + 16);
  uint64_t v9 = sub_2487E4C20();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v48 = (char *)&v40 - v10;
  uint64_t v52 = *(void *)(a7 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v45 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v43 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v41 = (char *)&v40 - v14;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v49 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v44 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v42 = (char *)&v40 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v40 - v21;
  uint64_t v23 = (char *)&v40 + *(int *)(v20 + 48) - v21;
  uint64_t v24 = swift_getAssociatedTypeWitness();
  sub_2487E4BD0();
  uint64_t v25 = v43;
  sub_2487E4BD0();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  char v27 = v41;
  char v28 = (*(uint64_t (**)(char *, char *, char *, void (*)(char *, uint64_t), unsigned char *, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 64))(v23, v41, v25, v46, v47, v50, v24, AssociatedConformanceWitness);
  uint64_t v29 = v45;
  unint64_t v46 = *(void (**)(char *, uint64_t))(v45 + 8);
  v46(v27, AssociatedTypeWitness);
  uint64_t v30 = v28 & 1;
  uint64_t v47 = v22;
  *uint64_t v22 = v28 & 1;
  uint64_t v31 = *(int *)(TupleTypeMetadata2 + 48);
  uint64_t v32 = v42;
  uint64_t v33 = &v42[v31];
  *uint64_t v42 = v28 & 1;
  uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v29 + 16);
  v34(&v32[v31], v23, AssociatedTypeWitness);
  uint64_t v50 = TupleTypeMetadata2;
  uint64_t v35 = *(int *)(TupleTypeMetadata2 + 48);
  uint64_t v36 = AssociatedTypeWitness;
  uint64_t v37 = v48;
  v34(&v44[v35], v23, v36);
  sub_2487E4BE0();
  uint64_t v38 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v37, 1, v8) == 1)
  {
    uint64_t result = sub_2487E4C40();
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v53, v8);
    (*(void (**)(unsigned char *, uint64_t))(v49 + 8))(v47, v50);
    (*(void (**)(uint64_t, char *, uint64_t))(v38 + 32))(v51, v37, v8);
    v46(v33, v36);
    return v30;
  }
  return result;
}

uint64_t sub_2487E3D1C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(char *, uint64_t), unsigned char *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v50 = a6;
  uint64_t v51 = a1;
  unint64_t v46 = a4;
  uint64_t v47 = a5;
  uint64_t v53 = a3;
  uint64_t v8 = *(void *)(a7 + 16);
  uint64_t v9 = sub_2487E4C20();
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v48 = (char *)&v40 - v10;
  uint64_t v52 = *(void *)(a7 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v45 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = MEMORY[0x270FA5388](AssociatedTypeWitness);
  uint64_t v43 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v41 = (char *)&v40 - v14;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v49 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](TupleTypeMetadata2);
  uint64_t v44 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v42 = (char *)&v40 - v19;
  uint64_t v20 = MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v40 - v21;
  uint64_t v23 = (char *)&v40 + *(int *)(v20 + 48) - v21;
  uint64_t v24 = swift_getAssociatedTypeWitness();
  sub_2487E4BD0();
  uint64_t v25 = v43;
  sub_2487E4BD0();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  char v27 = v41;
  char v28 = (*(uint64_t (**)(char *, char *, char *, void (*)(char *, uint64_t), unsigned char *, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 80))(v23, v41, v25, v46, v47, v50, v24, AssociatedConformanceWitness);
  uint64_t v29 = v45;
  unint64_t v46 = *(void (**)(char *, uint64_t))(v45 + 8);
  v46(v27, AssociatedTypeWitness);
  uint64_t v30 = v28 & 1;
  uint64_t v47 = v22;
  *uint64_t v22 = v28 & 1;
  uint64_t v31 = *(int *)(TupleTypeMetadata2 + 48);
  uint64_t v32 = v42;
  uint64_t v33 = &v42[v31];
  *uint64_t v42 = v28 & 1;
  uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v29 + 16);
  v34(&v32[v31], v23, AssociatedTypeWitness);
  uint64_t v50 = TupleTypeMetadata2;
  uint64_t v35 = *(int *)(TupleTypeMetadata2 + 48);
  uint64_t v36 = AssociatedTypeWitness;
  uint64_t v37 = v48;
  v34(&v44[v35], v23, v36);
  sub_2487E4BE0();
  uint64_t v38 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v37, 1, v8) == 1)
  {
    uint64_t result = sub_2487E4C40();
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v53, v8);
    (*(void (**)(unsigned char *, uint64_t))(v49 + 8))(v47, v50);
    (*(void (**)(uint64_t, char *, uint64_t))(v38 + 32))(v51, v37, v8);
    v46(v33, v36);
    return v30;
  }
  return result;
}

uint64_t sub_2487E41C4()
{
  swift_getAssociatedTypeWitness();
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_2487E4288(uint64_t *a1, uint64_t *a2)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 <= 7
    && *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) <= 0x18uLL
    && (*(_DWORD *)(v5 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  }
  else
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~v6));
    swift_retain();
  }
  return a1;
}

uint64_t sub_2487E4390(uint64_t a1)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8);
  return v3(a1, AssociatedTypeWitness);
}

uint64_t sub_2487E4430(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_2487E44D4(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 24))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_2487E4578(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_2487E461C(uint64_t a1, uint64_t a2)
{
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 40))(a1, a2, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_2487E46C0(unsigned __int16 *a1, unsigned int a2)
{
  swift_getAssociatedTypeWitness();
  uint64_t v4 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v7 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v9 = ((a2 - v5 + ~(-1 << v7)) >> v7) + 1;
    if (HIWORD(v9))
    {
      int v8 = *(_DWORD *)((char *)a1 + v6);
      if (!v8) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v9 > 0xFF)
    {
      int v8 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v9 < 2)
    {
LABEL_19:
      if (v5)
      {
        uint64_t v11 = *(uint64_t (**)(unsigned __int16 *))(v4 + 48);
        return v11(a1);
      }
      return 0;
    }
  }
  int v8 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v10 = (v8 - 1) << v7;
  if (v6 > 3) {
    int v10 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v10) + 1;
}

void sub_2487E48A0(unsigned char *a1, uint64_t a2, unsigned int a3)
{
  swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  if (a3 <= v7)
  {
    int v9 = 0;
  }
  else if (v8 <= 3)
  {
    unsigned int v12 = ((a3 - v7 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
    if (HIWORD(v12))
    {
      int v9 = 4;
    }
    else if (v12 >= 0x100)
    {
      int v9 = 2;
    }
    else
    {
      int v9 = v12 > 1;
    }
  }
  else
  {
    int v9 = 1;
  }
  if (v7 < a2)
  {
    unsigned int v10 = ~v7 + a2;
    if (v8 < 4)
    {
      int v11 = (v10 >> (8 * v8)) + 1;
      if (v8)
      {
        int v13 = v10 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v13;
          a1[2] = BYTE2(v13);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v13;
        }
        else
        {
          *a1 = v13;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v10;
      int v11 = 1;
    }
    switch(v9)
    {
      case 1:
        a1[v8] = v11;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v11;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v11;
        return;
      default:
        return;
    }
  }
  switch(v9)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x2487E4B00);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v14 = *(void (**)(unsigned char *, uint64_t))(v6 + 56);
        v14(a1, a2);
      }
      return;
  }
}

uint64_t type metadata accessor for AtomicRawRepresentableStorage()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t DoubleWord.first.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*DoubleWord.first.modify())()
{
  return nullsub_1;
}

uint64_t DoubleWord.second.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t DoubleWord.second.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*DoubleWord.second.modify())()
{
  return nullsub_1;
}

ValueMetadata *type metadata accessor for DoubleWord()
{
  return &type metadata for DoubleWord;
}

uint64_t sub_2487E4BB0()
{
  return MEMORY[0x270F9D6D8]();
}

uint64_t sub_2487E4BC0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2487E4BD0()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_2487E4BE0()
{
  return MEMORY[0x270F9DA78]();
}

uint64_t sub_2487E4BF0()
{
  return MEMORY[0x270F9E358]();
}

uint64_t sub_2487E4C00()
{
  return MEMORY[0x270F9E378]();
}

uint64_t sub_2487E4C10()
{
  return MEMORY[0x270F9E398]();
}

uint64_t sub_2487E4C20()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2487E4C30()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2487E4C40()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2487E4C50()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_2487E4C60()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2487E4C70()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2487E4C80()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2487E4C90()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_2487E4CA0()
{
  return MEMORY[0x270F9FC90]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x270FA01A0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x270FA0598]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}