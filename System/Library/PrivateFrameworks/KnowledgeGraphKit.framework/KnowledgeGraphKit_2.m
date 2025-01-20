void sub_1D177B9E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,void *a52)
{
  degas::Statement::~Statement((degas::Statement *)&a13);
  std::ostringstream::~ostringstream((uint64_t)&a16);
  degas::Statement::~Statement((degas::Statement *)&a49);
  std::ostringstream::~ostringstream((uint64_t)&a52);
  degas::Statement::~Statement((degas::Statement *)&STACK[0x260]);
  std::ostringstream::~ostringstream((uint64_t)&STACK[0x278]);
  _Unwind_Resume(a1);
}

void degas::EdgeTable::~EdgeTable(degas::EdgeTable *this)
{
  *(void *)this = &unk_1F2801DE0;
  *((void *)this + 4) = 0;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
  JUMPOUT(0x1D25F9A90);
}

{
  *(void *)this = &unk_1F2801DE0;
  *((void *)this + 4) = 0;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

{
  *(void *)this = &unk_1F2801DE0;
  *((void *)this + 4) = 0;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

void *degas::EdgeTable::EdgeTable(void *a1, uint64_t a2, long long *a3, char a4, char a5, uint64_t a6)
{
  result = degas::Table::Table(a1, a3, a2, a6);
  void *result = &unk_1F2801EF8;
  *((unsigned char *)result + 49) = a4;
  *((unsigned char *)result + 48) = a5;
  return result;
}

{
  void *result;

  result = degas::Table::Table(a1, a3, a2, a6);
  void *result = &unk_1F2801EF8;
  *((unsigned char *)result + 49) = a4;
  *((unsigned char *)result + 48) = a5;
  return result;
}

uint64_t *degas::EdgeTable::insertStatement(degas::EdgeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x300;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9EdgeTable15insertStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_3689;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9EdgeTable15insertStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"insert into ", 12);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" (identifier, labels, sourceNodeId, targetNodeId) values(?1, ?2, ?3, ?4)", 72);
  operator new();
}

void sub_1D177BED0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::EdgeTable::readByIdentifierStatement(degas::EdgeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x600;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9EdgeTable25readByIdentifierStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_7_3692;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9EdgeTable25readByIdentifierStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select identifier, labels, sourceNodeId, targetNodeId from ", 59);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" where identifier=?1", 20);
  operator new();
}

void sub_1D177C17C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::EdgeTable::readByBitmapStatement(degas::EdgeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x800;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9EdgeTable21readByBitmapStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_10_3694;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9EdgeTable21readByBitmapStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select e.identifier, e.labels, e.sourceNodeId, e.targetNodeId from ", 67);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" e, identifierBitmap(?) b where e.identifier = b.value", 54);
  operator new();
}

void sub_1D177C428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::EdgeTable::readByLabelStatement(degas::EdgeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x801;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9EdgeTable20readByLabelStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_12_3697;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9EdgeTable20readByLabelStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select identifier, labels, sourceNodeId, targetNodeId from ", 59);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" where bitmapContainsIdentifier(labels, ?1)", 43);
  operator new();
}

void sub_1D177C6D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::EdgeTable::readByAllLabelsStatement(degas::EdgeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x802;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9EdgeTable24readByAllLabelsStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_14_3699;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9EdgeTable24readByAllLabelsStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select identifier, labels, sourceNodeId, targetNodeId from ", 59);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" where bitmapContainsBitmap(labels, ?1)", 39);
  operator new();
}

void sub_1D177C980(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::EdgeTable::readByAllLabelsAndIdentifiersStatement(degas::EdgeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x803;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9EdgeTable38readByAllLabelsAndIdentifiersStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_16_3701;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9EdgeTable38readByAllLabelsAndIdentifiersStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select e.identifier, e.labels, e.sourceNodeId, e.targetNodeId from ", 67);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" e, identifierBitmap(?1) b where e.identifier = b.value and bitmapContainsBitmap(e.labels, ?2)", 94);
  operator new();
}

void sub_1D177CC2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::EdgeTable::readByAnyLabelsStatement(degas::EdgeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x804;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9EdgeTable24readByAnyLabelsStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_18_3703;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9EdgeTable24readByAnyLabelsStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select identifier, labels, sourceNodeId, targetNodeId from ", 59);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" where bitmapOverlapsBitmap(labels, ?1)", 39);
  operator new();
}

void sub_1D177CED8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::EdgeTable::readByAnyLabelsAndIdentifiersStatement(degas::EdgeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x805;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9EdgeTable38readByAnyLabelsAndIdentifiersStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_20_3705;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9EdgeTable38readByAnyLabelsAndIdentifiersStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select e.identifier, e.labels, e.sourceNodeId, e.targetNodeId from ", 67);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" e, identifierBitmap(?1) b where e.identifier = b.value and bitmapOverlapsBitmap(e.labels, ?2)", 94);
  operator new();
}

void sub_1D177D184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::EdgeTable::readAllStatement(degas::EdgeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x700;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9EdgeTable16readAllStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_22_3707;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9EdgeTable16readAllStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select identifier, labels, sourceNodeId, targetNodeId from ", 59);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" order by identifier", 20);
  operator new();
}

void sub_1D177D430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t degas::EdgeTable::insert(sqlite3 **this, sqlite3_int64 *a2, const degas::Bitmap *a3, sqlite3_int64 a4, sqlite3_int64 a5)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  inserted = (degas::Statement **)degas::EdgeTable::insertStatement((degas::EdgeTable *)this);
  v11 = *inserted;
  if (*a2) {
    degas::Statement::bindInteger((sqlite3_stmt **)v11, 1, *a2);
  }
  else {
    degas::Statement::bindNull((sqlite3_stmt **)v11, 1);
  }
  degas::Statement::bindBitmap(*inserted, (const Bitmap *)2, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*inserted, 3, a4);
  degas::Statement::bindInteger((sqlite3_stmt **)*inserted, 4, a5);
  uint64_t v12 = degas::Statement::update((sqlite3_stmt **)*inserted);
  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v13 = sqlite3_errmsg(this[4]);
      int v15 = 136315138;
      v16 = v13;
      _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "edge insert failed: %s", (uint8_t *)&v15, 0xCu);
    }
  }
  else if (!*a2)
  {
    *a2 = sqlite3_last_insert_rowid(this[4]);
  }
  return v12;
}

uint64_t *degas::EdgeTable::prepareStatementToReadByIdentifier(degas::EdgeTable *this, sqlite3_int64 a2)
{
  uint64_t v3 = degas::EdgeTable::readByIdentifierStatement(this);
  degas::Statement::bindInteger((sqlite3_stmt **)*v3, 1, a2);
  return v3;
}

uint64_t *degas::EdgeTable::prepareStatementToReadByBitmap(degas::EdgeTable *this, Bitmap *a2)
{
  uint64_t v3 = degas::EdgeTable::readByBitmapStatement(this);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v3, 1, a2);
  return v3;
}

uint64_t *degas::EdgeTable::prepareStatementToReadByLabel(degas::EdgeTable *this, sqlite3_int64 a2)
{
  uint64_t v3 = degas::EdgeTable::readByLabelStatement(this);
  degas::Statement::bindInteger((sqlite3_stmt **)*v3, 1, a2);
  return v3;
}

uint64_t *degas::EdgeTable::prepareStatementToReadByAllLabels(degas::EdgeTable *this, const degas::Bitmap *a2)
{
  uint64_t v3 = degas::EdgeTable::readByAllLabelsStatement(this);
  degas::Statement::bindBitmap((degas::Statement *)*v3, (const Bitmap *)1, a2);
  return v3;
}

uint64_t *degas::EdgeTable::prepareStatementToReadByAllLabelsAndIdentifiers(degas::EdgeTable *this, const degas::Bitmap *a2, Bitmap *a3)
{
  uint64_t v5 = degas::EdgeTable::readByAllLabelsAndIdentifiersStatement(this);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v5, 1, a3);
  degas::Statement::bindBitmap((degas::Statement *)*v5, (const Bitmap *)2, a2);
  return v5;
}

uint64_t *degas::EdgeTable::prepareStatementToReadByAnyLabels(degas::EdgeTable *this, const degas::Bitmap *a2)
{
  uint64_t v3 = degas::EdgeTable::readByAnyLabelsStatement(this);
  degas::Statement::bindBitmap((degas::Statement *)*v3, (const Bitmap *)1, a2);
  return v3;
}

uint64_t *degas::EdgeTable::prepareStatementToReadByAnyLabelsAndIdentifiers(degas::EdgeTable *this, const degas::Bitmap *a2, Bitmap *a3)
{
  uint64_t v5 = degas::EdgeTable::readByAnyLabelsAndIdentifiersStatement(this);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v5, 1, a3);
  degas::Statement::bindBitmap((degas::Statement *)*v5, (const Bitmap *)2, a2);
  return v5;
}

void *degas::EdgeCursor::EdgeCursor(void *this)
{
  *this = 0;
  this[1] = 0;
  return this;
}

void degas::EdgeCursor::setForSelectAll(degas::EdgeCursor *this, const degas::EdgeTable *a2)
{
  AllStatement = degas::EdgeTable::readAllStatement(a2);
  uint64_t v5 = *AllStatement;
  uint64_t v4 = AllStatement[1];
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  v6 = (std::__shared_weak_count *)*((void *)this + 1);
  *(void *)this = v5;
  *((void *)this + 1) = v4;
  if (v6)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void degas::EdgeCursor::setForIdentifier(degas::EdgeCursor *this, sqlite3_int64 a2, const degas::EdgeTable *a3)
{
  uint64_t v5 = degas::EdgeTable::readByIdentifierStatement(a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v5, 1, a2);
  v7 = (sqlite3_stmt **)*v5;
  uint64_t v6 = v5[1];
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  v8 = (std::__shared_weak_count *)*((void *)this + 1);
  *(void *)this = v7;
  *((void *)this + 1) = v6;
  if (v8)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

void degas::EdgeCursor::setForIdentifiers(degas::EdgeCursor *this, Bitmap *a2, const degas::EdgeTable *a3)
{
  uint64_t v5 = degas::EdgeTable::readByBitmapStatement(a3);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v5, 1, a2);
  v7 = (sqlite3_stmt **)*v5;
  uint64_t v6 = v5[1];
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  v8 = (std::__shared_weak_count *)*((void *)this + 1);
  *(void *)this = v7;
  *((void *)this + 1) = v6;
  if (v8)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

void degas::EdgeCursor::setForLabel(degas::EdgeCursor *this, sqlite3_int64 a2, const degas::EdgeTable *a3)
{
  uint64_t v5 = degas::EdgeTable::readByLabelStatement(a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v5, 1, a2);
  v7 = (sqlite3_stmt **)*v5;
  uint64_t v6 = v5[1];
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  v8 = (std::__shared_weak_count *)*((void *)this + 1);
  *(void *)this = v7;
  *((void *)this + 1) = v6;
  if (v8)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

void degas::EdgeCursor::setForAllLabels(degas::EdgeCursor *this, const degas::Bitmap *a2, const degas::EdgeTable *a3)
{
  uint64_t v5 = degas::EdgeTable::readByAllLabelsStatement(a3);
  degas::Statement::bindBitmap((degas::Statement *)*v5, (const Bitmap *)1, a2);
  v7 = (degas::Statement *)*v5;
  uint64_t v6 = v5[1];
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  v8 = (std::__shared_weak_count *)*((void *)this + 1);
  *(void *)this = v7;
  *((void *)this + 1) = v6;
  if (v8)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

void degas::EdgeCursor::setForAllLabelsAndIdentifiers(degas::EdgeCursor *this, const degas::Bitmap *a2, Bitmap *a3, const degas::EdgeTable *a4)
{
  uint64_t v5 = degas::EdgeTable::prepareStatementToReadByAllLabelsAndIdentifiers(a4, a2, a3);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  v8 = (std::__shared_weak_count *)*((void *)this + 1);
  *(void *)this = v7;
  *((void *)this + 1) = v6;
  if (v8)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

void degas::EdgeCursor::setForAnyLabels(degas::EdgeCursor *this, const degas::Bitmap *a2, const degas::EdgeTable *a3)
{
  uint64_t v5 = degas::EdgeTable::readByAnyLabelsStatement(a3);
  degas::Statement::bindBitmap((degas::Statement *)*v5, (const Bitmap *)1, a2);
  uint64_t v7 = (degas::Statement *)*v5;
  uint64_t v6 = v5[1];
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  v8 = (std::__shared_weak_count *)*((void *)this + 1);
  *(void *)this = v7;
  *((void *)this + 1) = v6;
  if (v8)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

void degas::EdgeCursor::setForAnyLabelsAndIdentifiers(degas::EdgeCursor *this, const degas::Bitmap *a2, Bitmap *a3, const degas::EdgeTable *a4)
{
  uint64_t v5 = degas::EdgeTable::prepareStatementToReadByAnyLabelsAndIdentifiers(a4, a2, a3);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  v8 = (std::__shared_weak_count *)*((void *)this + 1);
  *(void *)this = v7;
  *((void *)this + 1) = v6;
  if (v8)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

sqlite3_int64 degas::EdgeCursor::identifier(sqlite3_stmt ***this)
{
  return sqlite3_column_int64(**this, 0);
}

void degas::EdgeCursor::labels(sqlite3_stmt ***this, degas::Bitmap *a2)
{
}

unsigned int *degas::EdgeCursor::literalLabels(sqlite3_stmt ***this)
{
  return degas::Statement::literalBitmapColumnValue(*this, 1);
}

sqlite3_int64 degas::EdgeCursor::sourceNodeId(sqlite3_stmt ***this)
{
  return sqlite3_column_int64(**this, 2);
}

sqlite3_int64 degas::EdgeCursor::targetNodeId(sqlite3_stmt ***this)
{
  return sqlite3_column_int64(**this, 3);
}

void sub_1D177E89C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D177E958(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D177EFE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D177F130(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D177F93C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D177F9F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D178027C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1780414(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1780560(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1780928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj, id a16)
{
}

void *degas::Migration::Migration(void *result, uint64_t a2, uint64_t a3)
{
  void *result = a2;
  result[1] = a3;
  return result;
}

{
  void *result = a2;
  result[1] = a3;
  return result;
}

uint64_t degas::Migration::migrateAttributeSchema(degas::Migration *this)
{
  AllStatement = degas::AttributeTable::readAllStatement((degas::AttributeTable *)(*(void *)this + 304));
  uint64_t v4 = (atomic_ullong *)AllStatement[1];
  v35[0] = (degas::Statement *)*AllStatement;
  v35[1] = (degas::Statement *)v4;
  if (v4) {
    atomic_fetch_add_explicit(v4 + 1, 1uLL, memory_order_relaxed);
  }
  while (1)
  {
    unsigned int v5 = degas::Statement::next((sqlite3_stmt **)v35[0]);
    if (v5 != 1) {
      break;
    }
    sqlite3_int64 v6 = sqlite3_column_int64(*(sqlite3_stmt **)v35[0], 0);
    v33[0] = 0;
    v33[1] = 0;
    uint64_t v34 = 0;
    degas::Statement::stringColumnValue((sqlite3_stmt **)v35[0], 1, (uint64_t)v33);
    degas::AttributeInstanceTable::AttributeInstanceTable((uint64_t)v32, *((void *)this + 1), (uint64_t)v33, 0, 1, *(void *)this + 40);
    uint64_t v7 = degas::AttributeInstanceTable::readAllStatement((degas::AttributeInstanceTable *)v32);
    uint64_t v8 = *((void *)v7 + 1);
    v30 = *(degas::Statement **)v7;
    uint64_t v31 = v8;
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    while (1)
    {
      uint64_t v9 = degas::Statement::next((sqlite3_stmt **)v30);
      int v10 = v9;
      if (v9 != 1) {
        break;
      }
      sqlite3_int64 v11 = sqlite3_column_int64(*(sqlite3_stmt **)v30, 0);
      switch(sqlite3_column_int64(*(sqlite3_stmt **)v30, 4))
      {
        case 1u:
          sqlite3_int64 v12 = sqlite3_column_int64(*(sqlite3_stmt **)v30, 1);
          uint64_t v13 = degas::Database::setNodeAttributeValue(*(degas::Database **)this, v11, v6, v12);
          goto LABEL_14;
        case 2u:
          double v15 = sqlite3_column_double(*(sqlite3_stmt **)v30, 2);
          uint64_t v13 = degas::Database::setNodeAttributeValue(*(degas::Database **)this, v11, v6, v15);
          goto LABEL_14;
        case 3u:
          __p = 0;
          uint64_t v28 = 0;
          uint64_t v29 = 0;
          degas::Statement::stringColumnValue((sqlite3_stmt **)v30, 3, (uint64_t)&__p);
          uint64_t v14 = degas::Database::setNodeAttributeValue(*(void *)this, v11, v6, (uint64_t *)&__p);
          if (SHIBYTE(v29) < 0) {
            operator delete(__p);
          }
          break;
        case 4u:
          sqlite3_int64 v16 = sqlite3_column_int64(*(sqlite3_stmt **)v30, 1);
          uint64_t v13 = degas::Database::setNodeAttributeValueUnsigned(*(degas::Database **)this, v11, v6, v16);
LABEL_14:
          uint64_t v14 = v13;
          break;
        default:
          uint64_t v14 = 1;
          break;
      }
      uint64_t v17 = v14;
      if (v14 >= 2) {
        goto LABEL_18;
      }
    }
    uint64_t v14 = v1;
    uint64_t v17 = v9;
LABEL_18:
    degas::Cursor::~Cursor(&v30);
    degas::AttributeInstanceTable::~AttributeInstanceTable((degas::AttributeInstanceTable *)v32);
    if (v10 == 1)
    {
      int v18 = 1;
    }
    else
    {
      degas::AttributeInstanceTable::AttributeInstanceTable((uint64_t)v32, *((void *)this + 1), (uint64_t)v33, 0, 2, *(void *)this + 40);
      v19 = degas::AttributeInstanceTable::readAllStatement((degas::AttributeInstanceTable *)v32);
      uint64_t v20 = *((void *)v19 + 1);
      v30 = *(degas::Statement **)v19;
      uint64_t v31 = v20;
      if (v20) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v20 + 8), 1uLL, memory_order_relaxed);
      }
      while (degas::Statement::next((sqlite3_stmt **)v30) == 1)
      {
        sqlite3_int64 v21 = sqlite3_column_int64(*(sqlite3_stmt **)v30, 0);
        switch(sqlite3_column_int64(*(sqlite3_stmt **)v30, 4))
        {
          case 1u:
            sqlite3_int64 v22 = sqlite3_column_int64(*(sqlite3_stmt **)v30, 1);
            uint64_t v23 = degas::Database::setEdgeAttributeValue(*(degas::Database **)this, v21, v6, v22);
            goto LABEL_29;
          case 2u:
            double v24 = sqlite3_column_double(*(sqlite3_stmt **)v30, 2);
            uint64_t v23 = degas::Database::setEdgeAttributeValue(*(degas::Database **)this, v21, v6, v24);
            goto LABEL_29;
          case 3u:
            __p = 0;
            uint64_t v28 = 0;
            uint64_t v29 = 0;
            degas::Statement::stringColumnValue((sqlite3_stmt **)v30, 3, (uint64_t)&__p);
            uint64_t v17 = degas::Database::setEdgeAttributeValue(*(void *)this, v21, v6, (uint64_t *)&__p);
            if (SHIBYTE(v29) < 0) {
              operator delete(__p);
            }
            break;
          case 4u:
            sqlite3_int64 v25 = sqlite3_column_int64(*(sqlite3_stmt **)v30, 1);
            uint64_t v23 = degas::Database::setEdgeAttributeValueUnsigned(*(degas::Database **)this, v21, v6, v25);
LABEL_29:
            uint64_t v17 = v23;
            break;
          default:
            break;
        }
        if (v17 >= 2)
        {
          int v18 = 1;
          uint64_t v14 = v17;
          goto LABEL_33;
        }
      }
      int v18 = 0;
LABEL_33:
      degas::Cursor::~Cursor(&v30);
      degas::AttributeInstanceTable::~AttributeInstanceTable((degas::AttributeInstanceTable *)v32);
    }
    uint64_t v1 = v14;
    if (SHIBYTE(v34) < 0) {
      operator delete(v33[0]);
    }
    if (v18) {
      goto LABEL_41;
    }
  }
  if (v5 == 2) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = v5;
  }
LABEL_41:
  degas::Cursor::~Cursor(v35);
  return v1;
}

void sub_1D1781CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, uint64_t a16, char a17)
{
  degas::AttributeInstanceTable::~AttributeInstanceTable((degas::AttributeInstanceTable *)&a17);
  if (*(char *)(v17 - 81) < 0) {
    operator delete(*(void **)(v17 - 104));
  }
  degas::Cursor::~Cursor((degas::Statement **)(v17 - 80));
  _Unwind_Resume(a1);
}

uint64_t degas::Migration::migrateBitmapSchema(sqlite3 **this)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *this;
  uint64_t v4 = (sqlite3 *)((char *)*this + 80);
  AllStatement = degas::LabelTable::readAllStatement(v4);
  sqlite3_int64 v6 = (atomic_ullong *)AllStatement[1];
  v27[0] = (degas::Statement *)*AllStatement;
  v27[1] = (degas::Statement *)v6;
  if (v6) {
    atomic_fetch_add_explicit(v6 + 1, 1uLL, memory_order_relaxed);
  }
  uint64_t v7 = 0;
  uint64_t v8 = MEMORY[0x1E4F14500];
  while (degas::Statement::next((sqlite3_stmt **)v27[0]) == 1)
  {
    sqlite3_int64 v9 = sqlite3_column_int64(*(sqlite3_stmt **)v27[0], 0);
    v32[0] = (degas::Statement *)sqlite3_column_blob(*(sqlite3_stmt **)v27[0], 2);
    *(_OWORD *)__p = 0u;
    memset(v36, 0, 25);
    if (v32[0]
      && (degas::Bitmap::replaceFromEncodedBuffer((degas::Bitmap *)__p, (const unsigned __int8 **)v32) & 1) == 0)
    {
      ppStmt[0] = (sqlite3_stmt *)v36;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)ppStmt);
      uint64_t v1 = 4;
LABEL_38:
      degas::Cursor::~Cursor(v27);
      return v1;
    }
    *(void *)v37 = sqlite3_column_blob(*(sqlite3_stmt **)v27[0], 3);
    *(_OWORD *)ppStmt = 0u;
    memset(v34, 0, 25);
    if (*(void *)v37
      && (degas::Bitmap::replaceFromEncodedBuffer((degas::Bitmap *)ppStmt, (const unsigned __int8 **)v37) & 1) == 0)
    {
      char v10 = 0;
      uint64_t v7 = 4;
      uint64_t v1 = 4;
    }
    else
    {
      uint64_t v7 = degas::LabelTable::update(v4, v9, (const degas::Bitmap *)__p, (const degas::Bitmap *)ppStmt);
      if (v7)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          sqlite3_int64 v11 = sqlite3_errmsg(*((sqlite3 **)v3 + 14));
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v11;
          _os_log_error_impl(&dword_1D1654000, v8, OS_LOG_TYPE_ERROR, "node update failed: %s", buf, 0xCu);
        }
        char v10 = 0;
        uint64_t v1 = v7;
      }
      else
      {
        char v10 = 1;
      }
    }
    *(void *)buf = v34;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    ppStmt[0] = (sqlite3_stmt *)v36;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)ppStmt);
    if ((v10 & 1) == 0) {
      goto LABEL_38;
    }
  }
  degas::Cursor::~Cursor(v27);
  sqlite3_int64 v12 = *this;
  uint64_t v13 = (sqlite3 *)((char *)*this + 192);
  degas::NodeCursor::NodeCursor(v32);
  degas::NodeCursor::setForSelectAll((degas::NodeCursor *)v32, v13);
  uint64_t v14 = this[1];
  std::string::basic_string[abi:ne180100]<0>(__p, "update Node set labels=?2, edgesIn=?3, edgesOut=?4 where identifier=?1");
  degas::Statement::Statement((sqlite3_stmt **)buf, v14, (uint64_t)__p);
  if (v36[7] < 0) {
    operator delete(__p[0]);
  }
  double v15 = MEMORY[0x1E4F14500];
  while (1)
  {
    int v16 = degas::Statement::next((sqlite3_stmt **)v32[0]);
    BOOL v17 = v16 == 1;
    if (v16 != 1) {
      break;
    }
    sqlite3_int64 v18 = sqlite3_column_int64(*(sqlite3_stmt **)v32[0], 0);
    uint64_t v31 = (unsigned __int8 *)sqlite3_column_blob(*(sqlite3_stmt **)v32[0], 1);
    *(_OWORD *)__p = 0u;
    memset(v36, 0, 25);
    if (v31 && (degas::Bitmap::replaceFromEncodedBuffer((degas::Bitmap *)__p, (const unsigned __int8 **)&v31) & 1) == 0)
    {
      ppStmt[0] = (sqlite3_stmt *)v36;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)ppStmt);
      uint64_t v7 = 4;
      BOOL v17 = 1;
      uint64_t v1 = 4;
      break;
    }
    v30 = (unsigned __int8 *)sqlite3_column_blob(*(sqlite3_stmt **)v32[0], 2);
    *(_OWORD *)ppStmt = 0u;
    memset(v34, 0, 25);
    if (v30
      && (degas::Bitmap::replaceFromEncodedBuffer((degas::Bitmap *)ppStmt, (const unsigned __int8 **)&v30) & 1) == 0)
    {
      uint64_t v7 = 4;
      int v19 = 1;
      uint64_t v1 = 4;
    }
    else
    {
      uint64_t v29 = (unsigned __int8 *)sqlite3_column_blob(*(sqlite3_stmt **)v32[0], 3);
      *(_OWORD *)v27 = 0u;
      memset(v28, 0, 25);
      if (v29
        && (degas::Bitmap::replaceFromEncodedBuffer((degas::Bitmap *)v27, (const unsigned __int8 **)&v29) & 1) == 0)
      {
        uint64_t v7 = 4;
        int v19 = 1;
        uint64_t v1 = 4;
      }
      else
      {
        degas::Statement::prepareForUse((degas::Statement *)buf);
        degas::Statement::bindInteger((sqlite3_stmt **)buf, 1, v18);
        degas::Statement::bindBitmap((degas::Statement *)buf, (const Bitmap *)2, (const degas::Bitmap *)__p);
        degas::Statement::bindBitmap((degas::Statement *)buf, (const Bitmap *)3, (const degas::Bitmap *)ppStmt);
        degas::Statement::bindBitmap((degas::Statement *)buf, (const Bitmap *)4, (const degas::Bitmap *)v27);
        uint64_t v7 = degas::Statement::update((sqlite3_stmt **)buf);
        if (v7)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            uint64_t v20 = sqlite3_errmsg(*((sqlite3 **)v12 + 28));
            *(_DWORD *)v37 = 136315138;
            *(void *)&v37[4] = v20;
            _os_log_error_impl(&dword_1D1654000, v15, OS_LOG_TYPE_ERROR, "node update failed: %s", v37, 0xCu);
          }
          int v19 = 1;
          uint64_t v1 = v7;
        }
        else
        {
          int v19 = 0;
        }
      }
      *(void *)v37 = v28;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v37);
    }
    v27[0] = (degas::Statement *)v34;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v27);
    ppStmt[0] = (sqlite3_stmt *)v36;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)ppStmt);
    if (v19)
    {
      BOOL v17 = 1;
      break;
    }
  }
  degas::Statement::~Statement((degas::Statement *)buf);
  degas::Cursor::~Cursor(v32);
  if (!v17)
  {
    sqlite3_int64 v21 = *this;
    sqlite3_int64 v22 = (sqlite3 *)((char *)*this + 248);
    degas::EdgeCursor::EdgeCursor(v27);
    degas::EdgeCursor::setForSelectAll((degas::EdgeCursor *)v27, v22);
    uint64_t v23 = this[1];
    std::string::basic_string[abi:ne180100]<0>(__p, "update Edge set labels=?2 where identifier=?1");
    degas::Statement::Statement(ppStmt, v23, (uint64_t)__p);
    if (v36[7] < 0) {
      operator delete(__p[0]);
    }
    while (degas::Statement::next((sqlite3_stmt **)v27[0]) == 1)
    {
      sqlite3_int64 v24 = sqlite3_column_int64(*(sqlite3_stmt **)v27[0], 0);
      v32[0] = (degas::Statement *)sqlite3_column_blob(*(sqlite3_stmt **)v27[0], 1);
      *(_OWORD *)__p = 0u;
      memset(v36, 0, 25);
      if (v32[0]
        && (degas::Bitmap::replaceFromEncodedBuffer((degas::Bitmap *)__p, (const unsigned __int8 **)v32) & 1) == 0)
      {
        uint64_t v7 = 4;
LABEL_51:
        *(void *)buf = v36;
        std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
        break;
      }
      degas::Statement::prepareForUse((degas::Statement *)ppStmt);
      degas::Statement::bindInteger(ppStmt, 1, v24);
      degas::Statement::bindBitmap((degas::Statement *)ppStmt, (const Bitmap *)2, (const degas::Bitmap *)__p);
      uint64_t v7 = degas::Statement::update(ppStmt);
      if (v7)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          sqlite3_int64 v25 = sqlite3_errmsg(*((sqlite3 **)v21 + 35));
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v25;
          _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "edge update failed: %s", buf, 0xCu);
        }
        goto LABEL_51;
      }
      *(void *)buf = v36;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    }
    degas::Statement::~Statement((degas::Statement *)ppStmt);
    degas::Cursor::~Cursor(v27);
    return v7;
  }
  return v1;
}

void sub_1D178236C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  *(void *)(v35 - 128) = v34;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v35 - 128));
  degas::Statement::~Statement((degas::Statement *)&a23);
  degas::Cursor::~Cursor((degas::Statement **)&a11);
  _Unwind_Resume(a1);
}

uint64_t degas::Migration::migrateWeights(degas::Migration *this)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  std::string::basic_string[abi:ne180100]<0>(v9, (char *)kgDefaultWeightPropertyName);
  uint64_t v2 = *(void *)this;
  degas::AttributeCursor::AttributeCursor((uint64_t *)v8, (uint64_t *)v9, (degas::AttributeTable *)(*(void *)this + 304));
  sqlite3_int64 v3 = 0;
  while (degas::Statement::next((sqlite3_stmt **)v8[0]) == 1)
    sqlite3_int64 v3 = sqlite3_column_int64(*(sqlite3_stmt **)v8[0], 0);
  if (v3)
  {
LABEL_5:
    std::string::basic_string[abi:ne180100]<0>(buf, "select identifier, weight from Node");
    degas::Database::cursorForAdhocStatement();
  }
  uint64_t v4 = *(void *)this;
  if (*(unsigned char *)(*(void *)this + 32))
  {
    uint64_t v5 = 8;
  }
  else
  {
    *(void *)buf = 0;
    uint64_t v5 = degas::AttributeTable::insert((sqlite3 **)(v4 + 304), (sqlite3_int64 *)buf, (uint64_t *)v9);
    if (!v5) {
      goto LABEL_5;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sqlite3_int64 v6 = sqlite3_errmsg(*(sqlite3 **)(v2 + 336));
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v6;
    _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "weight migration failed: %s", buf, 0xCu);
  }
  degas::Cursor::~Cursor(v8);
  if (v10 < 0) {
    operator delete(v9[0]);
  }
  return v5;
}

void sub_1D1782908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, degas::Statement *a10, uint64_t a11, degas::Statement *a12, uint64_t a13, degas::Statement *a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  degas::Statement::~Statement((degas::Statement *)&a29);
  degas::Statement::~Statement((degas::Statement *)(v34 - 80));
  degas::Cursor::~Cursor(&a10);
  degas::Cursor::~Cursor(&a12);
  degas::Cursor::~Cursor(&a14);
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t degas::Migration::migrateEdgeIndex(degas::Migration *this)
{
  uint64_t v2 = (sqlite3 *)*((void *)this + 1);
  std::string::basic_string[abi:ne180100]<0>(__p, "create index edge_source_idx on edge (sourceNodeId)");
  degas::Statement::Statement(ppStmt, v2, (uint64_t)__p);
  if (v9 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v3 = degas::Statement::update(ppStmt);
  if (!v3)
  {
    uint64_t v4 = (sqlite3 *)*((void *)this + 1);
    std::string::basic_string[abi:ne180100]<0>(v6, "create index edge_target_idx on edge (targetNodeId)");
    degas::Statement::Statement((sqlite3_stmt **)__p, v4, (uint64_t)v6);
    if (v7 < 0) {
      operator delete(v6[0]);
    }
    uint64_t v3 = degas::Statement::update((sqlite3_stmt **)__p);
    degas::Statement::~Statement((degas::Statement *)__p);
  }
  degas::Statement::~Statement((degas::Statement *)ppStmt);
  return v3;
}

void sub_1D1782ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  degas::Statement::~Statement((degas::Statement *)&a16);
  degas::Statement::~Statement((degas::Statement *)(v16 - 40));
  _Unwind_Resume(a1);
}

void sub_1D1782B1C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  JUMPOUT(0x1D1782B14);
}

uint64_t degas::Migration::migratePruneSchema(sqlite3 **this)
{
  if (sqlite3_table_column_metadata(this[1], 0, "Attribute", "dataType", 0, 0, 0, 0, 0)) {
    goto LABEL_34;
  }
  uint64_t v3 = this[1];
  std::string::basic_string[abi:ne180100]<0>(__p, "alter table Attribute drop column dataType");
  degas::Statement::Statement(ppStmt, v3, (uint64_t)__p);
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v2 = degas::Statement::update(ppStmt);
  degas::Statement::~Statement((degas::Statement *)ppStmt);
  if (!v2)
  {
LABEL_34:
    if (sqlite3_table_column_metadata(this[1], 0, "Attribute", "flags", 0, 0, 0, 0, 0)) {
      goto LABEL_35;
    }
    uint64_t v4 = this[1];
    std::string::basic_string[abi:ne180100]<0>(__p, "alter table Attribute drop column flags");
    degas::Statement::Statement(ppStmt, v4, (uint64_t)__p);
    if (v11 < 0) {
      operator delete(__p[0]);
    }
    uint64_t v2 = degas::Statement::update(ppStmt);
    degas::Statement::~Statement((degas::Statement *)ppStmt);
    if (!v2)
    {
LABEL_35:
      if (sqlite3_table_column_metadata(this[1], 0, "Node", "attrIds", 0, 0, 0, 0, 0)) {
        goto LABEL_36;
      }
      uint64_t v5 = this[1];
      std::string::basic_string[abi:ne180100]<0>(__p, "alter table Node drop column attrIds");
      degas::Statement::Statement(ppStmt, v5, (uint64_t)__p);
      if (v11 < 0) {
        operator delete(__p[0]);
      }
      uint64_t v2 = degas::Statement::update(ppStmt);
      degas::Statement::~Statement((degas::Statement *)ppStmt);
      if (!v2)
      {
LABEL_36:
        if (sqlite3_table_column_metadata(this[1], 0, "Edge", "attrIds", 0, 0, 0, 0, 0)) {
          goto LABEL_37;
        }
        sqlite3_int64 v6 = this[1];
        std::string::basic_string[abi:ne180100]<0>(__p, "alter table Edge drop column attrIds");
        degas::Statement::Statement(ppStmt, v6, (uint64_t)__p);
        if (v11 < 0) {
          operator delete(__p[0]);
        }
        uint64_t v2 = degas::Statement::update(ppStmt);
        degas::Statement::~Statement((degas::Statement *)ppStmt);
        if (!v2)
        {
LABEL_37:
          if (sqlite3_table_column_metadata(this[1], 0, "TombstoneNode", "attrIds", 0, 0, 0, 0, 0)) {
            goto LABEL_38;
          }
          char v7 = this[1];
          std::string::basic_string[abi:ne180100]<0>(__p, "alter table TombstoneNode drop column attrIds");
          degas::Statement::Statement(ppStmt, v7, (uint64_t)__p);
          if (v11 < 0) {
            operator delete(__p[0]);
          }
          uint64_t v2 = degas::Statement::update(ppStmt);
          degas::Statement::~Statement((degas::Statement *)ppStmt);
          if (!v2)
          {
LABEL_38:
            if (sqlite3_table_column_metadata(this[1], 0, "TombstoneEdge", "attrIds", 0, 0, 0, 0, 0))
            {
              return 0;
            }
            else
            {
              uint64_t v8 = this[1];
              std::string::basic_string[abi:ne180100]<0>(__p, "alter table TombstoneEdge drop column attrIds");
              degas::Statement::Statement(ppStmt, v8, (uint64_t)__p);
              if (v11 < 0) {
                operator delete(__p[0]);
              }
              uint64_t v2 = degas::Statement::update(ppStmt);
              degas::Statement::~Statement((degas::Statement *)ppStmt);
            }
          }
        }
      }
    }
  }
  return v2;
}

void sub_1D1782E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
}

uint64_t degas::Migration::migrate(degas::Migration *this, int a2, int a3)
{
  if (!a2) {
    goto LABEL_39;
  }
  BOOL v5 = a3 > 1 && a2 < 2;
  BOOL v6 = a2 >= 4 || a3 <= 3;
  BOOL v7 = !v6;
  BOOL v8 = a2 >= 6 || a3 <= 5;
  BOOL v9 = !v8;
  BOOL v10 = a2 >= 8 || a3 <= 7;
  BOOL v11 = !v10;
  if (a2 > 2 || a3 < 3 || (uint64_t result = degas::Migration::migrateBitmapSchema((sqlite3 **)this), !result))
  {
    if (!v11 || (uint64_t result = degas::Migration::migratePruneSchema((sqlite3 **)this), !result))
    {
      if (!v5 || (uint64_t result = degas::Migration::migrateAttributeSchema(this), !result))
      {
        if (!v7 || (uint64_t result = degas::Migration::migrateWeights(this), !result))
        {
          if (!v9 || (uint64_t result = degas::Migration::migrateEdgeIndex(this), !result))
          {
LABEL_39:
            if (!*(unsigned char *)(*(void *)this + 32)) {
              degas::MetadataTable::insertOrUpdate((degas::MetadataTable *)(*(void *)this + 136), 3, a3);
            }
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t degas::BitsetPoolPage::BitsetPoolPage(uint64_t this, os_unfair_lock_s *a2)
{
  *(void *)(this + 8352) = 0;
  *(void *)(this + 8360) = a2;
  return this;
}

{
  *(void *)(this + 8352) = 0;
  *(void *)(this + 8360) = a2;
  return this;
}

uint64_t degas::BitsetPoolPage::allocBitsetSlot(degas::BitsetPoolPage *this)
{
  unsigned int v2 = degas::BitsetPoolPage::provideFreeSlot(this);
  *((void *)this + 1044) |= 1 << v2;
  return (uint64_t)this + 144 * v2;
}

uint64_t degas::BitsetPoolPage::provideFreeSlot(degas::BitsetPoolPage *this)
{
  unint64_t v1 = *((void *)this + 1044);
  if ((~v1 & 0x3FFFFFFFFFFFFFFLL) == 0) {
    __assert_rtn("provideFreeSlot", "bitsetPool.cpp", 129, "!isFull()");
  }
  uint64_t result = 0;
  while (((v1 >> result) & 1) != 0)
  {
    if (++result == 58) {
      return 0;
    }
  }
  return result;
}

void degas::BitsetPoolPage::allocBitset(degas::BitsetPoolPage *this, degas::BitsetPtr *a2, uint64_t a3)
{
  unsigned int v6 = degas::BitsetPoolPage::provideFreeSlot(this);
  *((void *)this + 1044) |= 1 << v6;
  BOOL v7 = (char *)this + 144 * v6;
  *(void *)BOOL v7 = 0;
  *((void *)v7 + 1) = a3;
  *((_OWORD *)v7 + 1) = 0u;
  *((_OWORD *)v7 + 2) = 0u;
  *((_OWORD *)v7 + 3) = 0u;
  *((_OWORD *)v7 + 4) = 0u;
  *((_OWORD *)v7 + 5) = 0u;
  *((_OWORD *)v7 + 6) = 0u;
  *((_OWORD *)v7 + 7) = 0u;
  *((_OWORD *)v7 + 8) = 0u;
  degas::BitsetPtr::releaseBitset(a2);
  *(void *)a2 = v7;
  *((void *)a2 + 1) = this;
  ++*(_DWORD *)v7;
}

void degas::BitsetPoolPage::allocBitset(degas::BitsetPoolPage *this, degas::BitsetPtr *a2, const degas::Bitset *a3)
{
  unsigned int v6 = degas::BitsetPoolPage::provideFreeSlot(this);
  BOOL v7 = (char *)this + 144 * v6;
  *((void *)this + 1044) |= 1 << v6;
  int v8 = *((_DWORD *)a3 + 1);
  *(_DWORD *)BOOL v7 = 0;
  *((_DWORD *)v7 + 1) = v8;
  *((void *)v7 + 1) = *((void *)a3 + 1);
  long long v9 = *((_OWORD *)a3 + 4);
  long long v11 = *((_OWORD *)a3 + 1);
  long long v10 = *((_OWORD *)a3 + 2);
  *((_OWORD *)v7 + 3) = *((_OWORD *)a3 + 3);
  *((_OWORD *)v7 + 4) = v9;
  *((_OWORD *)v7 + 1) = v11;
  *((_OWORD *)v7 + 2) = v10;
  long long v12 = *((_OWORD *)a3 + 8);
  long long v14 = *((_OWORD *)a3 + 5);
  long long v13 = *((_OWORD *)a3 + 6);
  *((_OWORD *)v7 + 7) = *((_OWORD *)a3 + 7);
  *((_OWORD *)v7 + 8) = v12;
  *((_OWORD *)v7 + 5) = v14;
  *((_OWORD *)v7 + 6) = v13;
  degas::BitsetPtr::releaseBitset(a2);
  *(void *)a2 = v7;
  *((void *)a2 + 1) = this;
  ++*(_DWORD *)v7;
}

void degas::BitsetPoolPage::allocBitset(degas::BitsetPoolPage *this, degas::BitsetPtr *a2, const unsigned __int8 **a3)
{
  unsigned int v6 = degas::BitsetPoolPage::provideFreeSlot(this);
  BOOL v7 = (degas::BitsetPoolPage *)((char *)this + 144 * v6);
  *((void *)this + 1044) |= 1 << v6;
  degas::Bitset::Bitset(v7, a3);
  degas::BitsetPtr::releaseBitset(a2);
  *(void *)a2 = v7;
  *((void *)a2 + 1) = this;
  ++*(_DWORD *)v7;
}

void degas::BitsetPoolPage::releaseBitset(os_unfair_lock_t *this, degas::Bitset *a2)
{
  int v2 = (int)a2;
  os_unfair_lock_lock(this[1045]);
  this[1044] = (os_unfair_lock_t)((unint64_t)this[1044] & ~(1 << ((v2 - (int)this) / 0x90u)));
  uint64_t v4 = this[1045];
  os_unfair_lock_unlock(v4);
}

BOOL degas::BitsetPoolPage::isFull(degas::BitsetPoolPage *this)
{
  return (~*((void *)this + 1044) & 0x3FFFFFFFFFFFFFFLL) == 0;
}

BOOL degas::BitsetPoolPage::isEmpty(degas::BitsetPoolPage *this)
{
  return *((void *)this + 1044) == 0;
}

uint64_t degas::BitsetPool::BitsetPool(uint64_t this)
{
  *(void *)this = this;
  *(void *)(this + 8) = this;
  *(void *)(this + 16) = 0;
  *(void *)(this + 24) = this;
  *(_DWORD *)(this + 32) = 0;
  return this;
}

{
  *(void *)this = this;
  *(void *)(this + 8) = this;
  *(void *)(this + 16) = 0;
  *(void *)(this + 24) = this;
  *(_DWORD *)(this + 32) = 0;
  return this;
}

uint64_t degas::BitsetPool::getPageWithSlotFree(degas::BitsetPool *this)
{
  unint64_t v1 = (degas::BitsetPool *)*((void *)this + 3);
  if (v1 == this)
  {
LABEL_5:
    uint64_t v4 = this;
    do
    {
      uint64_t v4 = (degas::BitsetPool *)*((void *)v4 + 1);
      *((void *)this + 3) = v4;
      if (v4 == v1) {
        operator new();
      }
      uint64_t v3 = *((void *)v4 + 2);
    }
    while ((~*(void *)(v3 + 8352) & 0x3FFFFFFFFFFFFFFLL) == 0);
  }
  else
  {
    int v2 = (degas::BitsetPool *)*((void *)this + 3);
    while (1)
    {
      uint64_t v3 = *((void *)v2 + 2);
      if ((~*(void *)(v3 + 8352) & 0x3FFFFFFFFFFFFFFLL) != 0) {
        break;
      }
      int v2 = (degas::BitsetPool *)*((void *)v2 + 1);
      *((void *)this + 3) = v2;
      if (v2 == this) {
        goto LABEL_5;
      }
    }
  }
  return v3;
}

void degas::BitsetPool::allocBitset(os_unfair_lock_s *this, degas::BitsetPtr *a2, uint64_t a3)
{
  unsigned int v6 = this + 8;
  os_unfair_lock_lock(this + 8);
  PageWithSlotFree = (degas::BitsetPoolPage *)degas::BitsetPool::getPageWithSlotFree((degas::BitsetPool *)this);
  degas::BitsetPoolPage::allocBitset(PageWithSlotFree, a2, a3);
  os_unfair_lock_unlock(v6);
}

void degas::BitsetPool::allocBitset(os_unfair_lock_s *this, degas::BitsetPtr *a2, const degas::Bitset *a3)
{
  unsigned int v6 = this + 8;
  os_unfair_lock_lock(this + 8);
  PageWithSlotFree = (degas::BitsetPoolPage *)degas::BitsetPool::getPageWithSlotFree((degas::BitsetPool *)this);
  degas::BitsetPoolPage::allocBitset(PageWithSlotFree, a2, a3);
  os_unfair_lock_unlock(v6);
}

void degas::BitsetPool::allocBitset(os_unfair_lock_s *this, degas::BitsetPtr *a2, const unsigned __int8 **a3)
{
  unsigned int v6 = this + 8;
  os_unfair_lock_lock(this + 8);
  PageWithSlotFree = (degas::BitsetPoolPage *)degas::BitsetPool::getPageWithSlotFree((degas::BitsetPool *)this);
  degas::BitsetPoolPage::allocBitset(PageWithSlotFree, a2, a3);
  os_unfair_lock_unlock(v6);
}

void degas::BitsetPool::purgeEmptyPages(os_unfair_lock_s *this)
{
  int v2 = this + 8;
  os_unfair_lock_lock(this + 8);
  uint64_t v3 = *(os_unfair_lock_s **)&this[2]._os_unfair_lock_opaque;
  while (v3 != this)
  {
    uint64_t v4 = *(void *)&v3[4]._os_unfair_lock_opaque;
    if (*(void *)(v4 + 8352))
    {
      uint64_t v3 = *(os_unfair_lock_s **)&v3[2]._os_unfair_lock_opaque;
    }
    else
    {
      uint64_t v5 = *(void *)&this[6]._os_unfair_lock_opaque;
      if (*(void *)(v5 + 16) == v4) {
        *(void *)&this[6]._os_unfair_lock_opaque = *(void *)(v5 + 8);
      }
      uint64_t v6 = *(void *)&v3->_os_unfair_lock_opaque;
      BOOL v7 = *(os_unfair_lock_s **)&v3[2]._os_unfair_lock_opaque;
      *(void *)(v6 + 8) = v7;
      **(void **)&v3[2]._os_unfair_lock_opaque = v6;
      --*(void *)&this[4]._os_unfair_lock_opaque;
      operator delete(v3);
      MEMORY[0x1D25F9A90](v4, 0x1020C4058D1BB3BLL);
      uint64_t v3 = v7;
    }
  }
  os_unfair_lock_unlock(v2);
}

uint64_t degas::getBitsetPool(degas *this)
{
  if (degas::getBitsetPool(void)::onceToken != -1) {
    dispatch_once(&degas::getBitsetPool(void)::onceToken, &__block_literal_global_3916);
  }
  return degas::getBitsetPool(void)::sPool;
}

void ___ZN5degas13getBitsetPoolEv_block_invoke()
{
}

void *degas::BitsetPtr::BitsetPtr(void *this, degas::Bitset *a2, degas::BitsetPoolPage *a3)
{
  *this = a2;
  this[1] = a3;
  ++*(_DWORD *)a2;
  return this;
}

{
  *this = a2;
  this[1] = a3;
  ++*(_DWORD *)a2;
  return this;
}

__n128 degas::BitsetPtr::BitsetPtr(__n128 *this, __n128 *a2)
{
  __n128 result = *a2;
  *this = *a2;
  ++*(_DWORD *)result.n128_u64[0];
  return result;
}

{
  __n128 result;

  __n128 result = *a2;
  *this = *a2;
  ++*(_DWORD *)result.n128_u64[0];
  return result;
}

void degas::BitsetPtr::releaseBitset(degas::BitsetPtr *this)
{
  int v2 = (os_unfair_lock_t *)*((void *)this + 1);
  if (v2)
  {
    uint64_t v3 = *(degas::Bitset **)this;
    if (*(void *)this)
    {
      if ((*(_DWORD *)v3)-- == 1) {
        degas::BitsetPoolPage::releaseBitset(v2, v3);
      }
    }
  }
  *(void *)this = 0;
}

void degas::BitsetPtr::~BitsetPtr(degas::BitsetPtr *this)
{
  *((void *)this + 1) = 0;
}

{
  degas::BitsetPtr::releaseBitset(this);
  *((void *)this + 1) = 0;
}

degas::BitsetPtr *degas::BitsetPtr::operator=(degas::BitsetPtr *a1, long long *a2)
{
  degas::BitsetPtr::releaseBitset(a1);
  long long v4 = *a2;
  *(_OWORD *)a1 = *a2;
  if ((void)v4) {
    ++*(_DWORD *)v4;
  }
  return a1;
}

BOOL degas::BitsetPtr::operator==(void *a1, void *a2)
{
  return *a1 == *a2;
}

void degas::BitsetPtr::reset(degas::BitsetPtr *this, degas::Bitset *a2, degas::BitsetPoolPage *a3)
{
  *(void *)this = a2;
  if (a3) {
    *((void *)this + 1) = a3;
  }
  ++*(_DWORD *)a2;
}

BOOL degas::BitsetPtr::unique(degas::BitsetPtr *this)
{
  return *(void *)this && **(_DWORD **)this == 1;
}

uint64_t degas::NodeFilter_Labels::resolveNodes(degas::NodeFilter_Labels *this, degas::Bitmap *a2)
{
  uint64_t v3 = *((void *)this + 1);
  v7[0] = (const degas::NodeTable *)(v3 + 192);
  v7[1] = (const degas::NodeTable *)v3;
  long long v4 = (degas::NodeFilter_Labels *)((char *)this + 16);
  if (degas::Bitmap::count((degas::NodeFilter_Labels *)((char *)this + 16)) != 1) {
    return degas::NodeLabelQuery::nodesForAllLabels(v7, v4, a2, 0);
  }
  sqlite3_int64 Bit = degas::Bitmap::firstBit(v4);
  return degas::NodeLabelQuery::nodesForLabel(v7, Bit, a2);
}

void degas::NodeFilter_Labels::~NodeFilter_Labels(degas::NodeFilter_Labels *this)
{
  *(void *)this = &unk_1F2801F88;
  unint64_t v1 = (void **)((char *)this + 32);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1D25F9A90);
}

{
  void **v1;

  *(void *)this = &unk_1F2801F88;
  unint64_t v1 = (void **)((char *)this + 32);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v1;

  *(void *)this = &unk_1F2801F88;
  unint64_t v1 = (void **)((char *)this + 32);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
}

uint64_t degas::NodeFilter_Attribute::resolveNodes(degas::NodeFilter_Attribute *this, degas::Bitmap *a2)
{
  long long v4 = (degas::Database *)*((void *)this + 1);
  v7[0] = (uint64_t)v4 + 472;
  v7[1] = degas::Database::nodeCount(v4);
  int v5 = *((_DWORD *)this + 4);
  switch(v5)
  {
    case 3:
      return degas::AttributeQuery::elementsForAttributeValue(v7, *((void *)this + 3), (uint64_t)this + 48, 1, a2);
    case 2:
      return degas::AttributeQuery::elementsForAttributeValue(v7, *((void *)this + 3), 1, a2, *((double *)this + 5));
    case 1:
      return degas::AttributeQuery::elementsForAttributeValue(v7, *((void *)this + 3), *((void *)this + 4), 1, a2);
  }
  return 3;
}

void degas::NodeFilter_Attribute::~NodeFilter_Attribute(void **this)
{
  *this = &unk_1F2801FB0;
  if (*((char *)this + 71) < 0) {
    operator delete(this[6]);
  }
  JUMPOUT(0x1D25F9A90);
}

{
  *this = &unk_1F2801FB0;
  if (*((char *)this + 71) < 0) {
    operator delete(this[6]);
  }
}

{
  *this = &unk_1F2801FB0;
  if (*((char *)this + 71) < 0) {
    operator delete(this[6]);
  }
}

uint64_t degas::NodeFilter_Or::resolveNodes(degas::NodeFilter_Or *this, degas::Bitmap *a2)
{
  long long v9 = 0u;
  memset(v10, 0, 25);
  uint64_t v3 = (void *)*((void *)this + 2);
  long long v4 = (void *)*((void *)this + 3);
  if (v3 == v4)
  {
LABEL_4:
    degas::Bitmap::operator=(a2, &v9);
    uint64_t v5 = 0;
  }
  else
  {
    while (1)
    {
      long long v7 = 0u;
      memset(v8, 0, 25);
      uint64_t v5 = (*(uint64_t (**)(void, long long *))(*(void *)*v3 + 16))(*v3, &v7);
      if (v5) {
        break;
      }
      degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)&v9, (uint64_t)&v7);
      long long v11 = (void **)v8;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v11);
      v3 += 2;
      if (v3 == v4) {
        goto LABEL_4;
      }
    }
    long long v11 = (void **)v8;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v11);
  }
  *(void *)&long long v7 = v10;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  return v5;
}

void sub_1D1783D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  a9 = (void **)&a17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void degas::NodeFilter_Or::~NodeFilter_Or(degas::NodeFilter_Or *this)
{
  *(void *)this = &unk_1F2801FD8;
  unint64_t v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1D25F9A90);
}

{
  void **v1;

  *(void *)this = &unk_1F2801FD8;
  unint64_t v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v1;

  *(void *)this = &unk_1F2801FD8;
  unint64_t v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

uint64_t degas::NodeFilter_And::resolveNodes(degas::NodeFilter_And *this, degas::Bitmap *a2)
{
  long long v10 = 0u;
  memset(v11, 0, 25);
  uint64_t v3 = (void *)*((void *)this + 2);
  long long v4 = (void *)*((void *)this + 3);
  if (v3 == v4)
  {
LABEL_8:
    degas::Bitmap::operator=(a2, &v10);
    uint64_t v6 = 0;
  }
  else
  {
    char v5 = 1;
    while (1)
    {
      long long v8 = 0u;
      memset(v9, 0, 25);
      uint64_t v6 = (*(uint64_t (**)(void, long long *))(*(void *)*v3 + 16))(*v3, &v8);
      if (v6) {
        break;
      }
      if (v5) {
        degas::Bitmap::operator=(&v10, &v8);
      }
      else {
        degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)&v10, (degas::Bitmap *)&v8);
      }
      long long v12 = (void **)v9;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v12);
      char v5 = 0;
      v3 += 2;
      if (v3 == v4) {
        goto LABEL_8;
      }
    }
    long long v12 = (void **)v9;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v12);
  }
  *(void *)&long long v8 = v11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
  return v6;
}

void sub_1D1783F68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  a9 = (void **)&a17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void degas::NodeFilter_And::~NodeFilter_And(degas::NodeFilter_And *this)
{
  *(void *)this = &unk_1F2802000;
  unint64_t v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1D25F9A90);
}

{
  void **v1;

  *(void *)this = &unk_1F2802000;
  unint64_t v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v1;

  *(void *)this = &unk_1F2802000;
  unint64_t v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

void *degas::NodeFilter::NodeFilter(void *result, uint64_t a2)
{
  void *result = &unk_1F2801F60;
  result[1] = a2;
  return result;
}

degas::NodeFilter_Labels *degas::NodeFilter_Labels::NodeFilter_Labels(degas::NodeFilter_Labels *this, degas::Database *a2, long long **a3)
{
  *(void *)this = &unk_1F2801F88;
  *((void *)this + 1) = a2;
  *((void *)this + 2) = *a3;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 32, a3[2], a3[3], a3[3] - a3[2]);
  *((unsigned char *)this + 56) = *((unsigned char *)a3 + 40);
  return this;
}

{
  *(void *)this = &unk_1F2801F88;
  *((void *)this + 1) = a2;
  *((void *)this + 2) = *a3;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 32, a3[2], a3[3], a3[3] - a3[2]);
  *((unsigned char *)this + 56) = *((unsigned char *)a3 + 40);
  return this;
}

degas::NodeFilter_Labels *degas::NodeFilter_Labels::NodeFilter_Labels(degas::NodeFilter_Labels *this, degas::Database *a2, unint64_t a3)
{
  *(void *)this = &unk_1F2801F88;
  *((void *)this + 1) = a2;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)((char *)this + 41) = 0u;
  *((_OWORD *)this + 1) = 0u;
  degas::Bitmap::setBit((degas::NodeFilter_Labels *)((char *)this + 16), a3);
  return this;
}

void sub_1D17841D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  a10 = (void **)(v10 + 32);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

uint64_t degas::NodeFilter_Labels::addLabel(degas::NodeFilter_Labels *this, unint64_t a2)
{
  return degas::Bitmap::setBit((degas::NodeFilter_Labels *)((char *)this + 16), a2);
}

double degas::NodeFilter_Attribute::NodeFilter_Attribute(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_1F2801FB0;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = a3;
  *(void *)(a1 + 32) = a4;
  double result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  return result;
}

{
  double result;

  *(void *)a1 = &unk_1F2801FB0;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = a3;
  *(void *)(a1 + 32) = a4;
  double result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  return result;
}

uint64_t degas::NodeFilter_Attribute::NodeFilter_Attribute(uint64_t result, uint64_t a2, uint64_t a3, double a4)
{
  *(void *)double result = &unk_1F2801FB0;
  *(void *)(result + 8) = a2;
  *(_DWORD *)(result + 16) = 2;
  *(void *)(result + 24) = a3;
  *(void *)(result + 32) = 0;
  *(double *)(result + 40) = a4;
  *(void *)(result + 56) = 0;
  *(void *)(result + 64) = 0;
  *(void *)(result + 48) = 0;
  return result;
}

{
  *(void *)double result = &unk_1F2801FB0;
  *(void *)(result + 8) = a2;
  *(_DWORD *)(result + 16) = 2;
  *(void *)(result + 24) = a3;
  *(void *)(result + 32) = 0;
  *(double *)(result + 40) = a4;
  *(void *)(result + 56) = 0;
  *(void *)(result + 64) = 0;
  *(void *)(result + 48) = 0;
  return result;
}

uint64_t degas::NodeFilter_Attribute::NodeFilter_Attribute(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4)
{
  *(void *)a1 = &unk_1F2801FB0;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = 3;
  char v5 = (std::string *)(a1 + 48);
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = a3;
  if (*((char *)a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)a4, *((void *)a4 + 1));
  }
  else
  {
    long long v6 = *a4;
    v5->__r_.__value_.__r.__words[2] = *((void *)a4 + 2);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  return a1;
}

void *degas::NodeFilter_Or::NodeFilter_Or(void *result, uint64_t a2)
{
  void *result = &unk_1F2801FD8;
  result[1] = a2;
  result[3] = 0;
  result[4] = 0;
  result[2] = 0;
  return result;
}

{
  void *result = &unk_1F2801FD8;
  result[1] = a2;
  result[3] = 0;
  result[4] = 0;
  result[2] = 0;
  return result;
}

void *degas::NodeFilter_Or::NodeFilter_Or(void *a1, uint64_t a2, void **a3)
{
  *a1 = &unk_1F2801FD8;
  a1[1] = a2;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  std::vector<std::shared_ptr<degas::NodeFilter>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::NodeFilter>*,std::shared_ptr<degas::NodeFilter>*>(a1 + 2, *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
  return a1;
}

{
  *a1 = &unk_1F2801FD8;
  a1[1] = a2;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  std::vector<std::shared_ptr<degas::NodeFilter>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::NodeFilter>*,std::shared_ptr<degas::NodeFilter>*>(a1 + 2, *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
  return a1;
}

void *std::vector<std::shared_ptr<degas::NodeFilter>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::NodeFilter>*,std::shared_ptr<degas::NodeFilter>*>(void *result, void *a2, void *a3, unint64_t a4)
{
  if (a4)
  {
    if (a4 >> 60) {
      std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
    }
    long long v6 = result;
    double result = std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<degas::Predicate>>>(a4);
    void *v6 = result;
    v6[1] = result;
    for (v6[2] = &result[2 * v7]; a2 != a3; a2 += 2)
    {
      void *result = *a2;
      uint64_t v8 = a2[1];
      result[1] = v8;
      if (v8) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
      }
      result += 2;
    }
    v6[1] = result;
  }
  return result;
}

void sub_1D1784550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void degas::NodeFilter_Or::addSubFilter(uint64_t a1, long long *a2)
{
}

void *degas::NodeFilter_And::NodeFilter_And(void *result, uint64_t a2)
{
  void *result = &unk_1F2802000;
  result[1] = a2;
  result[3] = 0;
  result[4] = 0;
  result[2] = 0;
  return result;
}

{
  void *result = &unk_1F2802000;
  result[1] = a2;
  result[3] = 0;
  result[4] = 0;
  result[2] = 0;
  return result;
}

void *degas::NodeFilter_And::NodeFilter_And(void *a1, uint64_t a2, void **a3)
{
  *a1 = &unk_1F2802000;
  a1[1] = a2;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  std::vector<std::shared_ptr<degas::NodeFilter>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::NodeFilter>*,std::shared_ptr<degas::NodeFilter>*>(a1 + 2, *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
  return a1;
}

{
  *a1 = &unk_1F2802000;
  a1[1] = a2;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  std::vector<std::shared_ptr<degas::NodeFilter>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::NodeFilter>*,std::shared_ptr<degas::NodeFilter>*>(a1 + 2, *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
  return a1;
}

void degas::NodeFilter_And::addSubFilter(uint64_t a1, long long *a2)
{
}

uint64_t kgWaitForProtectedAccess(unsigned int a1, const char *a2)
{
  if (kgDeviceCanProceedForProtectionClass(a1, a2) == 1) {
    return 1;
  }
  uint64_t v20 = 0;
  sqlite3_int64 v21 = &v20;
  uint64_t v22 = 0x2000000000;
  int v23 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2000000000;
  int v19 = 0;
  uint64_t v14 = 0;
  double v15 = &v14;
  uint64_t v16 = 0x2000000000;
  int v17 = 0;
  char v5 = dispatch_queue_create("com.apple.photos.knowledge.unlock", 0);
  long long v6 = dispatch_semaphore_create(0);
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2000000000;
  int v13 = -1;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 0x40000000;
  v11[2] = __kgWaitForProtectedAccess_block_invoke;
  v11[3] = &unk_1E68DC0B0;
  v11[4] = v18;
  v11[5] = &v20;
  v11[6] = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 0x40000000;
  block[2] = __kgWaitForProtectedAccess_block_invoke_2;
  block[3] = &unk_1E68DC0D8;
  unsigned int v10 = a1;
  block[4] = v11;
  block[5] = v12;
  block[6] = &v14;
  block[7] = &v20;
  block[8] = v18;
  block[9] = v5;
  block[10] = a2;
  block[11] = v6;
  dispatch_sync(v5, block);
  if (*((_DWORD *)v15 + 6) == 1)
  {
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 0x40000000;
    v8[2] = __kgWaitForProtectedAccess_block_invoke_4;
    v8[3] = &unk_1E68DC100;
    v8[4] = v12;
    dispatch_sync(v5, v8);
  }
  dispatch_release(v6);
  dispatch_release(v5);
  uint64_t v4 = *((unsigned int *)v21 + 6);
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);
  return v4;
}

uint64_t kgDeviceCanProceedForProtectionClass(unsigned int a1, const char *a2)
{
  values[2] = *(void **)MEMORY[0x1E4F143B8];
  if (a1 < 2)
  {
    *(_OWORD *)&v8.st_dev = xmmword_1E68DC120;
    values[0] = *(void **)MEMORY[0x1E4F1CFD0];
    values[1] = 0;
    uint64_t v3 = 1;
    CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&v8, (const void **)values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    unsigned int v5 = MKBGetDeviceLockState();
    if (v5 <= 7 && ((1 << v5) & 0x89) != 0) {
      return v3;
    }
    if (a1 == 1)
    {
      memset(&v8, 0, sizeof(v8));
      if (stat(a2, &v8) == -1 && *__error() == 2) {
        return 1;
      }
    }
    return 0;
  }
  if (a1 != 2) {
    return a1 == 3;
  }
  return MEMORY[0x1F412F958]();
}

void *__kgWaitForProtectedAccess_block_invoke(void *result)
{
  uint64_t v1 = *(void *)(result[4] + 8);
  if (!*(_DWORD *)(v1 + 24))
  {
    *(_DWORD *)(v1 + 24) = 1;
    uint64_t v3 = result[5];
    int v2 = result[6];
    *(_DWORD *)(*(void *)(v3 + 8) + 24) = 1;
    return (void *)dispatch_semaphore_signal(v2);
  }
  return result;
}

void __kgWaitForProtectedAccess_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 96);
  if (v2 > 2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = off_1E68DC130[v2];
  }
  if (notify_register_dispatch(v3, (int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(dispatch_queue_t *)(a1 + 72), *(notify_handler_t *)(a1 + 32)))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v6 = 0;
      _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to register for protected device access notification", v6, 2u);
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    if (kgDeviceCanProceedForProtectionClass(*(_DWORD *)(a1 + 96), *(const char **)(a1 + 80)) == 1)
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
      if (!*(_DWORD *)(v4 + 24))
      {
        *(_DWORD *)(v4 + 24) = 1;
        unsigned int v5 = *(NSObject **)(a1 + 88);
        dispatch_semaphore_signal(v5);
      }
    }
  }
}

uint64_t __kgWaitForProtectedAccess_block_invoke_4(uint64_t a1)
{
  return notify_cancel(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

void sub_1D1785278(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D1785394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1785540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *degas::AttributeQuery::AttributeQuery(void *result, uint64_t a2, uint64_t a3)
{
  void *result = a2;
  result[1] = a3;
  return result;
}

{
  void *result = a2;
  result[1] = a3;
  return result;
}

uint64_t degas::AttributeQuery::elementsForAttributeValue(uint64_t *a1, sqlite3_int64 a2, sqlite3_int64 a3, int a4, degas::Bitmap *a5)
{
  uint64_t v9 = *a1;
  degas::AggregateValueCursor::AggregateValueCursor(v13);
  degas::AggregateValueCursor::setForValue((uint64_t *)v13, a2, a3, a4, v9);
  while (1)
  {
    unsigned int v10 = degas::Statement::next((sqlite3_stmt **)v13[0]);
    if (v10 != 1) {
      break;
    }
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v13[0], 0, a5);
  }
  if (v10 == 2) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10;
  }
  degas::Cursor::~Cursor(v13);
  return v11;
}

void sub_1D17863FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::AttributeQuery::elementsForAttributeValue(uint64_t *a1, sqlite3_int64 a2, int a3, degas::Bitmap *a4, double a5)
{
  uint64_t v9 = *a1;
  degas::AggregateValueCursor::AggregateValueCursor(v13);
  degas::AggregateValueCursor::setForValue((uint64_t *)v13, a2, a3, v9, a5);
  while (1)
  {
    unsigned int v10 = degas::Statement::next((sqlite3_stmt **)v13[0]);
    if (v10 != 1) {
      break;
    }
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v13[0], 0, a4);
  }
  if (v10 == 2) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10;
  }
  degas::Cursor::~Cursor(v13);
  return v11;
}

void sub_1D17864B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::AttributeQuery::elementsForAttributeValue(uint64_t *a1, sqlite3_int64 a2, uint64_t a3, int a4, degas::Bitmap *a5)
{
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string __p = *(std::string *)a3;
  }
  uint64_t v9 = *a1;
  degas::AggregateValueCursor::AggregateValueCursor(v13);
  degas::AggregateValueCursor::setForValue((uint64_t *)v13, a2, (uint64_t *)&__p, a4, v9);
  while (1)
  {
    unsigned int v10 = degas::Statement::next((sqlite3_stmt **)v13[0]);
    if (v10 != 1) {
      break;
    }
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v13[0], 0, a5);
  }
  degas::Cursor::~Cursor(v13);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v10 == 2) {
    return 0;
  }
  else {
    return v10;
  }
}

void sub_1D178659C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, degas::Statement *a16)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t degas::AttributeQuery::elementsForAttributeValues(uint64_t *a1, sqlite3_int64 a2, void *a3, int a4, int a5, degas::Bitmap *a6)
{
  uint64_t v11 = *a1;
  degas::AggregateValueCursor::AggregateValueCursor(v15);
  degas::AggregateValueCursor::setForValues((uint64_t *)v15, a2, a3, a4, a5, v11);
  while (1)
  {
    unsigned int v12 = degas::Statement::next((sqlite3_stmt **)v15[0]);
    if (v12 != 1) {
      break;
    }
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v15[0], 0, a6);
  }
  if (v12 == 2) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v12;
  }
  degas::Cursor::~Cursor(v15);
  return v13;
}

{
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  degas::Statement *v15[2];

  uint64_t v11 = *a1;
  degas::AggregateValueCursor::AggregateValueCursor(v15);
  degas::AggregateValueCursor::setForValues((uint64_t *)v15, a2, a3, a4, a5, v11);
  while (1)
  {
    unsigned int v12 = degas::Statement::next((sqlite3_stmt **)v15[0]);
    if (v12 != 1) {
      break;
    }
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v15[0], 0, a6);
  }
  if (v12 == 2) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v12;
  }
  degas::Cursor::~Cursor(v15);
  return v13;
}

{
  return degas::implElementsForAttributeValues<char const*>(a2, a3, a4, a5, a6, *a1);
}

void sub_1D178666C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

void sub_1D178672C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::implElementsForAttributeValues<char const*>(sqlite3_int64 a1, void *a2, int a3, int a4, degas::Bitmap *a5, uint64_t a6)
{
  degas::AggregateValueCursor::AggregateValueCursor(v15);
  degas::AggregateValueCursor::setForValues((uint64_t *)v15, a1, a2, a3, a4, a6);
  while (1)
  {
    unsigned int v12 = degas::Statement::next((sqlite3_stmt **)v15[0]);
    if (v12 != 1) {
      break;
    }
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v15[0], 0, a5);
  }
  if (v12 == 2) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v12;
  }
  degas::Cursor::~Cursor(v15);
  return v13;
}

void sub_1D178680C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::AttributeQuery::elementsForAttributeValues(uint64_t *a1, sqlite3_int64 a2, uint64_t *a3, int a4, int a5, degas::Bitmap *a6)
{
  uint64_t v12 = a4;
  std::vector<char const*>::vector(__p, a4);
  if (a4)
  {
    uint64_t v13 = 0;
    do
    {
      uint64_t v14 = a3;
      if (*((char *)a3 + 23) < 0) {
        uint64_t v14 = (uint64_t *)*a3;
      }
      *((void *)__p[0] + v13++) = v14;
      a3 += 3;
    }
    while (v12 != v13);
  }
  uint64_t v15 = degas::implElementsForAttributeValues<char const*>(a2, __p[0], a4, a5, a6, *a1);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v15;
}

void sub_1D17868EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<char const*>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    if (a2 >> 61) {
      std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v4 = 8 * a2;
    unsigned int v5 = (char *)operator new(8 * a2);
    *a1 = v5;
    a1[2] = &v5[8 * a2];
    bzero(v5, 8 * a2);
    a1[1] = &v5[v4];
  }
  return a1;
}

void sub_1D1786980(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t degas::AttributeQuery::elementsForAttributeValueRange(uint64_t *a1, sqlite3_int64 a2, sqlite3_int64 a3, sqlite3_int64 a4, int a5, degas::Bitmap *a6)
{
  uint64_t v11 = *a1;
  degas::AggregateValueCursor::AggregateValueCursor(v15);
  degas::AggregateValueCursor::setForRange((uint64_t *)v15, a2, a3, a4, a5, v11);
  while (1)
  {
    unsigned int v12 = degas::Statement::next((sqlite3_stmt **)v15[0]);
    if (v12 != 1) {
      break;
    }
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v15[0], 0, a6);
  }
  if (v12 == 2) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v12;
  }
  degas::Cursor::~Cursor(v15);
  return v13;
}

void sub_1D1786A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::AttributeQuery::elementsForAttributeValueRange(uint64_t *a1, sqlite3_int64 a2, int a3, degas::Bitmap *a4, double a5, double a6)
{
  uint64_t v11 = *a1;
  degas::AggregateValueCursor::AggregateValueCursor(v15);
  degas::AggregateValueCursor::setForRange((uint64_t *)v15, a2, a3, v11, a5, a6);
  while (1)
  {
    unsigned int v12 = degas::Statement::next((sqlite3_stmt **)v15[0]);
    if (v12 != 1) {
      break;
    }
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v15[0], 0, a4);
  }
  if (v12 == 2) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v12;
  }
  degas::Cursor::~Cursor(v15);
  return v13;
}

void sub_1D1786B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::AttributeQuery::elementsForAttributeValueRange(uint64_t *a1, sqlite3_int64 a2, uint64_t a3, uint64_t a4, int a5, degas::Bitmap *a6)
{
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v15, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string v15 = *(std::string *)a3;
  }
  if (*(char *)(a4 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a4, *(void *)(a4 + 8));
  }
  else {
    std::string __p = *(std::string *)a4;
  }
  uint64_t v11 = *a1;
  degas::AggregateValueCursor::AggregateValueCursor(v16);
  degas::AggregateValueCursor::setForRange((uint64_t *)v16, a2, (uint64_t *)&v15, (uint64_t *)&__p, a5, v11);
  while (1)
  {
    unsigned int v12 = degas::Statement::next((sqlite3_stmt **)v16[0]);
    if (v12 != 1) {
      break;
    }
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v16[0], 0, a6);
  }
  degas::Cursor::~Cursor(v16);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  if (v12 == 2) {
    return 0;
  }
  else {
    return v12;
  }
}

void sub_1D1786C34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char a23)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t degas::filterElementsForAggregateCursor(sqlite3_stmt ***this, degas::AggregateValueCursor *a2, degas::Bitmap *a3, const degas::Bitmap *a4)
{
  long long v10 = 0u;
  memset(v11, 0, 25);
  while (1)
  {
    uint64_t v7 = degas::Statement::next(*this);
    uint64_t v8 = v7;
    if (v7 != 1) {
      break;
    }
    degas::Statement::bitmapColumnValue(*this, 0, (degas::Bitmap *)&v10);
  }
  if (v7 == 2)
  {
    if (*((void *)a3 + 2) != *((void *)a3 + 3)) {
      degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)&v10, a3);
    }
    degas::Bitmap::operator=(a2, &v10);
    uint64_t v8 = 0;
  }
  unsigned int v12 = (void **)v11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v12);
  return v8;
}

void sub_1D1786D28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  *(void *)(v11 - 40) = &a11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v11 - 40));
  _Unwind_Resume(a1);
}

BOOL degas::chooseFiltering(degas *this, const degas::Bitmap *a2)
{
  return (double)(unint64_t)degas::Bitmap::count(this) / (double)(unint64_t)a2 < 0.1;
}

uint64_t degas::AttributeQuery::filterElementsForAttributeValue(uint64_t *a1, sqlite3_int64 a2, sqlite3_int64 a3, int a4, Bitmap *a5, degas::AggregateValueCursor *a6)
{
  uint64_t v11 = *a1;
  unint64_t v12 = a1[1];
  degas::AggregateValueCursor::AggregateValueCursor(v17);
  if ((double)(unint64_t)degas::Bitmap::count((degas::Bitmap *)a5) / (double)v12 >= 0.1)
  {
    degas::AggregateValueCursor::setForValue((uint64_t *)v17, a2, a3, a4, v11);
  }
  else
  {
    degas::AggregateValueCursor::setToFilterForValue((uint64_t *)v17, a2, a3, a4, a5, v11);
    degas::Bitmap::emptyBitmap(v13);
    a5 = (Bitmap *)&degas::Bitmap::emptyBitmap(void)::bitmap;
  }
  uint64_t v15 = degas::filterElementsForAggregateCursor(v17, a6, (degas::Bitmap *)a5, v14);
  degas::Cursor::~Cursor((degas::Statement **)v17);
  return v15;
}

void sub_1D1786E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::AttributeQuery::filterElementsForAttributeValue(uint64_t *a1, sqlite3_int64 a2, int a3, Bitmap *a4, degas::AggregateValueCursor *a5, double a6)
{
  uint64_t v11 = *a1;
  unint64_t v12 = a1[1];
  degas::AggregateValueCursor::AggregateValueCursor(v17);
  if ((double)(unint64_t)degas::Bitmap::count((degas::Bitmap *)a4) / (double)v12 >= 0.1)
  {
    degas::AggregateValueCursor::setForValue((uint64_t *)v17, a2, a3, v11, a6);
  }
  else
  {
    degas::AggregateValueCursor::setToFilterForValue((uint64_t *)v17, a2, a3, a4, v11, a6);
    degas::Bitmap::emptyBitmap(v13);
    a4 = (Bitmap *)&degas::Bitmap::emptyBitmap(void)::bitmap;
  }
  uint64_t v15 = degas::filterElementsForAggregateCursor(v17, a5, (degas::Bitmap *)a4, v14);
  degas::Cursor::~Cursor((degas::Statement **)v17);
  return v15;
}

void sub_1D1786F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::AttributeQuery::filterElementsForAttributeValue(uint64_t *a1, sqlite3_int64 a2, uint64_t a3, int a4, Bitmap *a5, degas::AggregateValueCursor *a6)
{
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string __p = *(std::string *)a3;
  }
  uint64_t v11 = *a1;
  unint64_t v12 = a1[1];
  degas::AggregateValueCursor::AggregateValueCursor(v18);
  if ((double)(unint64_t)degas::Bitmap::count((degas::Bitmap *)a5) / (double)v12 >= 0.1)
  {
    degas::AggregateValueCursor::setForValue((uint64_t *)v18, a2, (uint64_t *)&__p, a4, v11);
  }
  else
  {
    degas::AggregateValueCursor::setToFilterForValue((uint64_t *)v18, a2, (uint64_t *)&__p, a4, a5, v11);
    degas::Bitmap::emptyBitmap(v13);
    a5 = (Bitmap *)&degas::Bitmap::emptyBitmap(void)::bitmap;
  }
  uint64_t v15 = degas::filterElementsForAggregateCursor(v18, a6, (degas::Bitmap *)a5, v14);
  degas::Cursor::~Cursor((degas::Statement **)v18);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v15;
}

void sub_1D17870A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, degas::Statement *a16)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t degas::AttributeQuery::filterElementsForAttributeValues(uint64_t *a1, sqlite3_int64 a2, void *a3, int a4, int a5, Bitmap *a6, degas::AggregateValueCursor *a7)
{
  uint64_t v13 = *a1;
  unint64_t v14 = a1[1];
  degas::AggregateValueCursor::AggregateValueCursor(v19);
  if ((double)(unint64_t)degas::Bitmap::count((degas::Bitmap *)a6) / (double)v14 >= 0.1)
  {
    degas::AggregateValueCursor::setForValues((uint64_t *)v19, a2, a3, a4, a5, v13);
  }
  else
  {
    degas::AggregateValueCursor::setToFilterForValues((uint64_t *)v19, a2, a3, a4, a5, a6, v13);
    degas::Bitmap::emptyBitmap(v15);
    a6 = (Bitmap *)&degas::Bitmap::emptyBitmap(void)::bitmap;
  }
  uint64_t v17 = degas::filterElementsForAggregateCursor(v19, a7, (degas::Bitmap *)a6, v16);
  degas::Cursor::~Cursor((degas::Statement **)v19);
  return v17;
}

{
  uint64_t v13;
  unint64_t v14;
  degas::Bitmap *v15;
  const degas::Bitmap *v16;
  uint64_t v17;
  sqlite3_stmt **v19[2];

  uint64_t v13 = *a1;
  unint64_t v14 = a1[1];
  degas::AggregateValueCursor::AggregateValueCursor(v19);
  if ((double)(unint64_t)degas::Bitmap::count((degas::Bitmap *)a6) / (double)v14 >= 0.1)
  {
    degas::AggregateValueCursor::setForValues((uint64_t *)v19, a2, a3, a4, a5, v13);
  }
  else
  {
    degas::AggregateValueCursor::setToFilterForValues((uint64_t *)v19, a2, a3, a4, a5, a6, v13);
    degas::Bitmap::emptyBitmap(v15);
    a6 = (Bitmap *)&degas::Bitmap::emptyBitmap(void)::bitmap;
  }
  uint64_t v17 = degas::filterElementsForAggregateCursor(v19, a7, (degas::Bitmap *)a6, v16);
  degas::Cursor::~Cursor((degas::Statement **)v19);
  return v17;
}

void sub_1D17871C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

void sub_1D17872D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::AttributeQuery::filterElementsForAttributeValues(uint64_t a1, sqlite3_int64 a2, void *a3, int a4, int a5, Bitmap *a6, degas::AggregateValueCursor *a7)
{
  return degas::implFilterElementsForAttributeValues<char const*>(a2, a3, a4, a5, a6, a7, *(void *)a1, *(void *)(a1 + 8));
}

uint64_t degas::implFilterElementsForAttributeValues<char const*>(sqlite3_int64 a1, void *a2, int a3, int a4, Bitmap *a5, degas::AggregateValueCursor *a6, uint64_t a7, unint64_t a8)
{
  degas::AggregateValueCursor::AggregateValueCursor(v20);
  if ((double)(unint64_t)degas::Bitmap::count((degas::Bitmap *)a5) / (double)a8 >= 0.1)
  {
    degas::AggregateValueCursor::setForValues((uint64_t *)v20, a1, a2, a3, a4, a7);
  }
  else
  {
    degas::AggregateValueCursor::setToFilterForValues((uint64_t *)v20, a1, a2, a3, a4, a5, a7);
    degas::Bitmap::emptyBitmap(v16);
    a5 = (Bitmap *)&degas::Bitmap::emptyBitmap(void)::bitmap;
  }
  uint64_t v18 = degas::filterElementsForAggregateCursor(v20, a6, (degas::Bitmap *)a5, v17);
  degas::Cursor::~Cursor((degas::Statement **)v20);
  return v18;
}

void sub_1D1787400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::AttributeQuery::filterElementsForAttributeValues(uint64_t a1, sqlite3_int64 a2, uint64_t *a3, int a4, int a5, Bitmap *a6, degas::AggregateValueCursor *a7)
{
  uint64_t v14 = a4;
  std::vector<char const*>::vector(__p, a4);
  if (a4)
  {
    uint64_t v15 = 0;
    do
    {
      uint64_t v16 = a3;
      if (*((char *)a3 + 23) < 0) {
        uint64_t v16 = (uint64_t *)*a3;
      }
      *((void *)__p[0] + v15++) = v16;
      a3 += 3;
    }
    while (v14 != v15);
  }
  uint64_t v17 = degas::implFilterElementsForAttributeValues<char const*>(a2, __p[0], a4, a5, a6, a7, *(void *)a1, *(void *)(a1 + 8));
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v17;
}

void sub_1D17874E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t degas::AttributeQuery::filterElementsForAttributeValueRange(uint64_t *a1, sqlite3_int64 a2, sqlite3_int64 a3, sqlite3_int64 a4, int a5, Bitmap *a6, degas::AggregateValueCursor *a7)
{
  uint64_t v13 = *a1;
  unint64_t v14 = a1[1];
  degas::AggregateValueCursor::AggregateValueCursor(v19);
  if ((double)(unint64_t)degas::Bitmap::count((degas::Bitmap *)a6) / (double)v14 >= 0.1)
  {
    degas::AggregateValueCursor::setForRange((uint64_t *)v19, a2, a3, a4, a5, v13);
  }
  else
  {
    degas::AggregateValueCursor::setToFilterForRange((uint64_t *)v19, a2, a3, a4, a5, a6, v13);
    degas::Bitmap::emptyBitmap(v15);
    a6 = (Bitmap *)&degas::Bitmap::emptyBitmap(void)::bitmap;
  }
  uint64_t v17 = degas::filterElementsForAggregateCursor(v19, a7, (degas::Bitmap *)a6, v16);
  degas::Cursor::~Cursor((degas::Statement **)v19);
  return v17;
}

void sub_1D17875FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::AttributeQuery::filterElementsForAttributeValueRange(uint64_t *a1, sqlite3_int64 a2, int a3, Bitmap *a4, degas::AggregateValueCursor *a5, double a6, double a7)
{
  uint64_t v13 = *a1;
  unint64_t v14 = a1[1];
  degas::AggregateValueCursor::AggregateValueCursor(v19);
  if ((double)(unint64_t)degas::Bitmap::count((degas::Bitmap *)a4) / (double)v14 >= 0.1)
  {
    degas::AggregateValueCursor::setForRange((uint64_t *)v19, a2, a3, v13, a6, a7);
  }
  else
  {
    degas::AggregateValueCursor::setToFilterForRange((uint64_t *)v19, a2, a3, a4, v13, a6, a7);
    degas::Bitmap::emptyBitmap(v15);
    a4 = (Bitmap *)&degas::Bitmap::emptyBitmap(void)::bitmap;
  }
  uint64_t v17 = degas::filterElementsForAggregateCursor(v19, a5, (degas::Bitmap *)a4, v16);
  degas::Cursor::~Cursor((degas::Statement **)v19);
  return v17;
}

void sub_1D178770C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::AttributeQuery::filterElementsForAttributeValueRange(uint64_t *a1, sqlite3_int64 a2, uint64_t a3, uint64_t a4, int a5, Bitmap *a6, degas::AggregateValueCursor *a7)
{
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v20, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string v20 = *(std::string *)a3;
  }
  if (*(char *)(a4 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a4, *(void *)(a4 + 8));
  }
  else {
    std::string __p = *(std::string *)a4;
  }
  uint64_t v13 = *a1;
  unint64_t v14 = a1[1];
  degas::AggregateValueCursor::AggregateValueCursor(v21);
  if ((double)(unint64_t)degas::Bitmap::count((degas::Bitmap *)a6) / (double)v14 >= 0.1)
  {
    degas::AggregateValueCursor::setForRange((uint64_t *)v21, a2, (uint64_t *)&v20, (uint64_t *)&__p, a5, v13);
  }
  else
  {
    degas::AggregateValueCursor::setToFilterForRange((uint64_t *)v21, a2, (uint64_t *)&v20, (uint64_t *)&__p, a5, a6, v13);
    degas::Bitmap::emptyBitmap(v15);
    a6 = (Bitmap *)&degas::Bitmap::emptyBitmap(void)::bitmap;
  }
  uint64_t v17 = degas::filterElementsForAggregateCursor(v21, a7, (degas::Bitmap *)a6, v16);
  degas::Cursor::~Cursor((degas::Statement **)v21);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v20.__r_.__value_.__l.__data_);
  }
  return v17;
}

void sub_1D1787884(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char a23)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

double degas::UncountedPathCollection::UncountedPathCollection(degas::UncountedPathCollection *this)
{
  *((void *)this + 2) = 0;
  *((void *)this + 1) = 0;
  *(void *)this = (char *)this + 8;
  double result = 0.0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 49) = 0u;
  return result;
}

{
  double result;

  *((void *)this + 2) = 0;
  *((void *)this + 1) = 0;
  *(void *)this = (char *)this + 8;
  double result = 0.0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 49) = 0u;
  return result;
}

degas::UncountedPathCollection *degas::UncountedPathCollection::UncountedPathCollection(degas::UncountedPathCollection *this, long long **a2)
{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = (char *)this + 8;
  *((void *)this + 3) = *a2;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 40, a2[2], a2[3], a2[3] - a2[2]);
  *((unsigned char *)this + 64) = *((unsigned char *)a2 + 40);
  return this;
}

void sub_1D1787978(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>>>::destroy(*v1);
  _Unwind_Resume(a1);
}

uint64_t degas::UncountedPathCollection::addPath(degas::UncountedPathCollection *this, unint64_t a2, unint64_t a3)
{
  unsigned int v5 = (void *)*((void *)this + 1);
  if (!v5) {
    goto LABEL_12;
  }
  long long v6 = (char *)this + 8;
  do
  {
    unint64_t v7 = v5[4];
    BOOL v8 = v7 >= a3;
    if (v7 >= a3) {
      uint64_t v9 = v5;
    }
    else {
      uint64_t v9 = v5 + 1;
    }
    if (v8) {
      long long v6 = (char *)v5;
    }
    unsigned int v5 = (void *)*v9;
  }
  while (*v9);
  if (v6 == (char *)this + 8 || *((void *)v6 + 4) > a3) {
LABEL_12:
  }
    operator new();
  degas::Bitmap::setBit(*((degas::Bitmap **)v6 + 5), a2);
  return degas::Bitmap::setBit((degas::UncountedPathCollection *)((char *)this + 24), a3);
}

void sub_1D1787AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,std::shared_ptr<degas::Bitmap>>>(uint64_t *result, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = result;
  long long v6 = (uint64_t **)(result + 1);
  unsigned int v5 = (uint64_t *)result[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        unint64_t v7 = (uint64_t **)v5;
        unint64_t v8 = v5[4];
        if (v8 <= a2) {
          break;
        }
        unsigned int v5 = *v7;
        long long v6 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if (v8 >= a2) {
        break;
      }
      unsigned int v5 = v7[1];
      if (!v5)
      {
        long long v6 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    unint64_t v7 = (uint64_t **)(result + 1);
LABEL_9:
    uint64_t v9 = (char *)operator new(0x38uLL);
    *((void *)v9 + 4) = *(void *)a3;
    *(_OWORD *)(v9 + 40) = *(_OWORD *)(a3 + 8);
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)uint64_t v9 = 0;
    *((void *)v9 + 1) = 0;
    *((void *)v9 + 2) = v7;
    char *v6 = (uint64_t *)v9;
    uint64_t v10 = *(void *)*v4;
    if (v10)
    {
      *uint64_t v4 = v10;
      uint64_t v11 = *v6;
    }
    else
    {
      uint64_t v11 = (uint64_t *)v9;
    }
    double result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v4[1], v11);
    ++v4[2];
  }
  return result;
}

uint64_t *std::unique_ptr<degas::Bitmap>::reset[abi:ne180100](uint64_t *result)
{
  uint64_t v1 = *result;
  void *result = 0;
  if (v1)
  {
    uint64_t v2 = (void **)(v1 + 16);
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
    JUMPOUT(0x1D25F9A90);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<degas::Bitmap *,std::shared_ptr<degas::Bitmap>::__shared_ptr_default_delete<degas::Bitmap,degas::Bitmap>,std::allocator<degas::Bitmap>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), 0x80000001D17CE4DELL)) {
    return a1 + 24;
  }
  else {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<degas::Bitmap *,std::shared_ptr<degas::Bitmap>::__shared_ptr_default_delete<degas::Bitmap,degas::Bitmap>,std::allocator<degas::Bitmap>>::__on_zero_shared(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 24);
  if (v1)
  {
    uint64_t v2 = (void **)(v1 + 16);
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
    JUMPOUT(0x1D25F9A90);
  }
  return result;
}

void std::__shared_ptr_pointer<degas::Bitmap *,std::shared_ptr<degas::Bitmap>::__shared_ptr_default_delete<degas::Bitmap,degas::Bitmap>,std::allocator<degas::Bitmap>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D25F9A90);
}

uint64_t degas::UncountedPathCollection::addPaths(uint64_t *a1, unint64_t a2, uint64_t *a3)
{
  unsigned int v5 = (void *)a1[1];
  if (!v5) {
    goto LABEL_12;
  }
  long long v6 = a1 + 1;
  do
  {
    unint64_t v7 = v5[4];
    BOOL v8 = v7 >= a2;
    if (v7 >= a2) {
      uint64_t v9 = v5;
    }
    else {
      uint64_t v9 = v5 + 1;
    }
    if (v8) {
      long long v6 = v5;
    }
    unsigned int v5 = (void *)*v9;
  }
  while (*v9);
  if (v6 != a1 + 1 && v6[4] <= a2)
  {
    degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)v6[5], *a3);
  }
  else
  {
LABEL_12:
    uint64_t v11 = *a3;
    uint64_t v10 = (std::__shared_weak_count *)a3[1];
    v13[0] = a2;
    v13[1] = v11;
    unint64_t v14 = v10;
    if (v10) {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    std::__tree<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,std::shared_ptr<degas::Bitmap>>>(a1, a2, (uint64_t)v13);
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
  }
  return degas::Bitmap::setBit((degas::Bitmap *)(a1 + 3), a2);
}

void sub_1D1787E24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

void degas::UncountedPathCollection::clear(degas::UncountedPathCollection *this)
{
  uint64_t v2 = (_OWORD *)((char *)this + 8);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>>>::destroy(*((void **)this + 1));
  *(void *)this = v2;
  *uint64_t v2 = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  uint64_t v3 = *((void *)this + 5);
  for (uint64_t i = *((void *)this + 6); i != v3; i -= 16)
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(i - 16));
    *(void *)(i - 8) = 0;
  }
  *((void *)this + 6) = v3;
}

unint64_t degas::UncountedPathCollection::addToCollectionWithFilter(degas::UncountedPathCollection *this, degas::UncountedPathCollection *a2, const degas::Bitmap *a3)
{
  unint64_t result = degas::Bitmap::count(a3);
  if (result < *((void *)this + 2))
  {
    unint64_t result = (unint64_t)degas::Bitmap::begin(a3, &v21);
    unint64_t v7 = (void *)((char *)this + 8);
    while (1)
    {
      unint64_t v8 = v22;
      BOOL v9 = (const degas::Bitmap *)v21 == a3 && v22 == -1;
      if (v9)
      {
        if (v23 == *((void *)a3 + 3)) {
          return result;
        }
        unint64_t v8 = -1;
      }
      uint64_t v10 = (void *)*v7;
      if (*v7)
      {
        uint64_t v11 = v7;
        do
        {
          unint64_t v12 = v10[4];
          BOOL v13 = v12 >= v8;
          if (v12 >= v8) {
            unint64_t v14 = v10;
          }
          else {
            unint64_t v14 = v10 + 1;
          }
          if (v13) {
            uint64_t v11 = v10;
          }
          uint64_t v10 = (void *)*v14;
        }
        while (*v14);
        if (v11 != v7 && v8 >= v11[4]) {
          degas::UncountedPathCollection::addPaths((uint64_t *)a2, v8, v11 + 5);
        }
      }
      unint64_t result = (unint64_t)degas::Bitmap::iterator::operator++(&v21);
    }
  }
  uint64_t v17 = *(char **)this;
  uint64_t v15 = (char *)this + 8;
  uint64_t v16 = v17;
  if (v17 != v15)
  {
    do
    {
      unint64_t v18 = *((void *)v16 + 4);
      unint64_t result = degas::Bitmap::isSet(a3, v18);
      if (result) {
        unint64_t result = degas::UncountedPathCollection::addPaths((uint64_t *)a2, v18, (uint64_t *)v16 + 5);
      }
      int v19 = (char *)*((void *)v16 + 1);
      if (v19)
      {
        do
        {
          std::string v20 = v19;
          int v19 = *(char **)v19;
        }
        while (v19);
      }
      else
      {
        do
        {
          std::string v20 = (char *)*((void *)v16 + 2);
          BOOL v9 = *(void *)v20 == (void)v16;
          uint64_t v16 = v20;
        }
        while (!v9);
      }
      uint64_t v16 = v20;
    }
    while (v20 != v15);
  }
  return result;
}

uint64_t degas::UncountedPathCollection::targetNodes(degas::UncountedPathCollection *this)
{
  return (uint64_t)this + 24;
}

BOOL degas::UncountedPathCollection::hasPaths(degas::UncountedPathCollection *this)
{
  return *((void *)this + 2) != 0;
}

char *degas::UncountedPathCollection::sourceNodesForTargetNodeId(degas::UncountedPathCollection *this, unint64_t a2)
{
  {
    unint64_t v14 = a2;
    uint64_t v15 = this;
    a2 = v14;
    this = v15;
    if (v13)
    {
      __cxa_atexit((void (*)(void *))std::shared_ptr<degas::Bitmap>::~shared_ptr[abi:ne180100], &degas::UncountedPathCollection::sourceNodesForTargetNodeId(unsigned long long)const::emptyBitmap, &dword_1D1654000);
      a2 = v14;
      this = v15;
    }
  }
  uint64_t v4 = (void *)*((void *)this + 1);
  uint64_t v2 = (char *)this + 8;
  uint64_t v3 = v4;
  if (!v4) {
    return (char *)&degas::UncountedPathCollection::sourceNodesForTargetNodeId(unsigned long long)const::emptyBitmap;
  }
  unsigned int v5 = v2;
  do
  {
    unint64_t v6 = v3[4];
    BOOL v7 = v6 >= a2;
    if (v6 >= a2) {
      unint64_t v8 = v3;
    }
    else {
      unint64_t v8 = v3 + 1;
    }
    if (v7) {
      unsigned int v5 = (char *)v3;
    }
    uint64_t v3 = (void *)*v8;
  }
  while (*v8);
  BOOL v9 = &degas::UncountedPathCollection::sourceNodesForTargetNodeId(unsigned long long)const::emptyBitmap;
  if (v5 != v2)
  {
    unint64_t v10 = *((void *)v5 + 4);
    uint64_t v11 = v5 + 40;
    if (v10 <= a2) {
      return v11;
    }
  }
  return (char *)v9;
}

uint64_t std::shared_ptr<degas::Bitmap>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

double degas::CountedPathCollection::CountedPathCollection(degas::CountedPathCollection *this)
{
  *((void *)this + 2) = 0;
  *((void *)this + 1) = 0;
  *(void *)this = (char *)this + 8;
  double result = 0.0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 49) = 0u;
  return result;
}

{
  double result;

  *((void *)this + 2) = 0;
  *((void *)this + 1) = 0;
  *(void *)this = (char *)this + 8;
  double result = 0.0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 49) = 0u;
  return result;
}

degas::CountedPathCollection *degas::CountedPathCollection::CountedPathCollection(degas::CountedPathCollection *this, long long **a2)
{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = (char *)this + 8;
  *((void *)this + 3) = *a2;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 40, a2[2], a2[3], a2[3] - a2[2]);
  *((unsigned char *)this + 64) = *((unsigned char *)a2 + 40);
  return this;
}

void sub_1D17881CC(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<unsigned long long,std::map<unsigned long long,int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::map<unsigned long long,int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::map<unsigned long long,int>>>>::destroy(*v1);
  _Unwind_Resume(a1);
}

void degas::CountedPathCollection::addPath(degas::CountedPathCollection *this, unint64_t a2, unint64_t a3, int a4)
{
  unint64_t v6 = (void *)*((void *)this + 1);
  if (!v6) {
    goto LABEL_12;
  }
  BOOL v7 = (void *)((char *)this + 8);
  do
  {
    unint64_t v8 = v6[4];
    BOOL v9 = v8 >= a3;
    if (v8 >= a3) {
      unint64_t v10 = v6;
    }
    else {
      unint64_t v10 = v6 + 1;
    }
    if (v9) {
      BOOL v7 = v6;
    }
    unint64_t v6 = (void *)*v10;
  }
  while (*v10);
  if (v7 != (void *)((char *)this + 8) && v7[4] <= a3)
  {
    int v13 = (void *)v7[6];
    uint64_t v11 = v7 + 6;
    unint64_t v12 = v13;
    if (!v13) {
      goto LABEL_25;
    }
    unint64_t v14 = v11;
    do
    {
      unint64_t v15 = v12[4];
      BOOL v16 = v15 >= a2;
      if (v15 >= a2) {
        uint64_t v17 = v12;
      }
      else {
        uint64_t v17 = v12 + 1;
      }
      if (v16) {
        unint64_t v14 = v12;
      }
      unint64_t v12 = (void *)*v17;
    }
    while (*v17);
    if (v14 != v11 && v14[4] <= a2)
    {
      *((_DWORD *)v14 + 10) += a4;
    }
    else
    {
LABEL_25:
      std::__tree<std::__value_type<unsigned long long,int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,int>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,int>>(v11 - 1, a2, a2, a4);
    }
  }
  else
  {
LABEL_12:
    v21[0] = 0;
    v21[1] = 0;
    std::string v20 = v21;
    std::__tree<std::__value_type<unsigned long long,int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,int>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,int>>((uint64_t *)&v20, a2, a2, a4);
    unint64_t v18 = a3;
    std::map<unsigned long long,int>::map[abi:ne180100]((uint64_t)v19, &v20);
    std::__tree<std::__value_type<unsigned long long,std::map<unsigned long long,int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::map<unsigned long long,int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::map<unsigned long long,int>>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,std::map<unsigned long long,int>>>((uint64_t *)this, a3, (uint64_t *)&v18);
    std::__tree<unsigned long long>::destroy(v19[1]);
    degas::Bitmap::setBit((degas::CountedPathCollection *)((char *)this + 24), a3);
    std::__tree<unsigned long long>::destroy(v21[0]);
  }
}

void sub_1D1788320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
}

uint64_t *std::__tree<std::__value_type<unsigned long long,int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,int>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,int>>(uint64_t *result, unint64_t a2, uint64_t a3, int a4)
{
  unint64_t v6 = (uint64_t **)result;
  unint64_t v8 = (uint64_t **)(result + 1);
  BOOL v7 = (uint64_t *)result[1];
  if (v7)
  {
    while (1)
    {
      while (1)
      {
        BOOL v9 = (uint64_t **)v7;
        unint64_t v10 = v7[4];
        if (v10 <= a2) {
          break;
        }
        BOOL v7 = *v9;
        unint64_t v8 = v9;
        if (!*v9) {
          goto LABEL_9;
        }
      }
      if (v10 >= a2) {
        break;
      }
      BOOL v7 = v9[1];
      if (!v7)
      {
        unint64_t v8 = v9 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    BOOL v9 = (uint64_t **)(result + 1);
LABEL_9:
    uint64_t v11 = operator new(0x30uLL);
    v11[4] = a3;
    *((_DWORD *)v11 + 10) = a4;
    return std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::__insert_node_at(v6, (uint64_t)v9, v8, v11);
  }
  return result;
}

uint64_t std::map<unsigned long long,int>::map[abi:ne180100](uint64_t a1, void *a2)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v3 = (void *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  uint64_t v4 = a2 + 1;
  unsigned int v5 = (void *)*a2;
  if ((void *)*a2 != a2 + 1)
  {
    do
    {
      unint64_t v6 = v5 + 4;
      BOOL v7 = *(uint64_t **)(a1 + 8);
      unint64_t v8 = v3;
      if (*(void **)a1 == v3) {
        goto LABEL_8;
      }
      BOOL v9 = *(void **)(a1 + 8);
      unint64_t v10 = v3;
      if (v7)
      {
        do
        {
          unint64_t v8 = v9;
          BOOL v9 = (void *)v9[1];
        }
        while (v9);
      }
      else
      {
        do
        {
          unint64_t v8 = (void *)v10[2];
          BOOL v11 = *v8 == (void)v10;
          unint64_t v10 = v8;
        }
        while (v11);
      }
      unint64_t v12 = *v6;
      if (v8[4] < *v6)
      {
LABEL_8:
        if (v7) {
          int v13 = (uint64_t **)v8;
        }
        else {
          int v13 = (uint64_t **)v3;
        }
        if (v7) {
          unint64_t v14 = (uint64_t **)(v8 + 1);
        }
        else {
          unint64_t v14 = (uint64_t **)v3;
        }
      }
      else
      {
        int v13 = (uint64_t **)v3;
        unint64_t v14 = (uint64_t **)v3;
        if (v7)
        {
          unint64_t v14 = (uint64_t **)v3;
          while (1)
          {
            while (1)
            {
              int v13 = (uint64_t **)v7;
              unint64_t v18 = v7[4];
              if (v12 >= v18) {
                break;
              }
              BOOL v7 = *v13;
              unint64_t v14 = v13;
              if (!*v13) {
                goto LABEL_15;
              }
            }
            if (v18 >= v12) {
              break;
            }
            unint64_t v14 = v13 + 1;
            BOOL v7 = v13[1];
            if (!v7) {
              goto LABEL_15;
            }
          }
        }
      }
      if (!*v14)
      {
LABEL_15:
        unint64_t v15 = (uint64_t *)operator new(0x30uLL);
        *((_OWORD *)v15 + 2) = *(_OWORD *)v6;
        std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::__insert_node_at((uint64_t **)a1, (uint64_t)v13, v14, v15);
      }
      BOOL v16 = (void *)v5[1];
      if (v16)
      {
        do
        {
          uint64_t v17 = v16;
          BOOL v16 = (void *)*v16;
        }
        while (v16);
      }
      else
      {
        do
        {
          uint64_t v17 = (void *)v5[2];
          BOOL v11 = *v17 == (void)v5;
          unsigned int v5 = v17;
        }
        while (!v11);
      }
      unsigned int v5 = v17;
    }
    while (v17 != v4);
  }
  return a1;
}

void sub_1D178857C(_Unwind_Exception *a1)
{
  std::__tree<unsigned long long>::destroy(*v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<unsigned long long,std::map<unsigned long long,int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::map<unsigned long long,int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::map<unsigned long long,int>>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,std::map<unsigned long long,int>>>(uint64_t *result, unint64_t a2, uint64_t *a3)
{
  uint64_t v4 = result;
  unint64_t v6 = (uint64_t **)(result + 1);
  unsigned int v5 = (uint64_t *)result[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        BOOL v7 = (uint64_t **)v5;
        unint64_t v8 = v5[4];
        if (v8 <= a2) {
          break;
        }
        unsigned int v5 = *v7;
        unint64_t v6 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if (v8 >= a2) {
        break;
      }
      unsigned int v5 = v7[1];
      if (!v5)
      {
        unint64_t v6 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    BOOL v7 = (uint64_t **)(result + 1);
LABEL_9:
    BOOL v9 = (uint64_t *)operator new(0x40uLL);
    unint64_t v10 = v9;
    uint64_t v11 = a3[1];
    unint64_t v12 = a3 + 2;
    uint64_t v13 = a3[2];
    v9[4] = *a3;
    v9[5] = v11;
    v9[6] = v13;
    unint64_t v14 = v9 + 6;
    uint64_t v15 = a3[3];
    v9[7] = v15;
    if (v15)
    {
      *(void *)(v13 + 16) = v14;
      a3[1] = (uint64_t)v12;
      *unint64_t v12 = 0;
      a3[3] = 0;
    }
    else
    {
      v9[5] = (uint64_t)v14;
    }
    *BOOL v9 = 0;
    v9[1] = 0;
    v9[2] = (uint64_t)v7;
    unint64_t *v6 = v9;
    uint64_t v16 = *(void *)*v4;
    if (v16)
    {
      *uint64_t v4 = v16;
      unint64_t v10 = *v6;
    }
    double result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v4[1], v10);
    ++v4[2];
  }
  return result;
}

uint64_t degas::CountedPathCollection::addPaths(uint64_t *a1, unint64_t a2, void *a3)
{
  unsigned int v5 = (void *)a1[1];
  if (!v5) {
    goto LABEL_12;
  }
  unint64_t v6 = a1 + 1;
  do
  {
    unint64_t v7 = v5[4];
    BOOL v8 = v7 >= a2;
    if (v7 >= a2) {
      BOOL v9 = v5;
    }
    else {
      BOOL v9 = v5 + 1;
    }
    if (v8) {
      unint64_t v6 = v5;
    }
    unsigned int v5 = (void *)*v9;
  }
  while (*v9);
  if (v6 != a1 + 1 && v6[4] <= a2)
  {
    uint64_t v11 = a3 + 1;
    unint64_t v12 = (void *)*a3;
    if ((void *)*a3 != a3 + 1)
    {
      uint64_t v13 = v6 + 5;
      unint64_t v14 = v6 + 6;
      do
      {
        unint64_t v15 = v12[4];
        int v16 = *((_DWORD *)v12 + 10);
        uint64_t v17 = (void *)*v14;
        if (!*v14) {
          goto LABEL_27;
        }
        unint64_t v18 = v14;
        do
        {
          unint64_t v19 = v17[4];
          BOOL v20 = v19 >= v15;
          if (v19 >= v15) {
            unint64_t v21 = v17;
          }
          else {
            unint64_t v21 = v17 + 1;
          }
          if (v20) {
            unint64_t v18 = v17;
          }
          uint64_t v17 = (void *)*v21;
        }
        while (*v21);
        if (v18 != v14 && v15 >= v18[4]) {
          *((_DWORD *)v18 + 10) += v16;
        }
        else {
LABEL_27:
        }
          std::__tree<std::__value_type<unsigned long long,int>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,int>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,int>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,int>>(v13, v15, v12[4], v16);
        unint64_t v22 = (void *)v12[1];
        if (v22)
        {
          do
          {
            uint64_t v23 = v22;
            unint64_t v22 = (void *)*v22;
          }
          while (v22);
        }
        else
        {
          do
          {
            uint64_t v23 = (void *)v12[2];
            BOOL v24 = *v23 == (void)v12;
            unint64_t v12 = v23;
          }
          while (!v24);
        }
        unint64_t v12 = v23;
      }
      while (v23 != v11);
    }
  }
  else
  {
LABEL_12:
    unint64_t v25 = a2;
    std::map<unsigned long long,int>::map[abi:ne180100]((uint64_t)v26, a3);
    std::__tree<std::__value_type<unsigned long long,std::map<unsigned long long,int>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::map<unsigned long long,int>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::map<unsigned long long,int>>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,std::map<unsigned long long,int>>>(a1, v25, (uint64_t *)&v25);
    std::__tree<unsigned long long>::destroy(v26[1]);
  }
  return degas::Bitmap::setBit((degas::Bitmap *)(a1 + 3), a2);
}

void sub_1D17887E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
}

unint64_t degas::CountedPathCollection::addToCollectionWithFilter(degas::CountedPathCollection *this, degas::CountedPathCollection *a2, const degas::Bitmap *a3)
{
  unint64_t result = degas::Bitmap::count(a3);
  if (result < *((void *)this + 2))
  {
    unint64_t result = (unint64_t)degas::Bitmap::begin(a3, &v21);
    unint64_t v7 = (void *)((char *)this + 8);
    while (1)
    {
      unint64_t v8 = v22;
      BOOL v9 = (const degas::Bitmap *)v21 == a3 && v22 == -1;
      if (v9)
      {
        if (v23 == *((void *)a3 + 3)) {
          return result;
        }
        unint64_t v8 = -1;
      }
      unint64_t v10 = (void *)*v7;
      if (*v7)
      {
        uint64_t v11 = v7;
        do
        {
          unint64_t v12 = v10[4];
          BOOL v13 = v12 >= v8;
          if (v12 >= v8) {
            unint64_t v14 = v10;
          }
          else {
            unint64_t v14 = v10 + 1;
          }
          if (v13) {
            uint64_t v11 = v10;
          }
          unint64_t v10 = (void *)*v14;
        }
        while (*v14);
        if (v11 != v7 && v8 >= v11[4]) {
          degas::CountedPathCollection::addPaths((uint64_t *)a2, v8, v11 + 5);
        }
      }
      unint64_t result = (unint64_t)degas::Bitmap::iterator::operator++(&v21);
    }
  }
  uint64_t v17 = *(char **)this;
  unint64_t v15 = (char *)this + 8;
  int v16 = v17;
  if (v17 != v15)
  {
    do
    {
      unint64_t v18 = *((void *)v16 + 4);
      unint64_t result = degas::Bitmap::isSet(a3, v18);
      if (result) {
        unint64_t result = degas::CountedPathCollection::addPaths((uint64_t *)a2, v18, (void *)v16 + 5);
      }
      unint64_t v19 = (char *)*((void *)v16 + 1);
      if (v19)
      {
        do
        {
          BOOL v20 = v19;
          unint64_t v19 = *(char **)v19;
        }
        while (v19);
      }
      else
      {
        do
        {
          BOOL v20 = (char *)*((void *)v16 + 2);
          BOOL v9 = *(void *)v20 == (void)v16;
          int v16 = v20;
        }
        while (!v9);
      }
      int v16 = v20;
    }
    while (v20 != v15);
  }
  return result;
}

BOOL degas::CountedPathCollection::hasPaths(degas::CountedPathCollection *this)
{
  return *((void *)this + 2) != 0;
}

uint64_t degas::CountedPathCollection::targetNodes(degas::CountedPathCollection *this)
{
  return (uint64_t)this + 24;
}

uint64_t *degas::CountedPathCollection::sourcePathsForTargetNodeId(degas::CountedPathCollection *this, unint64_t a2)
{
  {
    unint64_t v14 = a2;
    unint64_t v15 = this;
    a2 = v14;
    this = v15;
    if (v13)
    {
      qword_1EA656978 = 0;
      qword_1EA656970 = 0;
      degas::CountedPathCollection::sourcePathsForTargetNodeId(unsigned long long)const::emptyEntry = (uint64_t)&qword_1EA656970;
      __cxa_atexit((void (*)(void *))std::map<unsigned long long,int>::~map[abi:ne180100], &degas::CountedPathCollection::sourcePathsForTargetNodeId(unsigned long long)const::emptyEntry, &dword_1D1654000);
      a2 = v14;
      this = v15;
    }
  }
  uint64_t v4 = (void *)*((void *)this + 1);
  uint64_t v2 = (char *)this + 8;
  uint64_t v3 = v4;
  if (!v4) {
    return &degas::CountedPathCollection::sourcePathsForTargetNodeId(unsigned long long)const::emptyEntry;
  }
  unsigned int v5 = v2;
  do
  {
    unint64_t v6 = v3[4];
    BOOL v7 = v6 >= a2;
    if (v6 >= a2) {
      unint64_t v8 = v3;
    }
    else {
      unint64_t v8 = v3 + 1;
    }
    if (v7) {
      unsigned int v5 = (char *)v3;
    }
    uint64_t v3 = (void *)*v8;
  }
  while (*v8);
  BOOL v9 = &degas::CountedPathCollection::sourcePathsForTargetNodeId(unsigned long long)const::emptyEntry;
  if (v5 != v2)
  {
    unint64_t v10 = *((void *)v5 + 4);
    uint64_t v11 = v5 + 40;
    if (v10 <= a2) {
      return (uint64_t *)v11;
    }
  }
  return v9;
}

uint64_t std::map<unsigned long long,int>::~map[abi:ne180100](uint64_t a1)
{
  return a1;
}

double degas::Distribution::Distribution(degas::Distribution *this)
{
  double result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  return result;
}

{
  double result;

  double result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  return result;
}

void degas::Distribution::setCountedPathCollection(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v2 = a2[1];
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[1];
  *a1 = v3;
  a1[1] = v2;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

void degas::Distribution::setUncountedPathCollection(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v2 = a2[1];
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 24);
  *(void *)(a1 + 16) = v3;
  *(void *)(a1 + 24) = v2;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

void *degas::Distribution::enumeratePaths(void *result, uint64_t a2)
{
  uint64_t v3 = (void *)result[2];
  if (v3)
  {
    unint64_t v6 = (void *)*v3;
    uint64_t v4 = v3 + 1;
    unsigned int v5 = v6;
    if (v6 != v4)
    {
      do
      {
        for (double result = degas::Bitmap::begin((void *)v5[5], v19); ; double result = degas::Bitmap::iterator::operator++(v19))
        {
          uint64_t v7 = v5[5];
          BOOL v8 = v19[0] == v7 && v19[1] == -1;
          if (v8 && v19[2] == *(void *)(v7 + 24)) {
            break;
          }
          (*(void (**)(uint64_t))(a2 + 16))(a2);
        }
        BOOL v9 = (void *)v5[1];
        if (v9)
        {
          do
          {
            unint64_t v10 = v9;
            BOOL v9 = (void *)*v9;
          }
          while (v9);
        }
        else
        {
          do
          {
            unint64_t v10 = (void *)v5[2];
            BOOL v8 = *v10 == (void)v5;
            unsigned int v5 = v10;
          }
          while (!v8);
        }
        unsigned int v5 = v10;
      }
      while (v10 != v4);
    }
  }
  else
  {
    uint64_t v11 = *result + 8;
    unint64_t v12 = *(void **)*result;
    if (v12 != (void *)v11)
    {
      do
      {
        int v13 = (void *)v12[5];
        if (v13 != v12 + 6)
        {
          uint64_t v14 = v12[4];
          do
          {
            double result = (void *)(*(uint64_t (**)(uint64_t, void, uint64_t, void))(a2 + 16))(a2, v13[4], v14, *((unsigned int *)v13 + 10));
            unint64_t v15 = (void *)v13[1];
            if (v15)
            {
              do
              {
                int v16 = v15;
                unint64_t v15 = (void *)*v15;
              }
              while (v15);
            }
            else
            {
              do
              {
                int v16 = (void *)v13[2];
                BOOL v8 = *v16 == (void)v13;
                int v13 = v16;
              }
              while (!v8);
            }
            int v13 = v16;
          }
          while (v16 != v12 + 6);
        }
        uint64_t v17 = (void *)v12[1];
        if (v17)
        {
          do
          {
            unint64_t v18 = v17;
            uint64_t v17 = (void *)*v17;
          }
          while (v17);
        }
        else
        {
          do
          {
            unint64_t v18 = (void *)v12[2];
            BOOL v8 = *v18 == (void)v12;
            unint64_t v12 = v18;
          }
          while (!v8);
        }
        unint64_t v12 = v18;
      }
      while (v18 != (void *)v11);
    }
  }
  return result;
}

uint64_t kg_errorCodeFromDegasReturnCode(int a1)
{
  if ((a1 - 2) > 8) {
    return -1;
  }
  else {
    return qword_1D17CE530[a1 - 2];
  }
}

void sub_1D1789854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4347(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4348(uint64_t a1)
{
}

void sub_1D178BC70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D178BDA0(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v2 = objc_begin_catch(exception_object);
      objc_exception_rethrow();
    }
    objc_begin_catch(exception_object);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1D178BE80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D178BF00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D178C068(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D178C168(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D178D388(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void degas::Bitmap::symmetricDiffWith<degas::Bitmap>(degas::Bitmap *this, uint64_t a2)
{
  uint64_t v2 = (*(void *)(a2 + 24) - *(void *)(a2 + 16)) >> 4;
  if (v2)
  {
    unsigned int Offset = 0;
    unsigned int v6 = 0;
    do
    {
      uint64_t v7 = *((void *)this + 2);
      unint64_t v8 = (*((void *)this + 3) - v7) >> 4;
      if (v8 <= Offset) {
        break;
      }
      uint64_t v9 = *(void *)(*(void *)(a2 + 16) + 16 * v6);
      unint64_t v10 = *(void *)(*(void *)(v7 + 16 * Offset) + 8);
      unint64_t v11 = *(void *)(v9 + 8);
      if (v10 >= v11)
      {
        if (v10 > v11)
        {
          uint64_t v12 = *(void *)this;
          if (*(void *)this != 0xFFFFFFFFLL)
          {
            unsigned int v13 = *(_DWORD *)(v9 + 4);
            if (v13 == -1)
            {
              uint64_t v14 = 0;
              int32x4_t v15 = 0uLL;
              do
              {
                do
                {
                  int32x4_t v15 = (int32x4_t)vpadalq_u16((uint32x4_t)v15, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v9 + 4 * v14 + 16))));
                  v14 += 4;
                }
                while (v14 != 32);
                uint64_t v14 = 0;
                unsigned int v13 = vaddvq_s32(v15);
                int32x4_t v15 = 0uLL;
              }
              while (v13 == -1);
              *(_DWORD *)(v9 + 4) = v13;
            }
            *(void *)this = v12 + v13;
          }
          degas::Bitmap::insertBitset(this, Offset++, (const degas::Bitset *)v9);
          ++v6;
          *((unsigned char *)this + 40) = 1;
        }
        else
        {
          degas::Bitmap::unshadowedBitSetAtIndex(this, Offset, (degas::BitsetPtr *)v21);
          uint64_t v16 = 0;
          uint64_t v17 = v21[0];
          uint64_t v18 = v21[0] + 16;
          do
          {
            *(_DWORD *)(v18 + v16) ^= *(_DWORD *)(v9 + 16 + v16);
            v16 += 4;
          }
          while (v16 != 128);
          *(_DWORD *)(v17 + 4) = -1;
          ++Offset;
          ++v6;
          *(void *)this = 0xFFFFFFFFLL;
          *((unsigned char *)this + 40) = 1;
          degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)v21);
        }
      }
      else
      {
        unsigned int Offset = degas::Bitmap::findOffset(this, v11, Offset, v8);
      }
    }
    while (v6 < v2);
    int v19 = v2 - v6;
    if (v2 > v6)
    {
      uint64_t v20 = 16 * v6;
      do
      {
        degas::Bitmap::appendBitset(this, *(const degas::Bitset **)(*(void *)(a2 + 16) + v20));
        *((unsigned char *)this + 40) = 1;
        v20 += 16;
        --v19;
      }
      while (v19);
    }
  }
}

void sub_1D178D5CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D178D644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D178D6BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1D178D87C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D178D904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D178D96C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D178DA10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D178DB34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4677(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4678(uint64_t a1)
{
}

void sub_1D178DC74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D178DCFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D178DD84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D178DE0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D178DE84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D178DEF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D178DF84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  *(void *)(v11 - 24) = &a11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v11 - 24));
  _Unwind_Resume(a1);
}

void sub_1D178E084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  a10 = (void **)&a15;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

void sub_1D178E318(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D178E3D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D178E428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL degas::Bitmap::isSubsetOf<degas::Bitmap>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a2) {
    return 1;
  }
  if (((a4 - a3) & 0xFFFFFFFF0) != 0)
  {
    uint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = *(void *)(a3 + 16 * v4);
      unint64_t v6 = *(void *)(*(void *)a1 + 8);
      unint64_t v7 = *(void *)(v5 + 8);
      if (v6 < v7) {
        break;
      }
      if (v6 <= v7)
      {
        BOOL v8 = 0;
        unint64_t v9 = 0;
        uint64_t v10 = v5 + 16;
        do
        {
          int v11 = *(_DWORD *)(*(void *)a1 + 16 + 4 * v9);
          if (v11 && (v11 & ~*(_DWORD *)(v10 + 4 * v9)) != 0) {
            break;
          }
          BOOL v8 = v9++ > 0x1E;
        }
        while (v9 != 32);
        if (!v8) {
          return 0;
        }
        a1 += 16;
      }
      if (a1 != a2 && ++v4 < (unint64_t)((unint64_t)(a4 - a3) >> 4)) {
        continue;
      }
      return a1 == a2;
    }
  }
  return 0;
}

void sub_1D178E530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D178E634(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D178E704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  *(void *)(v13 - 40) = &a12;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v13 - 40));

  _Unwind_Resume(a1);
}

void sub_1D178E7AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D178E8F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D178EA5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1D178EB54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1D178EBF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t degas::LiteralBitmap::sizeForPageCount(degas::LiteralBitmap *this)
{
  return (144 * this) | 8;
}

_DWORD *degas::LiteralBitmap::LiteralBitmap(_DWORD *this, int a2)
{
  *this = 7;
  this[1] = a2;
  return this;
}

{
  *this = 7;
  this[1] = a2;
  return this;
}

unsigned char *degas::LiteralBitmap::stampMetadataWithVersion(unsigned char *this)
{
  *this = 7;
  return this;
}

__n128 degas::LiteralBitmap::makeLiteralBitmap(degas::LiteralBitmap *this, const Bitmap *a2)
{
  uint64_t v3 = (*((void *)this + 3) - *((void *)this + 2)) >> 4;
  uint64_t v4 = operator new((144 * v3) | 8);
  *uint64_t v4 = 7;
  v4[1] = v3;
  unint64_t v6 = (uint64_t *)*((void *)this + 2);
  unint64_t v7 = (uint64_t *)*((void *)this + 3);
  if (v6 != v7)
  {
    int v8 = 0;
    do
    {
      uint64_t v9 = *v6;
      v6 += 2;
      uint64_t v10 = &v4[36 * v8];
      long long v11 = *(_OWORD *)(v9 + 96);
      *(_OWORD *)(v10 + 22) = *(_OWORD *)(v9 + 80);
      *(_OWORD *)(v10 + 26) = v11;
      long long v12 = *(_OWORD *)(v9 + 128);
      *(_OWORD *)(v10 + 30) = *(_OWORD *)(v9 + 112);
      *(_OWORD *)(v10 + 34) = v12;
      long long v13 = *(_OWORD *)(v9 + 32);
      *(_OWORD *)(v10 + 6) = *(_OWORD *)(v9 + 16);
      *(_OWORD *)(v10 + 10) = v13;
      __n128 result = *(__n128 *)(v9 + 48);
      long long v14 = *(_OWORD *)(v9 + 64);
      *(__n128 *)(v10 + 14) = result;
      int v15 = *(_DWORD *)(v9 + 4);
      v10[2] = 0;
      v10[3] = v15;
      *((void *)v10 + 2) = *(void *)(v9 + 8);
      ++v8;
      *(_OWORD *)(v10 + 18) = v14;
    }
    while (v6 != v7);
  }
  return result;
}

BOOL degas::LiteralBitmap::operator==(uint64_t a1, uint64_t a2)
{
  if (a2 == a1) {
    return 1;
  }
  unint64_t v2 = *(unsigned int *)(a2 + 4);
  if (v2 != *(_DWORD *)(a1 + 4)) {
    return 0;
  }
  if (!v2) {
    return 1;
  }
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  BOOL v3 = 0;
  uint64_t v4 = (uint64_t *)(a2 + 160);
  uint64_t v5 = (uint64_t *)(a1 + 160);
  unint64_t v6 = 1;
  do
  {
    if (memcmp(v5 - 17, v4 - 17, 0x80uLL)) {
      break;
    }
    BOOL v3 = v6 >= v2;
    if (v2 == v6) {
      break;
    }
    uint64_t v8 = *v5;
    v5 += 18;
    uint64_t v7 = v8;
    uint64_t v9 = *v4;
    v4 += 18;
    ++v6;
  }
  while (v7 == v9);
  return v3;
}

uint64_t degas::LiteralBitmap::rangeCompare(degas::LiteralBitmap *this, unint64_t a2, unint64_t a3)
{
  if (*((unsigned int *)this + 1) <= a3) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v3 = *((void *)this + 18 * a3 + 2);
  if (v3 + 1024 > a2) {
    unsigned int v4 = 0;
  }
  else {
    unsigned int v4 = -1;
  }
  if (v3 > a2) {
    return 1;
  }
  else {
    return v4;
  }
}

unint64_t degas::LiteralBitmap::findOffset(degas::LiteralBitmap *this, unint64_t a2)
{
  unsigned int v2 = *((_DWORD *)this + 1);
  if (!v2)
  {
    unint64_t v6 = 0;
    return degas::LiteralBitmap::findOffset(this, a2, v6, v2);
  }
  unint64_t v3 = *((void *)this + 2);
  if (v3 + 1024 > a2) {
    unsigned int v4 = 0;
  }
  else {
    unsigned int v4 = -1;
  }
  if (v3 > a2) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  if (v5 == -1)
  {
    unint64_t v6 = 1;
    return degas::LiteralBitmap::findOffset(this, a2, v6, v2);
  }
  if (v5)
  {
    unint64_t v6 = 0;
    unsigned int v2 = 0;
    return degas::LiteralBitmap::findOffset(this, a2, v6, v2);
  }
  return v5;
}

unint64_t degas::LiteralBitmap::findOffset(degas::LiteralBitmap *this, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a3 != a4)
  {
    while (1)
    {
      unint64_t v4 = (a3 + a4) >> 1;
      if (v4 >= *((unsigned int *)this + 1)) {
        goto LABEL_10;
      }
      unint64_t v5 = *((void *)this + 18 * v4 + 2);
      if (v5 <= a2) {
        break;
      }
      a4 = (a3 + a4) >> 1;
LABEL_11:
      unint64_t v4 = a4;
      if (a3 == a4) {
        return v4;
      }
    }
    if (v5 + 1024 > a2) {
      int v6 = 0;
    }
    else {
      int v6 = -1;
    }
    if (v6 != -1) {
      return v4;
    }
LABEL_10:
    a3 = v4 + 1;
    goto LABEL_11;
  }
  return a3;
}

uint64_t degas::LiteralBitmap::isSet(degas::LiteralBitmap *this, unint64_t a2)
{
  unint64_t Offset = degas::LiteralBitmap::findOffset(this, a2);
  if (Offset < *((unsigned int *)this + 1)
    && ((unint64_t v5 = *((void *)this + 18 * Offset + 2), v6 = v5 + 1024, v7 = a2 >= v5, v8 = a2 - v5, v7)
      ? (BOOL v9 = v6 > a2)
      : (BOOL v9 = 0),
        v9))
  {
    return (*((_DWORD *)this + 36 * Offset + (v8 >> 5) + 6) >> v8) & 1;
  }
  else
  {
    return 0;
  }
}

unint64_t degas::LiteralBitmap::bitAtIndex(degas::LiteralBitmap *this, unint64_t a2)
{
  uint64_t v2 = *((unsigned int *)this + 1);
  if (!v2) {
    return -1;
  }
  uint64_t v4 = 0;
  unint64_t v5 = 0;
  while (1)
  {
    unint64_t v6 = (char *)this + 144 * v4;
    unsigned int v9 = *((_DWORD *)v6 + 3);
    BOOL v7 = (unsigned int *)(v6 + 12);
    unsigned int v8 = v9;
    if (v9 == -1)
    {
      uint64_t v10 = 0;
      int32x4_t v11 = 0uLL;
      do
      {
        do
        {
          int32x4_t v11 = (int32x4_t)vpadalq_u16((uint32x4_t)v11, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)this + 144 * v4 + 4 * v10 + 24))));
          v10 += 4;
        }
        while (v10 != 32);
        uint64_t v10 = 0;
        unsigned int v8 = vaddvq_s32(v11);
        int32x4_t v11 = 0uLL;
      }
      while (v8 == -1);
      unsigned int *v7 = v8;
    }
    if (v5 + v8 > a2) {
      break;
    }
    ++v4;
    v5 += v8;
    if (v4 == v2) {
      return -1;
    }
  }
  long long v13 = (degas::LiteralBitmap *)((char *)this + 144 * v4 + 8);
  unint64_t v12 = -1;
  unint64_t v15 = -1;
  do
  {
    degas::Bitset::nextBit(v13, &v15, v12);
    unint64_t v12 = v15;
    ++v5;
  }
  while (v5 <= a2);
  return v12;
}

uint64_t degas::LiteralBitmap::count(degas::LiteralBitmap *this)
{
  uint64_t v1 = *((unsigned int *)this + 1);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  do
  {
    uint64_t v4 = (char *)this + 144 * v2;
    unsigned int v7 = *((_DWORD *)v4 + 3);
    unint64_t v5 = (unsigned int *)(v4 + 12);
    unsigned int v6 = v7;
    if (v7 == -1)
    {
      uint64_t v8 = 0;
      int32x4_t v9 = 0uLL;
      do
      {
        do
        {
          int32x4_t v9 = (int32x4_t)vpadalq_u16((uint32x4_t)v9, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)this + 144 * v2 + 4 * v8 + 24))));
          v8 += 4;
        }
        while (v8 != 32);
        uint64_t v8 = 0;
        unsigned int v6 = vaddvq_s32(v9);
        int32x4_t v9 = 0uLL;
      }
      while (v6 == -1);
      *unint64_t v5 = v6;
    }
    v3 += v6;
    ++v2;
  }
  while (v2 != v1);
  return v3;
}

uint64_t degas::LiteralBitmap::countBitsInRange(degas::LiteralBitmap *this, unint64_t a2, unint64_t a3)
{
  if (a2 > a3) {
    return 0;
  }
  unint64_t Offset = degas::LiteralBitmap::findOffset(this, a2);
  unint64_t v7 = *((unsigned int *)this + 1);
  if (Offset >= v7) {
    return 0;
  }
  unint64_t v8 = Offset;
  unint64_t v9 = degas::LiteralBitmap::findOffset(this, a3, Offset, *((unsigned int *)this + 1));
  unint64_t v11 = v9 - (v9 >= v7);
  unint64_t v12 = *((void *)this + 18 * v8 + 2);
  if (v12 <= a3 && v12 + 1024 >= a2) {
    uint64_t v14 = degas::Bitset::countBitsInRange((degas::LiteralBitmap *)((char *)this + 144 * v8 + 8), a2, a3, *(int8x8_t *)v10.i8);
  }
  else {
    uint64_t v14 = 0;
  }
  if (v8 != v11)
  {
    unint64_t v16 = v8 + 1;
    if (v8 + 1 < v11)
    {
      do
      {
        unint64_t v17 = *((void *)this + 18 * v16 + 2);
        if (v17 <= a3 && v17 + 1024 >= a2)
        {
          int v19 = (char *)this + 144 * v16;
          unsigned int v22 = *((_DWORD *)v19 + 3);
          uint64_t v20 = (unsigned int *)(v19 + 12);
          unsigned int v21 = v22;
          if (v22 == -1)
          {
            uint64_t v23 = 0;
            int32x4_t v10 = 0uLL;
            do
            {
              do
              {
                int32x4_t v10 = (int32x4_t)vpadalq_u16((uint32x4_t)v10, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)this + 144 * v16+ 4 * v23+ 24))));
                v23 += 4;
              }
              while (v23 != 32);
              uint64_t v23 = 0;
              unsigned int v21 = vaddvq_s32(v10);
              int32x4_t v10 = 0uLL;
            }
            while (v21 == -1);
            *uint64_t v20 = v21;
          }
          v14 += v21;
        }
        ++v16;
      }
      while (v16 != v11);
    }
    unint64_t v24 = *((void *)this + 18 * v11 + 2);
    if (v24 <= a3 && v24 + 1024 >= a2) {
      v14 += degas::Bitset::countBitsInRange((degas::LiteralBitmap *)((char *)this + 144 * v11 + 8), a2, a3, *(int8x8_t *)v10.i8);
    }
  }
  return v14;
}

unint64_t degas::LiteralBitmap::firstBit(degas::LiteralBitmap *this)
{
  unint64_t v1 = -1;
  unint64_t v3 = -1;
  if (*((_DWORD *)this + 1))
  {
    unint64_t v1 = *((void *)this + 2);
    if (v1 > 0xFFFFFFFFFFFFFBFFLL || (*((unsigned char *)this + 24) & 1) == 0)
    {
      degas::Bitset::nextBit((degas::LiteralBitmap *)((char *)this + 8), &v3, v1);
      return v3;
    }
  }
  return v1;
}

unint64_t degas::LiteralBitmap::lastBit(degas::LiteralBitmap *this)
{
  int v1 = *((_DWORD *)this + 1);
  if (!v1) {
    return 0;
  }
  unsigned int v2 = v1 - 1;
  for (uint64_t i = 37; i != 6; --i)
  {
    unsigned int v4 = *((_DWORD *)this + 36 * v2 + i);
    if (v4)
    {
      uint64_t v5 = i - 6;
      return (__clz(v4) ^ 0x1F | (unint64_t)(32 * v5)) + *((void *)this + 18 * v2 + 2);
    }
  }
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  unsigned int v4 = *((_DWORD *)this + 36 * v2 + 6);
  if (!v4) {
    return v6;
  }
  return (__clz(v4) ^ 0x1F | (unint64_t)(32 * v5)) + *((void *)this + 18 * v2 + 2);
}

char *degas::LiteralBitmap::emptyBitmap(degas::LiteralBitmap *this)
{
  {
    *(void *)&degas::LiteralBitmap::emptyBitmap(void)::bitmap = 7;
  }
  return &degas::LiteralBitmap::emptyBitmap(void)::bitmap;
}

uint64_t degas::AggregateValueTable::deleteEntry(degas::AggregateValueTable *this)
{
  return 2;
}

uint64_t degas::AggregateValueTable::createTable(degas::AggregateValueTable *this)
{
  return 0;
}

void degas::AggregateValueTable::~AggregateValueTable(degas::AggregateValueTable *this)
{
  *(void *)this = &unk_1F2801DE0;
  *((void *)this + 4) = 0;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
  JUMPOUT(0x1D25F9A90);
}

{
  *(void *)this = &unk_1F2801DE0;
  *((void *)this + 4) = 0;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

{
  *(void *)this = &unk_1F2801DE0;
  *((void *)this + 4) = 0;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

void *degas::AggregateValueTable::AggregateValueTable(void *a1, uint64_t a2, long long *a3, char a4, uint64_t a5)
{
  __n128 result = degas::Table::Table(a1, a3, a2, a5);
  void *result = &unk_1F28020E8;
  *((unsigned char *)result + 48) = a4;
  return result;
}

{
  void *result;

  __n128 result = degas::Table::Table(a1, a3, a2, a5);
  void *result = &unk_1F28020E8;
  *((unsigned char *)result + 48) = a4;
  return result;
}

uint64_t *degas::AggregateValueTable::readByIdentifierStatement(degas::AggregateValueTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x600;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas19AggregateValueTable25readByIdentifierStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_4770;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas19AggregateValueTable25readByIdentifierStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" where elementId=?1", 19);
  operator new();
}

void sub_1D178FBF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByAttrIdIdentifierStatement(degas::AggregateValueTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x800;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas19AggregateValueTable31readByAttrIdIdentifierStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_4_4774;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas19AggregateValueTable31readByAttrIdIdentifierStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" where elementId=?1 and attributeId=?2", 38);
  operator new();
}

void sub_1D178FEA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByBitmapStatement(degas::AggregateValueTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x801;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas19AggregateValueTable21readByBitmapStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_7_4776;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas19AggregateValueTable21readByBitmapStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select mergeLiteralBitmap(v.elementId) from ", 44);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" v, identifierBitmap(?1) b where v.elementId = b.value", 54);
  operator new();
}

void sub_1D1790150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByIntValueStatement(uint64_t a1, int a2)
{
  int v2 = a2 | (*(unsigned __int8 *)(a1 + 48) << 16);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable23readByIntValueStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_10_4779;
  v5[4] = a1;
  int v6 = a2;
  return degas::StatementCache::getStatement(v3, v2 | 0x900u, (uint64_t)v5);
}

void ___ZNK5degas19AggregateValueTable23readByIntValueStatementENS_14BinaryOperatorE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  int v3 = *(char *)(v2 + 31);
  if (v3 >= 0) {
    uint64_t v4 = v2 + 8;
  }
  else {
    uint64_t v4 = *(void *)(v2 + 8);
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(v2 + 31);
  }
  else {
    uint64_t v5 = *(void *)(v2 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, v4, v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)" where attributeId=?1 and intValue", 34);
  uint64_t v6 = *(unsigned int *)(a1 + 40);
  if (v6 > 8) {
    unint64_t v7 = " == ";
  }
  else {
    unint64_t v7 = (const char *)*((void *)&off_1E68DB280 + v6);
  }
  size_t v8 = strlen(v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)v7, v8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)"?2 order by elementId", 21);
  operator new();
}

void sub_1D1790460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByRealValueStatement(uint64_t a1, int a2)
{
  int v2 = a2 | (*(unsigned __int8 *)(a1 + 48) << 16);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable24readByRealValueStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_12_4782;
  v5[4] = a1;
  int v6 = a2;
  return degas::StatementCache::getStatement(v3, v2 | 0xA00u, (uint64_t)v5);
}

void ___ZNK5degas19AggregateValueTable24readByRealValueStatementENS_14BinaryOperatorE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  int v3 = *(char *)(v2 + 31);
  if (v3 >= 0) {
    uint64_t v4 = v2 + 8;
  }
  else {
    uint64_t v4 = *(void *)(v2 + 8);
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(v2 + 31);
  }
  else {
    uint64_t v5 = *(void *)(v2 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, v4, v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)" where attributeId=?1 and realValue", 35);
  uint64_t v6 = *(unsigned int *)(a1 + 40);
  if (v6 > 8) {
    unint64_t v7 = " == ";
  }
  else {
    unint64_t v7 = (const char *)*((void *)&off_1E68DB280 + v6);
  }
  size_t v8 = strlen(v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)v7, v8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)"?2 order by elementId", 21);
  operator new();
}

void sub_1D1790770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByStringValueStatement(uint64_t a1, int a2)
{
  int v2 = a2 | (*(unsigned __int8 *)(a1 + 48) << 16);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable26readByStringValueStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_14_4784;
  v5[4] = a1;
  int v6 = a2;
  return degas::StatementCache::getStatement(v3, v2 | 0xB00u, (uint64_t)v5);
}

void ___ZNK5degas19AggregateValueTable26readByStringValueStatementENS_14BinaryOperatorE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  int v3 = *(char *)(v2 + 31);
  if (v3 >= 0) {
    uint64_t v4 = v2 + 8;
  }
  else {
    uint64_t v4 = *(void *)(v2 + 8);
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(v2 + 31);
  }
  else {
    uint64_t v5 = *(void *)(v2 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, v4, v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)" where attributeId=?1 and stringValue", 37);
  uint64_t v6 = *(unsigned int *)(a1 + 40);
  if (v6 > 8) {
    unint64_t v7 = " == ";
  }
  else {
    unint64_t v7 = (const char *)*((void *)&off_1E68DB280 + v6);
  }
  size_t v8 = strlen(v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)v7, v8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)"?2 order by elementId", 21);
  operator new();
}

void sub_1D1790A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByIntValuesStatement(uint64_t a1, int a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable24readByIntValuesStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_16_4786;
  v5[4] = a1;
  int v6 = a2;
  return degas::StatementCache::getStatement(v3, a2 | (v2 << 16) | 0xC00u, (uint64_t)v5);
}

void ___ZNK5degas19AggregateValueTable24readByIntValuesStatementENS_14BinaryOperatorE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  int v3 = *(char *)(v2 + 31);
  if (v3 >= 0) {
    uint64_t v4 = v2 + 8;
  }
  else {
    uint64_t v4 = *(void *)(v2 + 8);
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(v2 + 31);
  }
  else {
    uint64_t v5 = *(void *)(v2 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, v4, v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)" where attributeId=?1 and intValue", 34);
  int v6 = degas::AttributeValueTable::listOperatorText(*(_DWORD *)(a1 + 40));
  size_t v7 = strlen(v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)"valueArray(?2, ?3, 'int64') order by elementId", 46);
  operator new();
}

void sub_1D1790D70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByRealValuesStatement(uint64_t a1, int a2)
{
  int v2 = a2 | (*(unsigned __int8 *)(a1 + 48) << 16);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable25readByRealValuesStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_18_4788;
  v5[4] = a1;
  int v6 = a2;
  return degas::StatementCache::getStatement(v3, v2 | 0xD00u, (uint64_t)v5);
}

void ___ZNK5degas19AggregateValueTable25readByRealValuesStatementENS_14BinaryOperatorE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  int v3 = *(char *)(v2 + 31);
  if (v3 >= 0) {
    uint64_t v4 = v2 + 8;
  }
  else {
    uint64_t v4 = *(void *)(v2 + 8);
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(v2 + 31);
  }
  else {
    uint64_t v5 = *(void *)(v2 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, v4, v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)" where attributeId=?1 and realValue", 35);
  int v6 = degas::AttributeValueTable::listOperatorText(*(_DWORD *)(a1 + 40));
  size_t v7 = strlen(v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)"valueArray(?2, ?3, 'double') order by elementId", 47);
  operator new();
}

void sub_1D1791064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByStringValuesStatement(uint64_t a1, int a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable27readByStringValuesStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_20_4790;
  v5[4] = a1;
  int v6 = a2;
  return degas::StatementCache::getStatement(v3, a2 | (v2 << 16) | 0xE00u, (uint64_t)v5);
}

void ___ZNK5degas19AggregateValueTable27readByStringValuesStatementENS_14BinaryOperatorE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  int v3 = *(char *)(v2 + 31);
  if (v3 >= 0) {
    uint64_t v4 = v2 + 8;
  }
  else {
    uint64_t v4 = *(void *)(v2 + 8);
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(v2 + 31);
  }
  else {
    uint64_t v5 = *(void *)(v2 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, v4, v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)" where attributeId=?1 and stringValue", 37);
  int v6 = degas::AttributeValueTable::listOperatorText(*(_DWORD *)(a1 + 40));
  size_t v7 = strlen(v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)"valueArray(?2, ?3, 'char*') order by elementId", 46);
  operator new();
}

void sub_1D1791354(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByIntValueIdentifiersStatement(uint64_t a1, int a2)
{
  int v2 = (a2 + 16) | (*(unsigned __int8 *)(a1 + 48) << 16);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable34readByIntValueIdentifiersStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_23;
  v5[4] = a1;
  int v6 = a2;
  return degas::StatementCache::getStatement(v3, v2 | 0x900u, (uint64_t)v5);
}

void ___ZNK5degas19AggregateValueTable34readByIntValueIdentifiersStatementENS_14BinaryOperatorE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  int v3 = *(char *)(v2 + 31);
  if (v3 >= 0) {
    uint64_t v4 = v2 + 8;
  }
  else {
    uint64_t v4 = *(void *)(v2 + 8);
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(v2 + 31);
  }
  else {
    uint64_t v5 = *(void *)(v2 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, v4, v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)" where elementId in identifierBitmap(?1) and attributeId = ?2 and +intValue", 75);
  uint64_t v6 = *(unsigned int *)(a1 + 40);
  if (v6 > 8) {
    size_t v7 = " == ";
  }
  else {
    size_t v7 = (const char *)*((void *)&off_1E68DB280 + v6);
  }
  size_t v8 = strlen(v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)v7, v8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)"?3", 2);
  operator new();
}

void sub_1D1791668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByRealValueIdentifiersStatement(uint64_t a1, int a2)
{
  int v2 = (a2 + 16) | (*(unsigned __int8 *)(a1 + 48) << 16);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable35readByRealValueIdentifiersStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_25;
  v5[4] = a1;
  int v6 = a2;
  return degas::StatementCache::getStatement(v3, v2 | 0xA00u, (uint64_t)v5);
}

void ___ZNK5degas19AggregateValueTable35readByRealValueIdentifiersStatementENS_14BinaryOperatorE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  int v3 = *(char *)(v2 + 31);
  if (v3 >= 0) {
    uint64_t v4 = v2 + 8;
  }
  else {
    uint64_t v4 = *(void *)(v2 + 8);
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(v2 + 31);
  }
  else {
    uint64_t v5 = *(void *)(v2 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, v4, v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)" where elementId in identifierBitmap(?1) and attributeId = ?2 and +realValue", 76);
  uint64_t v6 = *(unsigned int *)(a1 + 40);
  if (v6 > 8) {
    size_t v7 = " == ";
  }
  else {
    size_t v7 = (const char *)*((void *)&off_1E68DB280 + v6);
  }
  size_t v8 = strlen(v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)v7, v8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)"?3", 2);
  operator new();
}

void sub_1D179197C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByStringValueIdentifiersStatement(uint64_t a1, int a2)
{
  int v2 = (a2 + 16) | (*(unsigned __int8 *)(a1 + 48) << 16);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable37readByStringValueIdentifiersStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_27;
  v5[4] = a1;
  int v6 = a2;
  return degas::StatementCache::getStatement(v3, v2 | 0xB00u, (uint64_t)v5);
}

void ___ZNK5degas19AggregateValueTable37readByStringValueIdentifiersStatementENS_14BinaryOperatorE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  int v3 = *(char *)(v2 + 31);
  if (v3 >= 0) {
    uint64_t v4 = v2 + 8;
  }
  else {
    uint64_t v4 = *(void *)(v2 + 8);
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(v2 + 31);
  }
  else {
    uint64_t v5 = *(void *)(v2 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, v4, v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)" where elementId in identifierBitmap(?1) and attributeId = ?2 and +stringValue", 78);
  uint64_t v6 = *(unsigned int *)(a1 + 40);
  if (v6 > 8) {
    size_t v7 = " == ";
  }
  else {
    size_t v7 = (const char *)*((void *)&off_1E68DB280 + v6);
  }
  size_t v8 = strlen(v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)v7, v8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)"?3", 2);
  operator new();
}

void sub_1D1791C90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByIntValuesIdentifiersStatement(uint64_t a1, int a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable35readByIntValuesIdentifiersStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_29;
  v5[4] = a1;
  int v6 = a2;
  return degas::StatementCache::getStatement(v3, (a2 + 16) | (v2 << 16) | 0xC00u, (uint64_t)v5);
}

void ___ZNK5degas19AggregateValueTable35readByIntValuesIdentifiersStatementENS_14BinaryOperatorE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  int v3 = *(char *)(v2 + 31);
  if (v3 >= 0) {
    uint64_t v4 = v2 + 8;
  }
  else {
    uint64_t v4 = *(void *)(v2 + 8);
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(v2 + 31);
  }
  else {
    uint64_t v5 = *(void *)(v2 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, v4, v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)" where elementId in identifierBitmap(?1) and attributeId = ?2 and +intValue", 75);
  int v6 = degas::AttributeValueTable::listOperatorText(*(_DWORD *)(a1 + 40));
  size_t v7 = strlen(v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)"valueArray(?3, ?4, 'int64') order by elementId", 46);
  operator new();
}

void sub_1D1791F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByRealValuesIdentifiersStatement(uint64_t a1, int a2)
{
  int v2 = (a2 + 16) | (*(unsigned __int8 *)(a1 + 48) << 16);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable36readByRealValuesIdentifiersStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_31_4797;
  v5[4] = a1;
  int v6 = a2;
  return degas::StatementCache::getStatement(v3, v2 | 0xD00u, (uint64_t)v5);
}

void ___ZNK5degas19AggregateValueTable36readByRealValuesIdentifiersStatementENS_14BinaryOperatorE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  int v3 = *(char *)(v2 + 31);
  if (v3 >= 0) {
    uint64_t v4 = v2 + 8;
  }
  else {
    uint64_t v4 = *(void *)(v2 + 8);
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(v2 + 31);
  }
  else {
    uint64_t v5 = *(void *)(v2 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, v4, v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)" where elementId in identifierBitmap(?1) and attributeId = ?2 and +realValue", 76);
  int v6 = degas::AttributeValueTable::listOperatorText(*(_DWORD *)(a1 + 40));
  size_t v7 = strlen(v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)"valueArray(?3, ?4, 'double') order by elementId", 47);
  operator new();
}

void sub_1D179227C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByStringValuesIdentifiersStatement(uint64_t a1, int a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable38readByStringValuesIdentifiersStatementENS_14BinaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_33;
  v5[4] = a1;
  int v6 = a2;
  return degas::StatementCache::getStatement(v3, (a2 + 16) | (v2 << 16) | 0xE00u, (uint64_t)v5);
}

void ___ZNK5degas19AggregateValueTable38readByStringValuesIdentifiersStatementENS_14BinaryOperatorE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v8);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  int v3 = *(char *)(v2 + 31);
  if (v3 >= 0) {
    uint64_t v4 = v2 + 8;
  }
  else {
    uint64_t v4 = *(void *)(v2 + 8);
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(v2 + 31);
  }
  else {
    uint64_t v5 = *(void *)(v2 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, v4, v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)" where elementId in identifierBitmap(?1) and attributeId = ?2 and +stringValue", 78);
  int v6 = degas::AttributeValueTable::listOperatorText(*(_DWORD *)(a1 + 40));
  size_t v7 = strlen(v6);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v8, (uint64_t)"valueArray(?3, ?4, 'char*') order by elementId", 46);
  operator new();
}

void sub_1D1792570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByIntRangeStatement(uint64_t a1, int a2)
{
  int v2 = (a2 + 32) | (*(unsigned __int8 *)(a1 + 48) << 16);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable23readByIntRangeStatementENS_15TernaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_37_4800;
  v5[4] = a1;
  int v6 = a2;
  return degas::StatementCache::getStatement(v3, v2 | 0x900u, (uint64_t)v5);
}

void ___ZNK5degas19AggregateValueTable23readByIntRangeStatementENS_15TernaryOperatorE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v10);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  int v3 = *(char *)(v2 + 31);
  if (v3 >= 0) {
    uint64_t v4 = v2 + 8;
  }
  else {
    uint64_t v4 = *(void *)(v2 + 8);
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(v2 + 31);
  }
  else {
    uint64_t v5 = *(void *)(v2 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, v4, v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)" where attributeId=?1 and ", 26);
  degas::AttributeValueTable::rangeOperatorText("intValue", *(_DWORD *)(a1 + 40));
  if ((v9 & 0x80u) == 0) {
    int v6 = __p;
  }
  else {
    int v6 = (void **)__p[0];
  }
  if ((v9 & 0x80u) == 0) {
    uint64_t v7 = v9;
  }
  else {
    uint64_t v7 = (uint64_t)__p[1];
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)" order by elementId", 19);
  if ((char)v9 < 0) {
    operator delete(__p[0]);
  }
  operator new();
}

void sub_1D1792890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByRealRangeStatement(uint64_t a1, int a2)
{
  int v2 = (a2 + 32) | (*(unsigned __int8 *)(a1 + 48) << 16);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable24readByRealRangeStatementENS_15TernaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_39_4804;
  v5[4] = a1;
  int v6 = a2;
  return degas::StatementCache::getStatement(v3, v2 | 0xA00u, (uint64_t)v5);
}

void ___ZNK5degas19AggregateValueTable24readByRealRangeStatementENS_15TernaryOperatorE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v10);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  int v3 = *(char *)(v2 + 31);
  if (v3 >= 0) {
    uint64_t v4 = v2 + 8;
  }
  else {
    uint64_t v4 = *(void *)(v2 + 8);
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(v2 + 31);
  }
  else {
    uint64_t v5 = *(void *)(v2 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, v4, v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)" where attributeId=?1 and ", 26);
  degas::AttributeValueTable::rangeOperatorText("realValue", *(_DWORD *)(a1 + 40));
  if ((v9 & 0x80u) == 0) {
    int v6 = __p;
  }
  else {
    int v6 = (void **)__p[0];
  }
  if ((v9 & 0x80u) == 0) {
    uint64_t v7 = v9;
  }
  else {
    uint64_t v7 = (uint64_t)__p[1];
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)" order by elementId", 19);
  if ((char)v9 < 0) {
    operator delete(__p[0]);
  }
  operator new();
}

void sub_1D1792BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByStringRangeStatement(uint64_t a1, int a2)
{
  int v2 = (a2 + 32) | (*(unsigned __int8 *)(a1 + 48) << 16);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable26readByStringRangeStatementENS_15TernaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_41_4806;
  v5[4] = a1;
  int v6 = a2;
  return degas::StatementCache::getStatement(v3, v2 | 0xB00u, (uint64_t)v5);
}

void ___ZNK5degas19AggregateValueTable26readByStringRangeStatementENS_15TernaryOperatorE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v10);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  int v3 = *(char *)(v2 + 31);
  if (v3 >= 0) {
    uint64_t v4 = v2 + 8;
  }
  else {
    uint64_t v4 = *(void *)(v2 + 8);
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(v2 + 31);
  }
  else {
    uint64_t v5 = *(void *)(v2 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, v4, v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)" where attributeId=?1 and ", 26);
  degas::AttributeValueTable::rangeOperatorText("stringValue", *(_DWORD *)(a1 + 40));
  if ((v9 & 0x80u) == 0) {
    int v6 = __p;
  }
  else {
    int v6 = (void **)__p[0];
  }
  if ((v9 & 0x80u) == 0) {
    uint64_t v7 = v9;
  }
  else {
    uint64_t v7 = (uint64_t)__p[1];
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)" order by elementId", 19);
  if ((char)v9 < 0) {
    operator delete(__p[0]);
  }
  operator new();
}

void sub_1D1792F08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByIntRangeIdentifiersStatement(uint64_t a1, int a2)
{
  int v2 = (a2 + 64) | (*(unsigned __int8 *)(a1 + 48) << 16);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable34readByIntRangeIdentifiersStatementENS_15TernaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_44_4808;
  v5[4] = a1;
  int v6 = a2;
  return degas::StatementCache::getStatement(v3, v2 | 0x900u, (uint64_t)v5);
}

void ___ZNK5degas19AggregateValueTable34readByIntRangeIdentifiersStatementENS_15TernaryOperatorE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v10);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  int v3 = *(char *)(v2 + 31);
  if (v3 >= 0) {
    uint64_t v4 = v2 + 8;
  }
  else {
    uint64_t v4 = *(void *)(v2 + 8);
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(v2 + 31);
  }
  else {
    uint64_t v5 = *(void *)(v2 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, v4, v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)" where attributeId=?1 and ", 26);
  degas::AttributeValueTable::rangeOperatorText("+intValue", *(_DWORD *)(a1 + 40));
  if ((v9 & 0x80u) == 0) {
    int v6 = __p;
  }
  else {
    int v6 = (void **)__p[0];
  }
  if ((v9 & 0x80u) == 0) {
    uint64_t v7 = v9;
  }
  else {
    uint64_t v7 = (uint64_t)__p[1];
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)" and elementId in identifierBitmap(?4) order by elementId", 57);
  if ((char)v9 < 0) {
    operator delete(__p[0]);
  }
  operator new();
}

void sub_1D1793244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByRealRangeIdentifiersStatement(uint64_t a1, int a2)
{
  int v2 = (a2 + 64) | (*(unsigned __int8 *)(a1 + 48) << 16);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable35readByRealRangeIdentifiersStatementENS_15TernaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_46_4811;
  v5[4] = a1;
  int v6 = a2;
  return degas::StatementCache::getStatement(v3, v2 | 0xA00u, (uint64_t)v5);
}

void ___ZNK5degas19AggregateValueTable35readByRealRangeIdentifiersStatementENS_15TernaryOperatorE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v10);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  int v3 = *(char *)(v2 + 31);
  if (v3 >= 0) {
    uint64_t v4 = v2 + 8;
  }
  else {
    uint64_t v4 = *(void *)(v2 + 8);
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(v2 + 31);
  }
  else {
    uint64_t v5 = *(void *)(v2 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, v4, v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)" where attributeId=?1 and ", 26);
  degas::AttributeValueTable::rangeOperatorText("+realValue", *(_DWORD *)(a1 + 40));
  if ((v9 & 0x80u) == 0) {
    int v6 = __p;
  }
  else {
    int v6 = (void **)__p[0];
  }
  if ((v9 & 0x80u) == 0) {
    uint64_t v7 = v9;
  }
  else {
    uint64_t v7 = (uint64_t)__p[1];
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)" and elementId in identifierBitmap(?4) order by elementId", 57);
  if ((char)v9 < 0) {
    operator delete(__p[0]);
  }
  operator new();
}

void sub_1D1793580(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readByStringRangeIdentifiersStatement(uint64_t a1, int a2)
{
  int v2 = (a2 + 64) | (*(unsigned __int8 *)(a1 + 48) << 16);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5degas19AggregateValueTable37readByStringRangeIdentifiersStatementENS_15TernaryOperatorE_block_invoke;
  v5[3] = &__block_descriptor_tmp_48_4813;
  v5[4] = a1;
  int v6 = a2;
  return degas::StatementCache::getStatement(v3, v2 | 0xB00u, (uint64_t)v5);
}

void ___ZNK5degas19AggregateValueTable37readByStringRangeIdentifiersStatementENS_15TernaryOperatorE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v10);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  int v3 = *(char *)(v2 + 31);
  if (v3 >= 0) {
    uint64_t v4 = v2 + 8;
  }
  else {
    uint64_t v4 = *(void *)(v2 + 8);
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(v2 + 31);
  }
  else {
    uint64_t v5 = *(void *)(v2 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, v4, v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)" where attributeId=?1 and ", 26);
  degas::AttributeValueTable::rangeOperatorText("+stringValue", *(_DWORD *)(a1 + 40));
  if ((v9 & 0x80u) == 0) {
    int v6 = __p;
  }
  else {
    int v6 = (void **)__p[0];
  }
  if ((v9 & 0x80u) == 0) {
    uint64_t v7 = v9;
  }
  else {
    uint64_t v7 = (uint64_t)__p[1];
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)v6, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v10, (uint64_t)" and elementId in identifierBitmap(?4) order by elementId", 57);
  if ((char)v9 < 0) {
    operator delete(__p[0]);
  }
  operator new();
}

void sub_1D17938BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::readAllStatement(degas::AggregateValueTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x700;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas19AggregateValueTable16readAllStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_49_4815;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas19AggregateValueTable16readAllStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select mergeLiteralBitmap(elementId) from ", 42);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" order by elementId", 19);
  operator new();
}

void sub_1D1793B84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByIdentifier(degas::AggregateValueTable *this, sqlite3_int64 a2)
{
  uint64_t v3 = degas::AggregateValueTable::readByIdentifierStatement(this);
  degas::Statement::bindInteger((sqlite3_stmt **)*v3, 1, a2);
  return v3;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByAttrIdIdentifier(degas::AggregateValueTable *this, sqlite3_int64 a2, sqlite3_int64 a3)
{
  uint64_t v5 = degas::AggregateValueTable::readByAttrIdIdentifierStatement(this);
  degas::Statement::bindInteger((sqlite3_stmt **)*v5, 1, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v5, 2, a2);
  return v5;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByBitmap(degas::AggregateValueTable *this, Bitmap *a2)
{
  uint64_t v3 = degas::AggregateValueTable::readByBitmapStatement(this);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v3, 1, a2);
  return v3;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByValue(uint64_t a1, sqlite3_int64 a2, sqlite3_int64 a3, int a4)
{
  int v6 = degas::AggregateValueTable::readByIntValueStatement(a1, a4);
  degas::Statement::bindInteger((sqlite3_stmt **)*v6, 1, a2);
  degas::Statement::bindInteger((sqlite3_stmt **)*v6, 2, a3);
  return v6;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByValue(uint64_t a1, sqlite3_int64 a2, int a3, double a4)
{
  int v6 = degas::AggregateValueTable::readByRealValueStatement(a1, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v6, 1, a2);
  degas::Statement::bindDouble((sqlite3_stmt **)*v6, 2, a4);
  return v6;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByValue(uint64_t a1, sqlite3_int64 a2, uint64_t *a3, int a4)
{
  int v6 = degas::AggregateValueTable::readByStringValueStatement(a1, a4);
  degas::Statement::bindInteger((sqlite3_stmt **)*v6, 1, a2);
  degas::Statement::bindString(*v6, 2, a3);
  return v6;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByValues(uint64_t a1, sqlite3_int64 a2, void *a3, int a4, int a5)
{
  uint64_t v8 = degas::AggregateValueTable::readByIntValuesStatement(a1, a5);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 1, a2);
  degas::Statement::bindArrayPointer((sqlite3_stmt **)*v8, 2, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 3, a4);
  return v8;
}

{
  uint64_t *v8;

  uint64_t v8 = degas::AggregateValueTable::readByRealValuesStatement(a1, a5);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 1, a2);
  degas::Statement::bindArrayPointer((sqlite3_stmt **)*v8, 2, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 3, a4);
  return v8;
}

{
  uint64_t *v8;

  uint64_t v8 = degas::AggregateValueTable::readByStringValuesStatement(a1, a5);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 1, a2);
  degas::Statement::bindArrayPointer((sqlite3_stmt **)*v8, 2, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 3, a4);
  return v8;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByValueIdentifiers(uint64_t a1, sqlite3_int64 a2, sqlite3_int64 a3, int a4, Bitmap *a5)
{
  uint64_t v8 = degas::AggregateValueTable::readByIntValueIdentifiersStatement(a1, a4);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v8, 1, a5);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 2, a2);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 3, a3);
  return v8;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByValueIdentifiers(uint64_t a1, sqlite3_int64 a2, int a3, Bitmap *a4, double a5)
{
  uint64_t v8 = degas::AggregateValueTable::readByRealValueIdentifiersStatement(a1, a3);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v8, 1, a4);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 2, a2);
  degas::Statement::bindDouble((sqlite3_stmt **)*v8, 3, a5);
  return v8;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByValueIdentifiers(uint64_t a1, sqlite3_int64 a2, uint64_t *a3, int a4, Bitmap *a5)
{
  uint64_t v8 = degas::AggregateValueTable::readByStringValueIdentifiersStatement(a1, a4);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v8, 1, a5);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 2, a2);
  degas::Statement::bindString(*v8, 3, a3);
  return v8;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByValuesIdentifiers(uint64_t a1, sqlite3_int64 a2, void *a3, int a4, int a5, Bitmap *a6)
{
  uint64_t v10 = degas::AggregateValueTable::readByIntValuesIdentifiersStatement(a1, a5);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v10, 1, a6);
  degas::Statement::bindInteger((sqlite3_stmt **)*v10, 2, a2);
  degas::Statement::bindArrayPointer((sqlite3_stmt **)*v10, 3, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v10, 4, a4);
  return v10;
}

{
  uint64_t *v10;

  uint64_t v10 = degas::AggregateValueTable::readByRealValuesIdentifiersStatement(a1, a5);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v10, 1, a6);
  degas::Statement::bindInteger((sqlite3_stmt **)*v10, 2, a2);
  degas::Statement::bindArrayPointer((sqlite3_stmt **)*v10, 3, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v10, 4, a4);
  return v10;
}

{
  uint64_t *v10;

  uint64_t v10 = degas::AggregateValueTable::readByStringValuesIdentifiersStatement(a1, a5);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v10, 1, a6);
  degas::Statement::bindInteger((sqlite3_stmt **)*v10, 2, a2);
  degas::Statement::bindArrayPointer((sqlite3_stmt **)*v10, 3, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v10, 4, a4);
  return v10;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByRange(uint64_t a1, sqlite3_int64 a2, sqlite3_int64 a3, sqlite3_int64 a4, int a5)
{
  uint64_t v8 = degas::AggregateValueTable::readByIntRangeStatement(a1, a5);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 1, a2);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 2, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 3, a4);
  return v8;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByRange(uint64_t a1, sqlite3_int64 a2, int a3, double a4, double a5)
{
  uint64_t v8 = degas::AggregateValueTable::readByRealRangeStatement(a1, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 1, a2);
  degas::Statement::bindDouble((sqlite3_stmt **)*v8, 2, a4);
  degas::Statement::bindDouble((sqlite3_stmt **)*v8, 3, a5);
  return v8;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByRange(uint64_t a1, sqlite3_int64 a2, uint64_t *a3, uint64_t *a4, int a5)
{
  uint64_t v8 = degas::AggregateValueTable::readByStringRangeStatement(a1, a5);
  degas::Statement::bindInteger((sqlite3_stmt **)*v8, 1, a2);
  degas::Statement::bindString(*v8, 2, a3);
  degas::Statement::bindString(*v8, 3, a4);
  return v8;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByRangeIdentifiers(uint64_t a1, sqlite3_int64 a2, sqlite3_int64 a3, sqlite3_int64 a4, int a5, Bitmap *a6)
{
  uint64_t v10 = degas::AggregateValueTable::readByIntRangeIdentifiersStatement(a1, a5);
  degas::Statement::bindInteger((sqlite3_stmt **)*v10, 1, a2);
  degas::Statement::bindInteger((sqlite3_stmt **)*v10, 2, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v10, 3, a4);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v10, 4, a6);
  return v10;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByRangeIdentifiers(uint64_t a1, sqlite3_int64 a2, int a3, Bitmap *a4, double a5, double a6)
{
  uint64_t v10 = degas::AggregateValueTable::readByRealRangeIdentifiersStatement(a1, a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v10, 1, a2);
  degas::Statement::bindDouble((sqlite3_stmt **)*v10, 2, a5);
  degas::Statement::bindDouble((sqlite3_stmt **)*v10, 3, a6);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v10, 4, a4);
  return v10;
}

uint64_t *degas::AggregateValueTable::prepareStatementToReadByRangeIdentifiers(uint64_t a1, sqlite3_int64 a2, uint64_t *a3, uint64_t *a4, int a5, Bitmap *a6)
{
  uint64_t v10 = degas::AggregateValueTable::readByStringRangeIdentifiersStatement(a1, a5);
  degas::Statement::bindInteger((sqlite3_stmt **)*v10, 1, a2);
  degas::Statement::bindString(*v10, 2, a3);
  degas::Statement::bindString(*v10, 3, a4);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v10, 4, a6);
  return v10;
}

void *degas::AggregateValueCursor::AggregateValueCursor(void *this)
{
  *this = 0;
  this[1] = 0;
  return this;
}

degas::AggregateValueCursor *degas::AggregateValueCursor::AggregateValueCursor(degas::AggregateValueCursor *this, const degas::AggregateValueTable *a2)
{
  AllStatement = degas::AggregateValueTable::readAllStatement(a2);
  uint64_t v4 = AllStatement[1];
  *(void *)this = *AllStatement;
  *((void *)this + 1) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

{
  uint64_t *AllStatement;
  uint64_t v4;

  AllStatement = degas::AggregateValueTable::readAllStatement(a2);
  uint64_t v4 = AllStatement[1];
  *(void *)this = *AllStatement;
  *((void *)this + 1) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

degas::AggregateValueCursor *degas::AggregateValueCursor::AggregateValueCursor(degas::AggregateValueCursor *this, sqlite3_int64 a2, const degas::AggregateValueTable *a3)
{
  uint64_t v5 = degas::AggregateValueTable::readByIdentifierStatement(a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v5, 1, a2);
  uint64_t v6 = v5[1];
  *(void *)this = *v5;
  *((void *)this + 1) = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

degas::AggregateValueCursor *degas::AggregateValueCursor::AggregateValueCursor(degas::AggregateValueCursor *this, sqlite3_int64 a2, sqlite3_int64 a3, const degas::AggregateValueTable *a4)
{
  uint64_t v5 = degas::AggregateValueTable::prepareStatementToReadByAttrIdIdentifier(a4, a2, a3);
  uint64_t v6 = v5[1];
  *(void *)this = *v5;
  *((void *)this + 1) = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

{
  uint64_t *v5;
  uint64_t v6;

  uint64_t v5 = degas::AggregateValueTable::prepareStatementToReadByAttrIdIdentifier(a4, a2, a3);
  uint64_t v6 = v5[1];
  *(void *)this = *v5;
  *((void *)this + 1) = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

degas::AggregateValueCursor *degas::AggregateValueCursor::AggregateValueCursor(degas::AggregateValueCursor *this, Bitmap *a2, const degas::AggregateValueTable *a3)
{
  uint64_t v5 = degas::AggregateValueTable::readByBitmapStatement(a3);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v5, 1, a2);
  uint64_t v6 = v5[1];
  *(void *)this = *v5;
  *((void *)this + 1) = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

void degas::AggregateValueCursor::setForValue(uint64_t *a1, sqlite3_int64 a2, sqlite3_int64 a3, int a4, uint64_t a5)
{
  uint64_t v6 = degas::AggregateValueTable::prepareStatementToReadByValue(a5, a2, a3, a4);
  uint64_t v8 = *v6;
  uint64_t v7 = v6[1];
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  unsigned __int8 v9 = (std::__shared_weak_count *)a1[1];
  *a1 = v8;
  a1[1] = v7;
  if (v9)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

void degas::AggregateValueCursor::setForValue(uint64_t *a1, sqlite3_int64 a2, int a3, uint64_t a4, double a5)
{
  uint64_t v6 = degas::AggregateValueTable::prepareStatementToReadByValue(a4, a2, a3, a5);
  uint64_t v8 = *v6;
  uint64_t v7 = v6[1];
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  unsigned __int8 v9 = (std::__shared_weak_count *)a1[1];
  *a1 = v8;
  a1[1] = v7;
  if (v9)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

void degas::AggregateValueCursor::setForValue(uint64_t *a1, sqlite3_int64 a2, uint64_t *a3, int a4, uint64_t a5)
{
  uint64_t v6 = degas::AggregateValueTable::prepareStatementToReadByValue(a5, a2, a3, a4);
  uint64_t v8 = *v6;
  uint64_t v7 = v6[1];
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  unsigned __int8 v9 = (std::__shared_weak_count *)a1[1];
  *a1 = v8;
  a1[1] = v7;
  if (v9)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
}

void degas::AggregateValueCursor::setForValues(uint64_t *a1, sqlite3_int64 a2, void *a3, int a4, int a5, uint64_t a6)
{
  uint64_t v7 = degas::AggregateValueTable::prepareStatementToReadByValues(a6, a2, a3, a4, a5);
  uint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = (std::__shared_weak_count *)a1[1];
  *a1 = v9;
  a1[1] = v8;
  if (v10)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

{
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  uint64_t vars8;

  uint64_t v7 = degas::AggregateValueTable::prepareStatementToReadByValues(a6, a2, a3, a4, a5);
  uint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = (std::__shared_weak_count *)a1[1];
  *a1 = v9;
  a1[1] = v8;
  if (v10)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

{
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  uint64_t vars8;

  uint64_t v7 = degas::AggregateValueTable::prepareStatementToReadByValues(a6, a2, a3, a4, a5);
  uint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = (std::__shared_weak_count *)a1[1];
  *a1 = v9;
  a1[1] = v8;
  if (v10)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

void degas::AggregateValueCursor::setToFilterForValue(uint64_t *a1, sqlite3_int64 a2, sqlite3_int64 a3, int a4, Bitmap *a5, uint64_t a6)
{
  uint64_t v7 = degas::AggregateValueTable::prepareStatementToReadByValueIdentifiers(a6, a2, a3, a4, a5);
  uint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = (std::__shared_weak_count *)a1[1];
  *a1 = v9;
  a1[1] = v8;
  if (v10)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

void degas::AggregateValueCursor::setToFilterForValue(uint64_t *a1, sqlite3_int64 a2, int a3, Bitmap *a4, uint64_t a5, double a6)
{
  uint64_t v7 = degas::AggregateValueTable::prepareStatementToReadByValueIdentifiers(a5, a2, a3, a4, a6);
  uint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = (std::__shared_weak_count *)a1[1];
  *a1 = v9;
  a1[1] = v8;
  if (v10)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

void degas::AggregateValueCursor::setToFilterForValue(uint64_t *a1, sqlite3_int64 a2, uint64_t *a3, int a4, Bitmap *a5, uint64_t a6)
{
  uint64_t v7 = degas::AggregateValueTable::prepareStatementToReadByValueIdentifiers(a6, a2, a3, a4, a5);
  uint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = (std::__shared_weak_count *)a1[1];
  *a1 = v9;
  a1[1] = v8;
  if (v10)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

void degas::AggregateValueCursor::setToFilterForValues(uint64_t *a1, sqlite3_int64 a2, void *a3, int a4, int a5, Bitmap *a6, uint64_t a7)
{
  uint64_t v8 = degas::AggregateValueTable::prepareStatementToReadByValuesIdentifiers(a7, a2, a3, a4, a5, a6);
  uint64_t v10 = *v8;
  uint64_t v9 = v8[1];
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  unint64_t v11 = (std::__shared_weak_count *)a1[1];
  *a1 = v10;
  a1[1] = v9;
  if (v11)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
}

{
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  uint64_t vars8;

  uint64_t v8 = degas::AggregateValueTable::prepareStatementToReadByValuesIdentifiers(a7, a2, a3, a4, a5, a6);
  uint64_t v10 = *v8;
  uint64_t v9 = v8[1];
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  unint64_t v11 = (std::__shared_weak_count *)a1[1];
  *a1 = v10;
  a1[1] = v9;
  if (v11)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
}

{
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  uint64_t vars8;

  uint64_t v8 = degas::AggregateValueTable::prepareStatementToReadByValuesIdentifiers(a7, a2, a3, a4, a5, a6);
  uint64_t v10 = *v8;
  uint64_t v9 = v8[1];
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  unint64_t v11 = (std::__shared_weak_count *)a1[1];
  *a1 = v10;
  a1[1] = v9;
  if (v11)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
}

void degas::AggregateValueCursor::setForRange(uint64_t *a1, sqlite3_int64 a2, sqlite3_int64 a3, sqlite3_int64 a4, int a5, uint64_t a6)
{
  uint64_t v7 = degas::AggregateValueTable::prepareStatementToReadByRange(a6, a2, a3, a4, a5);
  uint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = (std::__shared_weak_count *)a1[1];
  *a1 = v9;
  a1[1] = v8;
  if (v10)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

void degas::AggregateValueCursor::setForRange(uint64_t *a1, sqlite3_int64 a2, int a3, uint64_t a4, double a5, double a6)
{
  uint64_t v7 = degas::AggregateValueTable::prepareStatementToReadByRange(a4, a2, a3, a5, a6);
  uint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = (std::__shared_weak_count *)a1[1];
  *a1 = v9;
  a1[1] = v8;
  if (v10)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

void degas::AggregateValueCursor::setForRange(uint64_t *a1, sqlite3_int64 a2, uint64_t *a3, uint64_t *a4, int a5, uint64_t a6)
{
  uint64_t v7 = degas::AggregateValueTable::prepareStatementToReadByRange(a6, a2, a3, a4, a5);
  uint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v10 = (std::__shared_weak_count *)a1[1];
  *a1 = v9;
  a1[1] = v8;
  if (v10)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

void degas::AggregateValueCursor::setToFilterForRange(uint64_t *a1, sqlite3_int64 a2, sqlite3_int64 a3, sqlite3_int64 a4, int a5, Bitmap *a6, uint64_t a7)
{
  uint64_t v8 = degas::AggregateValueTable::prepareStatementToReadByRangeIdentifiers(a7, a2, a3, a4, a5, a6);
  uint64_t v10 = *v8;
  uint64_t v9 = v8[1];
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  unint64_t v11 = (std::__shared_weak_count *)a1[1];
  *a1 = v10;
  a1[1] = v9;
  if (v11)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
}

void degas::AggregateValueCursor::setToFilterForRange(uint64_t *a1, sqlite3_int64 a2, int a3, Bitmap *a4, uint64_t a5, double a6, double a7)
{
  uint64_t v8 = degas::AggregateValueTable::prepareStatementToReadByRangeIdentifiers(a5, a2, a3, a4, a6, a7);
  uint64_t v10 = *v8;
  uint64_t v9 = v8[1];
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  unint64_t v11 = (std::__shared_weak_count *)a1[1];
  *a1 = v10;
  a1[1] = v9;
  if (v11)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
}

void degas::AggregateValueCursor::setToFilterForRange(uint64_t *a1, sqlite3_int64 a2, uint64_t *a3, uint64_t *a4, int a5, Bitmap *a6, uint64_t a7)
{
  uint64_t v8 = degas::AggregateValueTable::prepareStatementToReadByRangeIdentifiers(a7, a2, a3, a4, a5, a6);
  uint64_t v10 = *v8;
  uint64_t v9 = v8[1];
  if (v9) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
  }
  unint64_t v11 = (std::__shared_weak_count *)a1[1];
  *a1 = v10;
  a1[1] = v9;
  if (v11)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
}

unsigned int *degas::AggregateValueCursor::identifiers(sqlite3_stmt ***this)
{
  return degas::Statement::literalBitmapColumnValue(*this, 0);
}

void degas::AggregateValueCursor::identifiers(sqlite3_stmt ***this, degas::Bitmap *a2)
{
}

uint64_t degas::NodeTable::deleteEntry(sqlite3 **this, sqlite3_int64 a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = degas::NodeTable::deleteStatement((degas::NodeTable *)this);
  degas::Statement::bindInteger((sqlite3_stmt **)*v4, 1, a2);
  uint64_t v5 = degas::Statement::update((sqlite3_stmt **)*v4);
  if (v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = sqlite3_errmsg(this[4]);
    int v8 = 136315138;
    uint64_t v9 = v7;
    _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "node delete failed: %s", (uint8_t *)&v8, 0xCu);
  }
  return v5;
}

uint64_t *degas::NodeTable::deleteStatement(degas::NodeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x500;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable15deleteStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_8_4927;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9NodeTable15deleteStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"delete from ", 12);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" where identifier=?1", 20);
  operator new();
}

void sub_1D1796730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t degas::NodeTable::createTable(degas::NodeTable *this)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v11);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"create table ", 13);
  int v2 = *((char *)this + 31);
  if (v2 >= 0) {
    uint64_t v3 = (char *)this + 8;
  }
  else {
    uint64_t v3 = (char *)*((void *)this + 1);
  }
  if (v2 >= 0) {
    uint64_t v4 = *((unsigned __int8 *)this + 31);
  }
  else {
    uint64_t v4 = *((void *)this + 2);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)" (identifier integer primary key autoincrement, labels blob, edgesIn blob, edgesOut blob)", 89);
  uint64_t v5 = (sqlite3 *)*((void *)this + 4);
  std::stringbuf::str();
  degas::Statement::Statement(ppStmt, v5, (uint64_t)&__p);
  if (v9 < 0) {
    operator delete(__p);
  }
  uint64_t v6 = degas::Statement::update(ppStmt);
  degas::Statement::~Statement((degas::Statement *)ppStmt);
  v11[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v11 + *(void *)(v11[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v11[1] = MEMORY[0x1E4FBA470] + 16;
  if (v12 < 0) {
    operator delete((void *)v11[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1D25F9A50](&v13);
  return v6;
}

void sub_1D1796940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, char a19)
{
}

void degas::NodeTable::~NodeTable(degas::NodeTable *this)
{
  *(void *)this = &unk_1F2801DE0;
  *((void *)this + 4) = 0;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
  JUMPOUT(0x1D25F9A90);
}

{
  *(void *)this = &unk_1F2801DE0;
  *((void *)this + 4) = 0;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

{
  *(void *)this = &unk_1F2801DE0;
  *((void *)this + 4) = 0;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

void *degas::NodeTable::NodeTable(void *a1, uint64_t a2, long long *a3, char a4, char a5, uint64_t a6)
{
  __n128 result = degas::Table::Table(a1, a3, a2, a6);
  void *result = &unk_1F2802130;
  *((unsigned char *)result + 49) = a4;
  *((unsigned char *)result + 48) = a5;
  return result;
}

{
  void *result;

  __n128 result = degas::Table::Table(a1, a3, a2, a6);
  void *result = &unk_1F2802130;
  *((unsigned char *)result + 49) = a4;
  *((unsigned char *)result + 48) = a5;
  return result;
}

uint64_t *degas::NodeTable::insertStatement(degas::NodeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x300;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable15insertStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_4934;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9NodeTable15insertStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"insert into ", 12);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" (identifier, labels, edgesIn, edgesOut) values(?1, ?2, ?3, ?4)", 63);
  operator new();
}

void sub_1D1796DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::updateStatement(degas::NodeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x400;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable15updateStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_5_4937;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9NodeTable15updateStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"update ", 7);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" set edgesIn=?2, edgesOut=?3 where identifier=?1", 48);
  operator new();
}

void sub_1D1797054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::readByIdentifierStatement(degas::NodeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x600;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable25readByIdentifierStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_10_4940;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9NodeTable25readByIdentifierStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select identifier, labels, edgesIn, edgesOut from ", 50);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" where identifier=?1", 20);
  operator new();
}

void sub_1D1797300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::readByBitmapStatement(degas::NodeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x800;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable21readByBitmapStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_13;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9NodeTable21readByBitmapStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select n.identifier, n.labels, n.edgesIn, n.edgesOut from ", 58);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" n, identifierBitmap(?) b where n.identifier = b.value", 54);
  operator new();
}

void sub_1D17975AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::readByLabelStatement(degas::NodeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x801;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable20readByLabelStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_15;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9NodeTable20readByLabelStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select identifier, labels, edgesIn, edgesOut from ", 50);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" where bitmapContainsIdentifier(labels, ?1)", 43);
  operator new();
}

void sub_1D1797858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::readByAllLabelsStatement(degas::NodeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x802;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable24readByAllLabelsStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_17_4945;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9NodeTable24readByAllLabelsStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select identifier, labels, edgesIn, edgesOut from ", 50);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" where bitmapContainsBitmap(labels, ?1)", 39);
  operator new();
}

void sub_1D1797B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::readByAllLabelsAndIdentifiersStatement(degas::NodeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x803;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable38readByAllLabelsAndIdentifiersStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_19_4947;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9NodeTable38readByAllLabelsAndIdentifiersStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select n.identifier, n.labels, n.edgesIn, n.edgesOut from ", 58);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" n, identifierBitmap(?1) b where n.identifier = b.value and bitmapContainsBitmap(n.labels, ?2)", 94);
  operator new();
}

void sub_1D1797DB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::readByAnyLabelsStatement(degas::NodeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x804;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable24readByAnyLabelsStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_21;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9NodeTable24readByAnyLabelsStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select identifier, labels, edgesIn, edgesOut from ", 50);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" where bitmapOverlapsBitmap(labels, ?1)", 39);
  operator new();
}

void sub_1D179805C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::readByAnyLabelsAndIdentifiersStatement(degas::NodeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x805;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable38readByAnyLabelsAndIdentifiersStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_23_4950;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9NodeTable38readByAnyLabelsAndIdentifiersStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select n.identifier, n.labels, n.edgesIn, n.edgesOut from ", 58);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" n, identifierBitmap(?1) b where n.identifier = b.value and bitmapOverlapsBitmap(n.labels, ?2)", 94);
  operator new();
}

void sub_1D1798308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::readAllStatement(degas::NodeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x700;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable16readAllStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_25_4952;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9NodeTable16readAllStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select identifier, labels, edgesIn, edgesOut from ", 50);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" order by identifier", 20);
  operator new();
}

void sub_1D17985B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::readWhereNoEdgesStatement(degas::NodeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x806;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable25readWhereNoEdgesStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_27_4954;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9NodeTable25readWhereNoEdgesStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select n.identifier, n.labels, n.edgesIn, n.edgesOut from ", 58);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" n where not exists (select * from Edge e where e.sourceNodeId = n.identifier or e.targetNodeId = n.identifier)", 111);
  operator new();
}

void sub_1D1798860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::readWhereNoInEdgesStatement(degas::NodeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x807;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable27readWhereNoInEdgesStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_29_4956;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9NodeTable27readWhereNoInEdgesStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select n.identifier, n.labels, n.edgesIn, n.edgesOut from ", 58);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" n where not exists (select * from Edge e where e.targetNodeId = n.identifier)", 78);
  operator new();
}

void sub_1D1798B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::readWhereNoOutEdgesStatement(degas::NodeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x808;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas9NodeTable28readWhereNoOutEdgesStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_31_4958;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas9NodeTable28readWhereNoOutEdgesStatementEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v5);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)"select n.identifier, n.labels, n.edgesIn, n.edgesOut from ", 58);
  int v2 = *(char *)(v1 + 31);
  if (v2 >= 0) {
    uint64_t v3 = v1 + 8;
  }
  else {
    uint64_t v3 = *(void *)(v1 + 8);
  }
  if (v2 >= 0) {
    uint64_t v4 = *(unsigned __int8 *)(v1 + 31);
  }
  else {
    uint64_t v4 = *(void *)(v1 + 16);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, v3, v4);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v5, (uint64_t)" n where not exists (select * from Edge e where e.sourceNodeId = n.identifier)", 78);
  operator new();
}

void sub_1D1798DB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

uint64_t degas::NodeTable::insert(sqlite3 **this, sqlite3_int64 *a2, const degas::Bitmap *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  inserted = (degas::Statement **)degas::NodeTable::insertStatement((degas::NodeTable *)this);
  uint64_t v7 = *inserted;
  if (*a2) {
    degas::Statement::bindInteger((sqlite3_stmt **)v7, 1, *a2);
  }
  else {
    degas::Statement::bindNull((sqlite3_stmt **)v7, 1);
  }
  degas::Statement::bindBitmap(*inserted, (const Bitmap *)2, a3);
  long long v11 = 0u;
  memset(v12, 0, 25);
  degas::Statement::bindBitmap(*inserted, (const Bitmap *)3, (const degas::Bitmap *)&v11);
  degas::Statement::bindBitmap(*inserted, (const Bitmap *)4, (const degas::Bitmap *)&v11);
  uint64_t v8 = degas::Statement::update((sqlite3_stmt **)*inserted);
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      char v9 = sqlite3_errmsg(this[4]);
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v9;
      _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "node insert failed: %s", buf, 0xCu);
    }
  }
  else if (!*a2)
  {
    *a2 = sqlite3_last_insert_rowid(this[4]);
  }
  *(void *)buf = v12;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  return v8;
}

void sub_1D1798F68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void **a15)
{
  a15 = (void **)&a11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a15);
  _Unwind_Resume(a1);
}

uint64_t *degas::NodeTable::prepareStatementToReadByIdentifier(degas::NodeTable *this, sqlite3_int64 a2)
{
  uint64_t v3 = degas::NodeTable::readByIdentifierStatement(this);
  degas::Statement::bindInteger((sqlite3_stmt **)*v3, 1, a2);
  return v3;
}

uint64_t *degas::NodeTable::prepareStatementToReadByBitmap(degas::NodeTable *this, Bitmap *a2)
{
  uint64_t v3 = degas::NodeTable::readByBitmapStatement(this);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v3, 1, a2);
  return v3;
}

uint64_t *degas::NodeTable::prepareStatementToReadByLabel(degas::NodeTable *this, sqlite3_int64 a2)
{
  uint64_t v3 = degas::NodeTable::readByLabelStatement(this);
  degas::Statement::bindInteger((sqlite3_stmt **)*v3, 1, a2);
  return v3;
}

uint64_t *degas::NodeTable::prepareStatementToReadByAllLabels(degas::NodeTable *this, const degas::Bitmap *a2)
{
  uint64_t v3 = degas::NodeTable::readByAllLabelsStatement(this);
  degas::Statement::bindBitmap((degas::Statement *)*v3, (const Bitmap *)1, a2);
  return v3;
}

uint64_t *degas::NodeTable::prepareStatementToReadByAllLabelsAndIdentifiers(degas::NodeTable *this, const degas::Bitmap *a2, Bitmap *a3)
{
  uint64_t v5 = degas::NodeTable::readByAllLabelsAndIdentifiersStatement(this);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v5, 1, a3);
  degas::Statement::bindBitmap((degas::Statement *)*v5, (const Bitmap *)2, a2);
  return v5;
}

uint64_t *degas::NodeTable::prepareStatementToReadByAnyLabels(degas::NodeTable *this, const degas::Bitmap *a2)
{
  uint64_t v3 = degas::NodeTable::readByAnyLabelsStatement(this);
  degas::Statement::bindBitmap((degas::Statement *)*v3, (const Bitmap *)1, a2);
  return v3;
}

uint64_t *degas::NodeTable::prepareStatementToReadByAnyLabelsAndIdentifiers(degas::NodeTable *this, const degas::Bitmap *a2, Bitmap *a3)
{
  uint64_t v5 = degas::NodeTable::readByAnyLabelsAndIdentifiersStatement(this);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v5, 1, a3);
  degas::Statement::bindBitmap((degas::Statement *)*v5, (const Bitmap *)2, a2);
  return v5;
}

uint64_t degas::NodeTable::update(sqlite3 **this, sqlite3_int64 a2, const degas::Bitmap *a3, const degas::Bitmap *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  updated = degas::NodeTable::updateStatement((degas::NodeTable *)this);
  degas::Statement::bindInteger((sqlite3_stmt **)*updated, 1, a2);
  degas::Statement::bindBitmap((degas::Statement *)*updated, (const Bitmap *)2, a3);
  degas::Statement::bindBitmap((degas::Statement *)*updated, (const Bitmap *)3, a4);
  uint64_t v9 = degas::Statement::update((sqlite3_stmt **)*updated);
  if (v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v11 = sqlite3_errmsg(this[4]);
    int v12 = 136315138;
    uint64_t v13 = v11;
    _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "node update failed: %s", (uint8_t *)&v12, 0xCu);
  }
  return v9;
}

uint64_t degas::NodeTable::update(sqlite3 **this, sqlite3_int64 a2, const degas::LiteralBitmap *a3, const degas::LiteralBitmap *a4)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  updated = degas::NodeTable::updateStatement((degas::NodeTable *)this);
  degas::Statement::bindInteger((sqlite3_stmt **)*updated, 1, a2);
  degas::Statement::bindLiteralBitmap(*updated, 2, a3);
  degas::Statement::bindLiteralBitmap(*updated, 3, a4);
  uint64_t v9 = degas::Statement::update((sqlite3_stmt **)*updated);
  if (v9 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v11 = sqlite3_errmsg(this[4]);
    int v12 = 136315138;
    uint64_t v13 = v11;
    _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "node update failed: %s", (uint8_t *)&v12, 0xCu);
  }
  return v9;
}

void *degas::NodeCursor::NodeCursor(void *this)
{
  *this = 0;
  this[1] = 0;
  return this;
}

void degas::NodeCursor::setForSelectAll(degas::NodeCursor *this, const degas::NodeTable *a2)
{
  AllStatement = degas::NodeTable::readAllStatement(a2);
  uint64_t v5 = *AllStatement;
  uint64_t v4 = AllStatement[1];
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = (std::__shared_weak_count *)*((void *)this + 1);
  *(void *)this = v5;
  *((void *)this + 1) = v4;
  if (v6)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void degas::NodeCursor::setForIdentifier(degas::NodeCursor *this, sqlite3_int64 a2, const degas::NodeTable *a3)
{
  uint64_t v5 = degas::NodeTable::readByIdentifierStatement(a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v5, 1, a2);
  uint64_t v7 = (sqlite3_stmt **)*v5;
  uint64_t v6 = v5[1];
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v8 = (std::__shared_weak_count *)*((void *)this + 1);
  *(void *)this = v7;
  *((void *)this + 1) = v6;
  if (v8)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

void degas::NodeCursor::setForIdentifiers(degas::NodeCursor *this, Bitmap *a2, const degas::NodeTable *a3)
{
  uint64_t v5 = degas::NodeTable::readByBitmapStatement(a3);
  degas::Statement::bindBitmapPointer((sqlite3_stmt **)*v5, 1, a2);
  uint64_t v7 = (sqlite3_stmt **)*v5;
  uint64_t v6 = v5[1];
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v8 = (std::__shared_weak_count *)*((void *)this + 1);
  *(void *)this = v7;
  *((void *)this + 1) = v6;
  if (v8)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

void degas::NodeCursor::setForLabel(degas::NodeCursor *this, sqlite3_int64 a2, const degas::NodeTable *a3)
{
  uint64_t v5 = degas::NodeTable::readByLabelStatement(a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v5, 1, a2);
  uint64_t v7 = (sqlite3_stmt **)*v5;
  uint64_t v6 = v5[1];
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v8 = (std::__shared_weak_count *)*((void *)this + 1);
  *(void *)this = v7;
  *((void *)this + 1) = v6;
  if (v8)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

void degas::NodeCursor::setForAllLabels(degas::NodeCursor *this, const degas::Bitmap *a2, const degas::NodeTable *a3)
{
  uint64_t v5 = degas::NodeTable::readByAllLabelsStatement(a3);
  degas::Statement::bindBitmap((degas::Statement *)*v5, (const Bitmap *)1, a2);
  uint64_t v7 = (degas::Statement *)*v5;
  uint64_t v6 = v5[1];
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v8 = (std::__shared_weak_count *)*((void *)this + 1);
  *(void *)this = v7;
  *((void *)this + 1) = v6;
  if (v8)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

void degas::NodeCursor::setForAllLabelsAndIdentifiers(degas::NodeCursor *this, const degas::Bitmap *a2, Bitmap *a3, const degas::NodeTable *a4)
{
  uint64_t v5 = degas::NodeTable::prepareStatementToReadByAllLabelsAndIdentifiers(a4, a2, a3);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v8 = (std::__shared_weak_count *)*((void *)this + 1);
  *(void *)this = v7;
  *((void *)this + 1) = v6;
  if (v8)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

void degas::NodeCursor::setForAnyLabels(degas::NodeCursor *this, const degas::Bitmap *a2, const degas::NodeTable *a3)
{
  uint64_t v5 = degas::NodeTable::readByAnyLabelsStatement(a3);
  degas::Statement::bindBitmap((degas::Statement *)*v5, (const Bitmap *)1, a2);
  uint64_t v7 = (degas::Statement *)*v5;
  uint64_t v6 = v5[1];
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v8 = (std::__shared_weak_count *)*((void *)this + 1);
  *(void *)this = v7;
  *((void *)this + 1) = v6;
  if (v8)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

void degas::NodeCursor::setForAnyLabelsAndIdentifiers(degas::NodeCursor *this, const degas::Bitmap *a2, Bitmap *a3, const degas::NodeTable *a4)
{
  uint64_t v5 = degas::NodeTable::prepareStatementToReadByAnyLabelsAndIdentifiers(a4, a2, a3);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v8 = (std::__shared_weak_count *)*((void *)this + 1);
  *(void *)this = v7;
  *((void *)this + 1) = v6;
  if (v8)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

void degas::NodeCursor::setForNoEdges(degas::NodeCursor *this, const degas::NodeTable *a2)
{
  WhereNoEdgesStatement = degas::NodeTable::readWhereNoEdgesStatement(a2);
  uint64_t v5 = *WhereNoEdgesStatement;
  uint64_t v4 = WhereNoEdgesStatement[1];
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = (std::__shared_weak_count *)*((void *)this + 1);
  *(void *)this = v5;
  *((void *)this + 1) = v4;
  if (v6)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void degas::NodeCursor::setForNoInEdges(degas::NodeCursor *this, const degas::NodeTable *a2)
{
  WhereNoInEdgesStatement = degas::NodeTable::readWhereNoInEdgesStatement(a2);
  uint64_t v5 = *WhereNoInEdgesStatement;
  uint64_t v4 = WhereNoInEdgesStatement[1];
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = (std::__shared_weak_count *)*((void *)this + 1);
  *(void *)this = v5;
  *((void *)this + 1) = v4;
  if (v6)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

void degas::NodeCursor::setForNoOutEdges(degas::NodeCursor *this, const degas::NodeTable *a2)
{
  WhereNoOutEdgesStatement = degas::NodeTable::readWhereNoOutEdgesStatement(a2);
  uint64_t v5 = *WhereNoOutEdgesStatement;
  uint64_t v4 = WhereNoOutEdgesStatement[1];
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = (std::__shared_weak_count *)*((void *)this + 1);
  *(void *)this = v5;
  *((void *)this + 1) = v4;
  if (v6)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
}

sqlite3_int64 degas::NodeCursor::identifier(sqlite3_stmt ***this)
{
  return sqlite3_column_int64(**this, 0);
}

void degas::NodeCursor::labels(sqlite3_stmt ***this, degas::Bitmap *a2)
{
}

unsigned int *degas::NodeCursor::literalLabels(sqlite3_stmt ***this)
{
  return degas::Statement::literalBitmapColumnValue(*this, 1);
}

void degas::NodeCursor::edgesIn(sqlite3_stmt ***this, degas::Bitmap *a2)
{
}

unsigned int *degas::NodeCursor::literalEdgesIn(sqlite3_stmt ***this)
{
  return degas::Statement::literalBitmapColumnValue(*this, 2);
}

void degas::NodeCursor::edgesOut(sqlite3_stmt ***this, degas::Bitmap *a2)
{
}

unsigned int *degas::NodeCursor::literalEdgesOut(sqlite3_stmt ***this)
{
  return degas::Statement::literalBitmapColumnValue(*this, 3);
}

void sub_1D179A48C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

BOOL degas::callstack(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  memset(v18, 0, sizeof(v18));
  int v2 = backtrace((void **)v18, 30);
  if (v2 >= 1)
  {
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v14);
    if (v2 != 1)
    {
      uint64_t v3 = v2 - 1;
      uint64_t v4 = (const void **)v18 + 1;
      do
      {
        if (dladdr(*v4, &v13))
        {
          dli_sname = v13.dli_sname;
          if (v13.dli_sname)
          {
            int status = 0;
            uint64_t v6 = __cxa_demangle(v13.dli_sname, 0, 0, &status);
            if (status || (uint64_t v7 = v6) == 0)
            {
              size_t v9 = strlen(dli_sname);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)dli_sname, v9);
              char v17 = 10;
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)&v17, 1);
            }
            else
            {
              size_t v8 = strlen(v6);
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)v7, v8);
              char v17 = 10;
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)&v17, 1);
              free(v7);
            }
          }
          else
          {
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)"(redacted)\n", 11);
          }
        }
        ++v4;
        --v3;
      }
      while (v3);
    }
    std::ios_base::getloc((const std::ios_base *)((char *)v14 + *(void *)(v14[0] - 24)));
    uint64_t v10 = std::locale::use_facet((const std::locale *)&v13, MEMORY[0x1E4FBA258]);
    ((void (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 10);
    std::locale::~locale((std::locale *)&v13);
    std::ostream::put();
    std::ostream::flush();
    std::stringbuf::str();
    if (*(char *)(a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
    *(_OWORD *)a1 = *(_OWORD *)&v13.dli_fname;
    *(void *)(a1 + 16) = v13.dli_sname;
    v14[0] = *MEMORY[0x1E4FBA418];
    *(void *)((char *)v14 + *(void *)(v14[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
    v14[1] = MEMORY[0x1E4FBA470] + 16;
    if (v15 < 0) {
      operator delete((void *)v14[9]);
    }
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x1D25F9A50](&v16);
  }
  return v2 > 0;
}

void sub_1D179CA40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::locale a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

uint64_t degas::DegasLoggingConnection(degas *this)
{
  if (degas::DegasLoggingConnection(void)::onceToken[0] != -1) {
    dispatch_once(degas::DegasLoggingConnection(void)::onceToken, &__block_literal_global_5277);
  }
  return degas::DegasLoggingConnection(void)::log;
}

os_log_t ___ZN5degas22DegasLoggingConnectionEv_block_invoke()
{
  os_log_t result = os_log_create("com.apple.photos.graph", "KnowledgeGraphDatabase");
  degas::DegasLoggingConnection(void)::log = (uint64_t)result;
  return result;
}

_DWORD *degas::LocalLogFile::LocalLogFile(_DWORD *a1, long long *a2)
{
  *a1 = -1;
  uint64_t v3 = (std::string *)(a1 + 2);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v3, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    v3->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&v3->__r_.__value_.__l.__data_ = v4;
  }
  return a1;
}

{
  std::string *v3;
  long long v4;

  *a1 = -1;
  uint64_t v3 = (std::string *)(a1 + 2);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v3, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    v3->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&v3->__r_.__value_.__l.__data_ = v4;
  }
  return a1;
}

void degas::LocalLogFile::open(degas::LocalLogFile *this)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  std::__fs::filesystem::__temp_directory_path(&v24, 0);
  if (*((char *)this + 31) < 0)
  {
    if (!*((void *)this + 2)) {
      goto LABEL_9;
    }
    int v2 = (unsigned char *)*((void *)this + 1);
  }
  else
  {
    int v2 = (char *)this + 8;
    if (!*((unsigned char *)this + 31)) {
      goto LABEL_9;
    }
  }
  if (*v2 == 47)
  {
    if (SHIBYTE(v24.__pn_.__r_.__value_.__r.__words[2]) < 0)
    {
      *v24.__pn_.__r_.__value_.__l.__data_ = 0;
      v24.__pn_.__r_.__value_.__l.__size_ = 0;
    }
    else
    {
      v24.__pn_.__r_.__value_.__s.__data_[0] = 0;
      *((unsigned char *)&v24.__pn_.__r_.__value_.__s + 23) = 0;
    }
    goto LABEL_12;
  }
LABEL_9:
  if (std::__fs::filesystem::path::__filename(&v24).__size_) {
    std::string::push_back(&v24.__pn_, 47);
  }
LABEL_12:
  int v3 = *((char *)this + 31);
  if (v3 >= 0) {
    long long v4 = (std::__fs::filesystem::path *)((char *)this + 8);
  }
  else {
    long long v4 = (std::__fs::filesystem::path *)*((void *)this + 1);
  }
  if (v3 >= 0) {
    unint64_t v5 = *((unsigned __int8 *)this + 31);
  }
  else {
    unint64_t v5 = *((void *)this + 2);
  }
  char v6 = HIBYTE(v24.__pn_.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v24.__pn_.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!v5) {
      goto LABEL_51;
    }
    std::string::size_type size = v24.__pn_.__r_.__value_.__l.__size_;
    std::string::size_type v9 = (v24.__pn_.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
    size_t v8 = (std::__fs::filesystem::path *)v24.__pn_.__r_.__value_.__r.__words[0];
    char v6 = HIBYTE(v24.__pn_.__r_.__value_.__r.__words[2]);
  }
  else
  {
    if (!v5) {
      goto LABEL_49;
    }
    std::string::size_type size = HIBYTE(v24.__pn_.__r_.__value_.__r.__words[2]);
    size_t v8 = &v24;
    std::string::size_type v9 = 22;
  }
  if (v8 > v4 || (std::__fs::filesystem::path *)((char *)&v8->__pn_.__r_.__value_.__l.__data_ + size + 1) <= v4)
  {
    if (v9 - size < v5)
    {
      std::string::__grow_by(&v24.__pn_, v9, size - v9 + v5, size, size, 0, 0);
      v24.__pn_.__r_.__value_.__l.__size_ = size;
      char v6 = HIBYTE(v24.__pn_.__r_.__value_.__r.__words[2]);
    }
    BOOL v11 = v6 < 0;
    int v12 = &v24;
    if (v11) {
      int v12 = (std::__fs::filesystem::path *)v24.__pn_.__r_.__value_.__r.__words[0];
    }
    Dl_info v13 = (char *)v12 + size;
    unint64_t v14 = v5;
    do
    {
      std::string::value_type v15 = v4->__pn_.__r_.__value_.__s.__data_[0];
      long long v4 = (std::__fs::filesystem::path *)((char *)v4 + 1);
      *v13++ = v15;
      --v14;
    }
    while (v14);
    std::string::value_type *v13 = 0;
    if (SHIBYTE(v24.__pn_.__r_.__value_.__r.__words[2]) < 0)
    {
      v24.__pn_.__r_.__value_.__l.__size_ = v5 + size;
      goto LABEL_51;
    }
    *((unsigned char *)&v24.__pn_.__r_.__value_.__s + 23) = (v5 + size) & 0x7F;
LABEL_49:
    unsigned int v21 = &v24;
    goto LABEL_52;
  }
  if (v5 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v5 > 0x16)
  {
    uint64_t v16 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17) {
      uint64_t v16 = v5 | 7;
    }
    uint64_t v17 = v16 + 1;
    p_p = (std::string::value_type *)operator new(v16 + 1);
    *((void *)&__p + 1) = v5;
    int64_t v26 = v17 | 0x8000000000000000;
    *(void *)&long long __p = p_p;
  }
  else
  {
    HIBYTE(v26) = v5;
    p_p = (std::string::value_type *)&__p;
  }
  do
  {
    std::string::value_type v18 = v4->__pn_.__r_.__value_.__s.__data_[0];
    long long v4 = (std::__fs::filesystem::path *)((char *)v4 + 1);
    *p_p++ = v18;
    --v5;
  }
  while (v5);
  std::string::value_type *p_p = 0;
  if (v26 >= 0) {
    uint64_t v19 = (const std::string::value_type *)&__p;
  }
  else {
    uint64_t v19 = (const std::string::value_type *)__p;
  }
  if (v26 >= 0) {
    std::string::size_type v20 = HIBYTE(v26);
  }
  else {
    std::string::size_type v20 = *((void *)&__p + 1);
  }
  std::string::append(&v24.__pn_, v19, v20);
  if (SHIBYTE(v26) < 0) {
    operator delete((void *)__p);
  }
  if ((SHIBYTE(v24.__pn_.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
    goto LABEL_49;
  }
LABEL_51:
  unsigned int v21 = (std::__fs::filesystem::path *)v24.__pn_.__r_.__value_.__r.__words[0];
LABEL_52:
  *(_DWORD *)this = open((const char *)v21, 513, 438);
  if (degas::DegasLoggingConnection(void)::onceToken[0] != -1) {
    dispatch_once(degas::DegasLoggingConnection(void)::onceToken, &__block_literal_global_5277);
  }
  unsigned int v22 = degas::DegasLoggingConnection(void)::log;
  if (os_log_type_enabled((os_log_t)degas::DegasLoggingConnection(void)::log, OS_LOG_TYPE_INFO))
  {
    uint64_t v23 = &v24;
    if ((v24.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      uint64_t v23 = (std::__fs::filesystem::path *)v24.__pn_.__r_.__value_.__r.__words[0];
    }
    LODWORD(__p) = 136315138;
    *(void *)((char *)&__p + 4) = v23;
    _os_log_impl(&dword_1D1654000, v22, OS_LOG_TYPE_INFO, "local log file open at %s\n", (uint8_t *)&__p, 0xCu);
  }
  if (SHIBYTE(v24.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__pn_.__r_.__value_.__l.__data_);
  }
}

void sub_1D179CEAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t degas::LocalLogFile::writeText(degas::LocalLogFile *this, const void **a2)
{
  int v4 = *(_DWORD *)this;
  if (v4 <= 0)
  {
    degas::LocalLogFile::open(this);
    int v4 = *(_DWORD *)this;
  }
  int v5 = *((char *)a2 + 23);
  if (v5 >= 0) {
    char v6 = a2;
  }
  else {
    char v6 = *a2;
  }
  if (v5 >= 0) {
    size_t v7 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v7 = (size_t)a2[1];
  }
  write(v4, v6, v7);
  int v8 = *(_DWORD *)this;
  return fsync(v8);
}

uint64_t degas::LocalLogFile::close(degas::LocalLogFile *this)
{
  uint64_t result = *(unsigned int *)this;
  if ((int)result >= 1)
  {
    uint64_t result = close(result);
    *(_DWORD *)this = -1;
  }
  return result;
}

void *degas::YesNodePredicate::debugDescription@<X0>(void *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "yes(node)");
}

uint64_t degas::YesNodePredicate::isTrivialNo(degas::YesNodePredicate *this)
{
  return 0;
}

uint64_t degas::YesNodePredicate::isTrivialYes(degas::YesNodePredicate *this)
{
  return 1;
}

uint64_t degas::YesNodePredicate::allLabelIds(degas::YesNodePredicate *this, Bitmap *a2)
{
  return 0;
}

void degas::YesNodePredicate::decomposeLabelsPredicate(void *a1@<X1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  uint64_t v2 = a1[1];
  a2[2] = *a1;
  a2[3] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
}

uint64_t degas::YesNodePredicate::filterElements(degas::YesNodePredicate *this, const degas::Bitmap *a2, degas::Bitmap *a3)
{
  degas::Bitmap::operator=(a3, a2);
  return 0;
}

uint64_t degas::YesNodePredicate::elements(degas::YesNodePredicate *this, degas::Bitmap *a2)
{
  uint64_t v2 = *((void *)this + 1);
  v4[0] = (const degas::NodeTable *)(v2 + 192);
  v4[1] = (const degas::NodeTable *)v2;
  return degas::NodeLabelQuery::allNodes(v4, a2);
}

void degas::YesNodePredicate::~YesNodePredicate(degas::YesNodePredicate *this)
{
}

void *degas::YesEdgePredicate::debugDescription@<X0>(void *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "yes(edge)");
}

uint64_t degas::YesEdgePredicate::isTrivialNo(degas::YesEdgePredicate *this)
{
  return 0;
}

uint64_t degas::YesEdgePredicate::isTrivialYes(degas::YesEdgePredicate *this)
{
  return 1;
}

uint64_t degas::YesEdgePredicate::allLabelIds(degas::YesEdgePredicate *this, Bitmap *a2)
{
  return 0;
}

void degas::YesEdgePredicate::decomposeLabelsPredicate(void *a1@<X1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  uint64_t v2 = a1[1];
  a2[2] = *a1;
  a2[3] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
}

uint64_t degas::YesEdgePredicate::filterElements(degas::YesEdgePredicate *this, const degas::Bitmap *a2, degas::Bitmap *a3)
{
  degas::Bitmap::operator=(a3, a2);
  return 0;
}

uint64_t degas::YesEdgePredicate::elements(degas::YesEdgePredicate *this, degas::Bitmap *a2)
{
  uint64_t v2 = *((void *)this + 1);
  v4[0] = (const degas::EdgeTable *)(v2 + 248);
  v4[1] = (const degas::EdgeTable *)v2;
  return degas::EdgeLabelQuery::allEdges(v4, a2);
}

void degas::YesEdgePredicate::~YesEdgePredicate(degas::YesEdgePredicate *this)
{
}

void *degas::NoPredicate::debugDescription@<X0>(void *a1@<X8>)
{
  return std::string::basic_string[abi:ne180100]<0>(a1, "no");
}

uint64_t degas::NoPredicate::isTrivialNo(degas::NoPredicate *this)
{
  return 1;
}

uint64_t degas::NoPredicate::isTrivialYes(degas::NoPredicate *this)
{
  return 0;
}

uint64_t degas::NoPredicate::allLabelIds(degas::NoPredicate *this, Bitmap *a2)
{
  return 0;
}

void degas::NoPredicate::decomposeLabelsPredicate(void *a1@<X1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  uint64_t v2 = a1[1];
  a2[2] = *a1;
  a2[3] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
}

uint64_t degas::NoPredicate::filterElements(degas::NoPredicate *this, const Bitmap *a2, Bitmap *a3)
{
  a3->_bitCount = 0;
  a3->_lastOffsetFoundAt = 0;
  begin = a3->_bitSets.__begin_;
  for (uint64_t i = a3->_bitSets.__end_; i != begin; uint64_t i = (BitsetPtr *)((char *)i - 16))
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)((char *)i - 16));
    *((void *)i - 1) = 0;
  }
  a3->_bitSets.__end_ = begin;
  return 0;
}

uint64_t degas::NoPredicate::elements(degas::NoPredicate *this, Bitmap *a2)
{
  a2->_bitCount = 0;
  a2->_lastOffsetFoundAt = 0;
  begin = a2->_bitSets.__begin_;
  for (uint64_t i = a2->_bitSets.__end_; i != begin; uint64_t i = (BitsetPtr *)((char *)i - 16))
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)((char *)i - 16));
    *((void *)i - 1) = 0;
  }
  a2->_bitSets.__end_ = begin;
  return 0;
}

void degas::NoPredicate::~NoPredicate(degas::NoPredicate *this)
{
}

uint64_t degas::AllLabelsNodePredicate::debugDescription(degas::AllLabelsNodePredicate *this, const degas::Database *a2)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v17);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"all these labels:(", 18);
  degas::Bitmap::begin((void *)this + 1, &v14);
  uint64_t v3 = *((void *)this + 4);
  for (char i = 1; ; char i = 0)
  {
    sqlite3_int64 v5 = v15;
    BOOL v6 = (degas::AllLabelsNodePredicate *)v14 == (degas::AllLabelsNodePredicate *)((char *)this + 8) && v15 == -1;
    if (v6 && v16 == v3) {
      break;
    }
    if ((i & 1) == 0)
    {
      LOBYTE(__p) = 44;
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)&__p, 1);
    }
    long long __p = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    degas::Database::getLabelName(*((void *)this + 8), v5, (uint64_t)&__p);
    if (v13 >= 0) {
      p_p = &__p;
    }
    else {
      p_p = __p;
    }
    if (v13 >= 0) {
      uint64_t v9 = HIBYTE(v13);
    }
    else {
      uint64_t v9 = v12;
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)p_p, v9);
    if (SHIBYTE(v13) < 0) {
      operator delete(__p);
    }
    degas::Bitmap::iterator::operator++(&v14);
  }
  LOBYTE(v14) = 41;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)&v14, 1);
  std::stringbuf::str();
  v17[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v17 + *(void *)(v17[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v17[1] = MEMORY[0x1E4FBA470] + 16;
  if (v18 < 0) {
    operator delete((void *)v17[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1D25F9A50](&v19);
}

void sub_1D179D410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

uint64_t degas::AllLabelsNodePredicate::isTrivialNo(degas::AllLabelsNodePredicate *this)
{
  return 0;
}

uint64_t degas::AllLabelsNodePredicate::isTrivialYes(degas::AllLabelsNodePredicate *this)
{
  return 0;
}

uint64_t degas::AllLabelsNodePredicate::allLabelIds(degas::AllLabelsNodePredicate *this, degas::Bitmap *a2)
{
  degas::Bitmap::operator=(a2, (void *)this + 1);
  return 1;
}

void degas::AllLabelsNodePredicate::decomposeLabelsPredicate(void *a1@<X1>, void *a2@<X8>)
{
  uint64_t v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  a2[2] = 0;
  a2[3] = 0;
}

uint64_t degas::AllLabelsNodePredicate::filterElements(degas::AllLabelsNodePredicate *this, const degas::Bitmap *a2, degas::Bitmap *a3)
{
  long long v4 = *(_OWORD *)((char *)this + 56);
  return degas::NodeLabelQuery::filterNodesForAllLabels((const degas::NodeTable **)&v4, (Bitmap *)((char *)this + 8), a2, a3);
}

uint64_t degas::AllLabelsNodePredicate::elements(degas::AllLabelsNodePredicate *this, degas::Bitmap *a2)
{
  long long v3 = *(_OWORD *)((char *)this + 56);
  return degas::NodeLabelQuery::nodesForAllLabels((const degas::NodeTable **)&v3, (degas::AllLabelsNodePredicate *)((char *)this + 8), a2, 0);
}

void degas::AllLabelsNodePredicate::~AllLabelsNodePredicate(degas::AllLabelsNodePredicate *this)
{
  *(void *)this = &unk_1F28022A0;
  uint64_t v1 = (void **)((char *)this + 24);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1D25F9A90);
}

{
  void **v1;

  *(void *)this = &unk_1F28022A0;
  uint64_t v1 = (void **)((char *)this + 24);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
}

uint64_t degas::AnyLabelsNodePredicate::debugDescription(degas::AnyLabelsNodePredicate *this, const degas::Database *a2)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v17);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"any of these labels:(", 21);
  degas::Bitmap::begin((void *)this + 1, &v14);
  uint64_t v3 = *((void *)this + 4);
  for (char i = 1; ; char i = 0)
  {
    sqlite3_int64 v5 = v15;
    BOOL v6 = (degas::AnyLabelsNodePredicate *)v14 == (degas::AnyLabelsNodePredicate *)((char *)this + 8) && v15 == -1;
    if (v6 && v16 == v3) {
      break;
    }
    if ((i & 1) == 0)
    {
      LOBYTE(__p) = 44;
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)&__p, 1);
    }
    long long __p = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    degas::Database::getLabelName(*((void *)this + 8), v5, (uint64_t)&__p);
    if (v13 >= 0) {
      p_p = &__p;
    }
    else {
      p_p = __p;
    }
    if (v13 >= 0) {
      uint64_t v9 = HIBYTE(v13);
    }
    else {
      uint64_t v9 = v12;
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)p_p, v9);
    if (SHIBYTE(v13) < 0) {
      operator delete(__p);
    }
    degas::Bitmap::iterator::operator++(&v14);
  }
  LOBYTE(v14) = 41;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)&v14, 1);
  std::stringbuf::str();
  v17[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v17 + *(void *)(v17[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v17[1] = MEMORY[0x1E4FBA470] + 16;
  if (v18 < 0) {
    operator delete((void *)v17[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1D25F9A50](&v19);
}

void sub_1D179D7E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

uint64_t degas::AnyLabelsNodePredicate::isTrivialNo(degas::AnyLabelsNodePredicate *this)
{
  return 0;
}

uint64_t degas::AnyLabelsNodePredicate::isTrivialYes(degas::AnyLabelsNodePredicate *this)
{
  return 0;
}

uint64_t degas::AnyLabelsNodePredicate::allLabelIds(degas::AnyLabelsNodePredicate *this, Bitmap *a2)
{
  return 0;
}

void degas::AnyLabelsNodePredicate::decomposeLabelsPredicate(void *a1@<X1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  uint64_t v2 = a1[1];
  a2[2] = *a1;
  a2[3] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
}

uint64_t degas::AnyLabelsNodePredicate::filterElements(degas::AnyLabelsNodePredicate *this, const degas::Bitmap *a2, degas::Bitmap *a3)
{
  long long v4 = *(_OWORD *)((char *)this + 56);
  return degas::NodeLabelQuery::filterNodesForAnyLabels((const degas::NodeTable **)&v4, (Bitmap *)((char *)this + 8), a2, a3);
}

uint64_t degas::AnyLabelsNodePredicate::elements(degas::AnyLabelsNodePredicate *this, degas::Bitmap *a2)
{
  long long v3 = *(_OWORD *)((char *)this + 56);
  return degas::NodeLabelQuery::nodesForAnyLabels((const degas::NodeTable **)&v3, (Bitmap *)((char *)this + 8), a2);
}

void degas::AnyLabelsNodePredicate::~AnyLabelsNodePredicate(degas::AnyLabelsNodePredicate *this)
{
  *(void *)this = &unk_1F28022F8;
  uint64_t v1 = (void **)((char *)this + 24);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1D25F9A90);
}

{
  void **v1;

  *(void *)this = &unk_1F28022F8;
  uint64_t v1 = (void **)((char *)this + 24);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
}

uint64_t degas::AllLabelsEdgePredicate::debugDescription(degas::AllLabelsEdgePredicate *this, const degas::Database *a2)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v17);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"all these labels:(", 18);
  degas::Bitmap::begin((void *)this + 1, &v14);
  uint64_t v3 = *((void *)this + 4);
  for (char i = 1; ; char i = 0)
  {
    sqlite3_int64 v5 = v15;
    BOOL v6 = (degas::AllLabelsEdgePredicate *)v14 == (degas::AllLabelsEdgePredicate *)((char *)this + 8) && v15 == -1;
    if (v6 && v16 == v3) {
      break;
    }
    if ((i & 1) == 0)
    {
      LOBYTE(__p) = 44;
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)&__p, 1);
    }
    long long __p = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    degas::Database::getLabelName(*((void *)this + 8), v5, (uint64_t)&__p);
    if (v13 >= 0) {
      p_p = &__p;
    }
    else {
      p_p = __p;
    }
    if (v13 >= 0) {
      uint64_t v9 = HIBYTE(v13);
    }
    else {
      uint64_t v9 = v12;
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)p_p, v9);
    if (SHIBYTE(v13) < 0) {
      operator delete(__p);
    }
    degas::Bitmap::iterator::operator++(&v14);
  }
  LOBYTE(v14) = 41;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)&v14, 1);
  std::stringbuf::str();
  v17[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v17 + *(void *)(v17[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v17[1] = MEMORY[0x1E4FBA470] + 16;
  if (v18 < 0) {
    operator delete((void *)v17[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1D25F9A50](&v19);
}

void sub_1D179DB9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

uint64_t degas::AllLabelsEdgePredicate::isTrivialNo(degas::AllLabelsEdgePredicate *this)
{
  return 0;
}

uint64_t degas::AllLabelsEdgePredicate::isTrivialYes(degas::AllLabelsEdgePredicate *this)
{
  return 0;
}

uint64_t degas::AllLabelsEdgePredicate::allLabelIds(degas::AllLabelsEdgePredicate *this, degas::Bitmap *a2)
{
  degas::Bitmap::operator=(a2, (void *)this + 1);
  return 1;
}

void degas::AllLabelsEdgePredicate::decomposeLabelsPredicate(void *a1@<X1>, void *a2@<X8>)
{
  uint64_t v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  a2[2] = 0;
  a2[3] = 0;
}

uint64_t degas::AllLabelsEdgePredicate::filterElements(degas::AllLabelsEdgePredicate *this, const degas::Bitmap *a2, degas::Bitmap *a3)
{
  long long v4 = *(_OWORD *)((char *)this + 56);
  return degas::EdgeLabelQuery::filterEdgesForAllLabels((const degas::EdgeTable **)&v4, (Bitmap *)((char *)this + 8), a2, a3);
}

uint64_t degas::AllLabelsEdgePredicate::elements(degas::AllLabelsEdgePredicate *this, degas::Bitmap *a2)
{
  long long v3 = *(_OWORD *)((char *)this + 56);
  return degas::EdgeLabelQuery::edgesForAllLabels((const degas::EdgeTable **)&v3, (degas::AllLabelsEdgePredicate *)((char *)this + 8), a2, 0);
}

void degas::AllLabelsEdgePredicate::~AllLabelsEdgePredicate(degas::AllLabelsEdgePredicate *this)
{
  *(void *)this = &unk_1F2802350;
  uint64_t v1 = (void **)((char *)this + 24);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1D25F9A90);
}

{
  void **v1;

  *(void *)this = &unk_1F2802350;
  uint64_t v1 = (void **)((char *)this + 24);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
}

uint64_t degas::AnyLabelsEdgePredicate::debugDescription(degas::AnyLabelsEdgePredicate *this, const degas::Database *a2)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v17);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"any of these labels:(", 21);
  degas::Bitmap::begin((void *)this + 1, &v14);
  uint64_t v3 = *((void *)this + 4);
  for (char i = 1; ; char i = 0)
  {
    sqlite3_int64 v5 = v15;
    BOOL v6 = (degas::AnyLabelsEdgePredicate *)v14 == (degas::AnyLabelsEdgePredicate *)((char *)this + 8) && v15 == -1;
    if (v6 && v16 == v3) {
      break;
    }
    if ((i & 1) == 0)
    {
      LOBYTE(__p) = 44;
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)&__p, 1);
    }
    long long __p = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    degas::Database::getLabelName(*((void *)this + 8), v5, (uint64_t)&__p);
    if (v13 >= 0) {
      p_p = &__p;
    }
    else {
      p_p = __p;
    }
    if (v13 >= 0) {
      uint64_t v9 = HIBYTE(v13);
    }
    else {
      uint64_t v9 = v12;
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)p_p, v9);
    if (SHIBYTE(v13) < 0) {
      operator delete(__p);
    }
    degas::Bitmap::iterator::operator++(&v14);
  }
  LOBYTE(v14) = 41;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)&v14, 1);
  std::stringbuf::str();
  v17[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v17 + *(void *)(v17[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v17[1] = MEMORY[0x1E4FBA470] + 16;
  if (v18 < 0) {
    operator delete((void *)v17[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1D25F9A50](&v19);
}

void sub_1D179DF74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
}

uint64_t degas::AnyLabelsEdgePredicate::isTrivialNo(degas::AnyLabelsEdgePredicate *this)
{
  return 0;
}

uint64_t degas::AnyLabelsEdgePredicate::isTrivialYes(degas::AnyLabelsEdgePredicate *this)
{
  return 0;
}

uint64_t degas::AnyLabelsEdgePredicate::allLabelIds(degas::AnyLabelsEdgePredicate *this, Bitmap *a2)
{
  return 0;
}

void degas::AnyLabelsEdgePredicate::decomposeLabelsPredicate(void *a1@<X1>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  uint64_t v2 = a1[1];
  a2[2] = *a1;
  a2[3] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
}

uint64_t degas::AnyLabelsEdgePredicate::filterElements(degas::AnyLabelsEdgePredicate *this, const degas::Bitmap *a2, degas::Bitmap *a3)
{
  long long v4 = *(_OWORD *)((char *)this + 56);
  return degas::EdgeLabelQuery::filterEdgesForAnyLabels((const degas::EdgeTable **)&v4, (Bitmap *)((char *)this + 8), a2, a3);
}

uint64_t degas::AnyLabelsEdgePredicate::elements(degas::AnyLabelsEdgePredicate *this, degas::Bitmap *a2)
{
  long long v3 = *(_OWORD *)((char *)this + 56);
  return degas::EdgeLabelQuery::edgesForAnyLabels((const degas::EdgeTable **)&v3, (Bitmap *)((char *)this + 8), a2);
}

void degas::AnyLabelsEdgePredicate::~AnyLabelsEdgePredicate(degas::AnyLabelsEdgePredicate *this)
{
  *(void *)this = &unk_1F28023A8;
  uint64_t v1 = (void **)((char *)this + 24);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1D25F9A90);
}

{
  void **v1;

  *(void *)this = &unk_1F28023A8;
  uint64_t v1 = (void **)((char *)this + 24);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
}

uint64_t degas::IntersectPredicate::debugDescription(degas::IntersectPredicate *this, const degas::Database *a2)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v14);
  LOBYTE(__p[0]) = 40;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)__p, 1);
  long long v4 = (uint64_t *)*((void *)this + 1);
  sqlite3_int64 v5 = (uint64_t *)*((void *)this + 2);
  if (v4 != v5)
  {
    char v6 = 1;
    while (1)
    {
      uint64_t v8 = *v4;
      size_t v7 = (std::__shared_weak_count *)v4[1];
      if (v7) {
        atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if ((v6 & 1) == 0) {
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)" and ", 5);
      }
      (*(void (**)(void **__return_ptr, uint64_t, const degas::Database *))(*(void *)v8 + 64))(__p, v8, a2);
      uint64_t v9 = (v13 & 0x80u) == 0 ? __p : (void **)__p[0];
      uint64_t v10 = (v13 & 0x80u) == 0 ? (void *)v13 : __p[1];
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)v9, (uint64_t)v10);
      if ((char)v13 < 0) {
        break;
      }
      if (v7) {
        goto LABEL_15;
      }
LABEL_16:
      char v6 = 0;
      v4 += 2;
      if (v4 == v5) {
        goto LABEL_20;
      }
    }
    operator delete(__p[0]);
    if (!v7) {
      goto LABEL_16;
    }
LABEL_15:
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    goto LABEL_16;
  }
LABEL_20:
  LOBYTE(__p[0]) = 41;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)__p, 1);
  std::stringbuf::str();
  v14[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v14 + *(void *)(v14[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v14[1] = MEMORY[0x1E4FBA470] + 16;
  if (v15 < 0) {
    operator delete((void *)v14[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1D25F9A50](&v16);
}

void sub_1D179E35C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
}

uint64_t degas::IntersectPredicate::isTrivialNo(degas::IntersectPredicate *this)
{
  uint64_t v1 = (uint64_t *)*((void *)this + 1);
  uint64_t v2 = (uint64_t *)*((void *)this + 2);
  if (v1 == v2) {
    return 0;
  }
  do
  {
    uint64_t v3 = *v1;
    long long v4 = (std::__shared_weak_count *)v1[1];
    if (v4) {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 56))(v3);
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    v1 += 2;
    if (v1 == v2) {
      int v6 = 1;
    }
    else {
      int v6 = v5;
    }
  }
  while (v6 != 1);
  return v5;
}

void sub_1D179E444(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t degas::IntersectPredicate::isTrivialYes(degas::IntersectPredicate *this)
{
  uint64_t v1 = (uint64_t *)*((void *)this + 1);
  uint64_t v2 = (uint64_t *)*((void *)this + 2);
  if (v1 == v2) {
    return 1;
  }
  do
  {
    uint64_t v3 = *v1;
    long long v4 = (std::__shared_weak_count *)v1[1];
    if (v4) {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 48))(v3);
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    v1 += 2;
    if (v1 == v2) {
      char v6 = 0;
    }
    else {
      char v6 = v5;
    }
  }
  while ((v6 & 1) != 0);
  return v5;
}

void sub_1D179E4F8(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t degas::IntersectPredicate::allLabelIds(degas::IntersectPredicate *this, Bitmap *a2)
{
  return 0;
}

void degas::IntersectPredicate::decomposeLabelsPredicate(uint64_t a1@<X0>, char **a2@<X1>, char **a3@<X8>)
{
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  if (v5 == v6)
  {
LABEL_12:
    *a3 = 0;
    a3[1] = 0;
    BOOL v11 = a2[1];
    a3[2] = *a2;
    a3[3] = v11;
    if (v11) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)v11 + 1, 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    while (1)
    {
      uint64_t v8 = *(void ***)v5;
      uint64_t v28 = *(std::__shared_weak_count ***)v5;
      uint64_t v9 = *(std::__shared_weak_count **)(v5 + 8);
      uint64_t v29 = v9;
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      (*((void (**)(std::__shared_weak_count **__return_ptr))*v8 + 4))(&v24);
      uint64_t v10 = (char *)v24;
      if (v24) {
        break;
      }
      if (v27) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v27);
      }
      if (v25) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v25);
      }
      if (v29) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v29);
      }
      v5 += 16;
      if (v5 == v6) {
        goto LABEL_12;
      }
    }
    uint64_t v12 = v25;
    if (v25) {
      atomic_fetch_add_explicit(&v25->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v14 = v26;
    unsigned __int8 v13 = v27;
    if (v27) {
      atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v30 = v14;
    uint64_t v31 = v13;
    uint64_t v16 = (void **)v28;
    char v15 = v29;
    if (v29) {
      atomic_fetch_add_explicit(&v29->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (v27) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v27);
    }
    if (v25) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v25);
    }
    if (v29) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v29);
    }
    std::__fs::filesystem::path v24 = 0;
    unint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v17 = *(void ****)(a1 + 8);
    char v18 = *(void ****)(a1 + 16);
    if (v17 == v18)
    {
      uint64_t v28 = 0;
      uint64_t v29 = 0;
    }
    else
    {
      do
      {
        uint64_t v19 = *v17;
        uint64_t v28 = (std::__shared_weak_count **)*v17;
        std::string::size_type v20 = (std::__shared_weak_count *)v17[1];
        uint64_t v29 = v20;
        if (v20) {
          atomic_fetch_add_explicit(&v20->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        if (v19 != v16 || v14 != 0)
        {
          if (v19 == v16) {
            unsigned int v22 = (long long *)&v30;
          }
          else {
            unsigned int v22 = (long long *)&v28;
          }
          std::vector<std::shared_ptr<degas::Predicate>>::push_back[abi:ne180100]((char **)&v24, v22);
        }
        if (v20) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v20);
        }
        v17 += 2;
      }
      while (v17 != v18);
      uint64_t v28 = 0;
      uint64_t v29 = 0;
      if (v25 != v24) {
        operator new();
      }
    }
    *a3 = v10;
    a3[1] = (char *)v12;
    if (v12) {
      atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v23 = v29;
    a3[2] = (char *)v28;
    a3[3] = (char *)v23;
    if (v23)
    {
      atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
      std::__shared_weak_count::__release_shared[abi:ne180100](v23);
    }
    uint64_t v28 = &v24;
    std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v28);
    if (v15) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v15);
    }
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
  }
}

void sub_1D179E7D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10, std::__shared_weak_count *a11, std::__shared_weak_count *a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, void **a17)
{
  MEMORY[0x1D25F9A90](v17, 0xA1C4030951706);
  a17 = (void **)&a13;
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&a17);
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a11);
  }
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(a1);
}

void *std::vector<std::shared_ptr<degas::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::Predicate>*,std::shared_ptr<degas::Predicate>*>(void *result, void *a2, void *a3, unint64_t a4)
{
  if (a4)
  {
    if (a4 >> 60) {
      std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v6 = result;
    uint64_t result = std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<degas::Predicate>>>(a4);
    void *v6 = result;
    v6[1] = result;
    for (v6[2] = &result[2 * v7]; a2 != a3; a2 += 2)
    {
      void *result = *a2;
      uint64_t v8 = a2[1];
      result[1] = v8;
      if (v8) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
      }
      result += 2;
    }
    v6[1] = result;
  }
  return result;
}

void sub_1D179E914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

long long **degas::IntersectPredicate::filterElements(degas::IntersectPredicate *this, long long **a2, degas::Bitmap *a3)
{
  uint64_t v3 = a2;
  unsigned int v22 = *a2;
  long long v23 = 0u;
  long long v24 = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v23 + 8, a2[2], v3[3], v3[3] - a2[2]);
  char v25 = *((unsigned char *)v3 + 40);
  uint64_t v5 = (uint64_t *)*((void *)this + 1);
  uint64_t v6 = (uint64_t *)*((void *)this + 2);
  if (v5 == v6)
  {
    uint64_t v10 = 0;
    goto LABEL_26;
  }
  while (1)
  {
    uint64_t v7 = *v5;
    uint64_t v8 = (std::__shared_weak_count *)v5[1];
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v9 = (*(uint64_t (**)(uint64_t, long long **, long long **))(*(void *)v7 + 24))(v7, &v22, &v22);
    uint64_t v10 = (long long **)v9;
    if (v9)
    {
      BOOL v11 = 0;
      int v12 = 1;
      uint64_t v3 = (long long **)v9;
      if (!v8) {
        goto LABEL_7;
      }
LABEL_6:
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      goto LABEL_7;
    }
    unsigned __int8 v13 = v22;
    if (v22 == (long long *)0xFFFFFFFFLL)
    {
      uint64_t v14 = (uint64_t *)*((void *)&v23 + 1);
      char v15 = (uint64_t *)v24;
      if (*((void *)&v23 + 1) == (void)v24)
      {
        unsigned __int8 v13 = 0;
      }
      else
      {
        unsigned __int8 v13 = 0;
        do
        {
          uint64_t v16 = *v14;
          unsigned int v17 = *(_DWORD *)(*v14 + 4);
          if (v17 == -1)
          {
            uint64_t v18 = 0;
            int32x4_t v19 = 0uLL;
            do
            {
              do
              {
                int32x4_t v19 = (int32x4_t)vpadalq_u16((uint32x4_t)v19, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v16 + 4 * v18 + 16))));
                v18 += 4;
              }
              while (v18 != 32);
              uint64_t v18 = 0;
              unsigned int v17 = vaddvq_s32(v19);
              int32x4_t v19 = 0uLL;
            }
            while (v17 == -1);
            *(_DWORD *)(v16 + 4) = v17;
          }
          unsigned __int8 v13 = (long long *)((char *)v13 + v17);
          v14 += 2;
        }
        while (v14 != v15);
      }
      unsigned int v22 = v13;
    }
    BOOL v11 = v13 != 0;
    int v12 = 2 * (v13 == 0);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    if (!v11) {
      break;
    }
    v5 += 2;
    if (v5 == v6) {
      goto LABEL_26;
    }
  }
  if (v12 == 2)
  {
LABEL_26:
    degas::Bitmap::operator=(a3, &v22);
    uint64_t v3 = v10;
  }
  uint64_t v26 = (void **)&v23 + 1;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v26);
  return v3;
}

void sub_1D179EB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t degas::IntersectPredicate::elements(degas::IntersectPredicate *this, degas::Bitmap *a2)
{
  long long v22 = 0u;
  memset(v23, 0, 25);
  uint64_t v4 = *((void *)this + 1);
  uint64_t v5 = *((void *)this + 2);
  if (v4 == v5)
  {
    uint64_t v11 = 0;
    goto LABEL_30;
  }
  char v6 = 1;
  while (1)
  {
    uint64_t v7 = *(uint64_t **)v4;
    uint64_t v8 = *(std::__shared_weak_count **)(v4 + 8);
    if (v8) {
      atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v9 = *v7;
    if (v6) {
      uint64_t v10 = (*(uint64_t (**)(void))(v9 + 16))();
    }
    else {
      uint64_t v10 = (*(uint64_t (**)(void))(v9 + 24))();
    }
    uint64_t v11 = v10;
    if (v10)
    {
      BOOL v12 = 0;
      int v13 = 1;
      uint64_t v2 = v10;
      if (!v8) {
        goto LABEL_11;
      }
LABEL_10:
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      goto LABEL_11;
    }
    uint64_t v14 = v22;
    if ((void)v22 == 0xFFFFFFFFLL)
    {
      char v15 = (uint64_t *)v23[0];
      uint64_t v16 = (uint64_t *)v23[1];
      if (v23[0] == v23[1])
      {
        uint64_t v14 = 0;
      }
      else
      {
        uint64_t v14 = 0;
        do
        {
          uint64_t v17 = *v15;
          unsigned int v18 = *(_DWORD *)(*v15 + 4);
          if (v18 == -1)
          {
            uint64_t v19 = 0;
            int32x4_t v20 = 0uLL;
            do
            {
              do
              {
                int32x4_t v20 = (int32x4_t)vpadalq_u16((uint32x4_t)v20, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v17 + 4 * v19 + 16))));
                v19 += 4;
              }
              while (v19 != 32);
              uint64_t v19 = 0;
              unsigned int v18 = vaddvq_s32(v20);
              int32x4_t v20 = 0uLL;
            }
            while (v18 == -1);
            *(_DWORD *)(v17 + 4) = v18;
          }
          v14 += v18;
          v15 += 2;
        }
        while (v15 != v16);
      }
      *(void *)&long long v22 = v14;
    }
    BOOL v12 = v14 != 0;
    int v13 = 2 * (v14 == 0);
    if (v8) {
      goto LABEL_10;
    }
LABEL_11:
    if (!v12) {
      break;
    }
    char v6 = 0;
    v4 += 16;
    if (v4 == v5) {
      goto LABEL_30;
    }
  }
  if (v13 == 2)
  {
LABEL_30:
    degas::Bitmap::operator=(a2, &v22);
    uint64_t v2 = v11;
  }
  long long v24 = (void **)v23;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v24);
  return v2;
}

void sub_1D179ED1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void **a16)
{
  a16 = (void **)&a11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

void degas::IntersectPredicate::~IntersectPredicate(degas::IntersectPredicate *this)
{
  *(void *)this = &unk_1F2802400;
  uint64_t v1 = (void **)((char *)this + 8);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1D25F9A90);
}

{
  void **v1;

  *(void *)this = &unk_1F2802400;
  uint64_t v1 = (void **)((char *)this + 8);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

uint64_t degas::UnionPredicate::debugDescription(degas::UnionPredicate *this, const degas::Database *a2)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v14);
  LOBYTE(__p[0]) = 40;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)__p, 1);
  uint64_t v4 = (uint64_t *)*((void *)this + 1);
  uint64_t v5 = (uint64_t *)*((void *)this + 2);
  if (v4 != v5)
  {
    char v6 = 1;
    while (1)
    {
      uint64_t v8 = *v4;
      uint64_t v7 = (std::__shared_weak_count *)v4[1];
      if (v7) {
        atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if ((v6 & 1) == 0) {
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)" or ", 4);
      }
      (*(void (**)(void **__return_ptr, uint64_t, const degas::Database *))(*(void *)v8 + 64))(__p, v8, a2);
      uint64_t v9 = (v13 & 0x80u) == 0 ? __p : (void **)__p[0];
      uint64_t v10 = (v13 & 0x80u) == 0 ? (void *)v13 : __p[1];
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)v9, (uint64_t)v10);
      if ((char)v13 < 0) {
        break;
      }
      if (v7) {
        goto LABEL_15;
      }
LABEL_16:
      char v6 = 0;
      v4 += 2;
      if (v4 == v5) {
        goto LABEL_20;
      }
    }
    operator delete(__p[0]);
    if (!v7) {
      goto LABEL_16;
    }
LABEL_15:
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    goto LABEL_16;
  }
LABEL_20:
  LOBYTE(__p[0]) = 41;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)__p, 1);
  std::stringbuf::str();
  v14[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v14 + *(void *)(v14[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v14[1] = MEMORY[0x1E4FBA470] + 16;
  if (v15 < 0) {
    operator delete((void *)v14[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1D25F9A50](&v16);
}

void sub_1D179F060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
}

uint64_t degas::UnionPredicate::isTrivialNo(degas::UnionPredicate *this)
{
  uint64_t v1 = (uint64_t *)*((void *)this + 1);
  uint64_t v2 = (uint64_t *)*((void *)this + 2);
  if (v1 == v2) {
    return 1;
  }
  do
  {
    uint64_t v3 = *v1;
    uint64_t v4 = (std::__shared_weak_count *)v1[1];
    if (v4) {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 56))(v3);
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    v1 += 2;
    if (v1 == v2) {
      char v6 = 0;
    }
    else {
      char v6 = v5;
    }
  }
  while ((v6 & 1) != 0);
  return v5;
}

void sub_1D179F144(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t degas::UnionPredicate::isTrivialYes(degas::UnionPredicate *this)
{
  uint64_t v1 = (uint64_t *)*((void *)this + 1);
  uint64_t v2 = (uint64_t *)*((void *)this + 2);
  if (v1 == v2) {
    return 0;
  }
  do
  {
    uint64_t v3 = *v1;
    uint64_t v4 = (std::__shared_weak_count *)v1[1];
    if (v4) {
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 48))(v3);
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    v1 += 2;
    if (v1 == v2) {
      int v6 = 1;
    }
    else {
      int v6 = v5;
    }
  }
  while (v6 != 1);
  return v5;
}

void sub_1D179F1FC(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t degas::UnionPredicate::allLabelIds(degas::UnionPredicate *this, Bitmap *a2)
{
  return 0;
}

uint64_t degas::UnionPredicate::decomposeLabelsPredicate@<X0>(uint64_t result@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = *(void **)(result + 8);
  if (*(void *)(result + 16) - (void)v3 == 16) {
    return (*(uint64_t (**)(void, void *))(*(void *)*v3 + 32))(*v3, v3);
  }
  *a3 = 0;
  a3[1] = 0;
  uint64_t v4 = a2[1];
  a3[2] = *a2;
  a3[3] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t degas::UnionPredicate::filterElements(degas::UnionPredicate *this, const degas::Bitmap *a2, degas::Bitmap *a3)
{
  long long v16 = 0u;
  memset(v17, 0, 25);
  uint64_t v5 = (uint64_t *)*((void *)this + 1);
  int v6 = (uint64_t *)*((void *)this + 2);
  if (v5 == v6)
  {
LABEL_10:
    degas::Bitmap::operator=(a3, &v16);
    uint64_t v12 = 0;
  }
  else
  {
    while (1)
    {
      uint64_t v8 = *v5;
      uint64_t v9 = (std::__shared_weak_count *)v5[1];
      if (v9) {
        atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v14 = 0u;
      memset(v15, 0, 25);
      uint64_t v10 = (*(uint64_t (**)(uint64_t, const degas::Bitmap *, long long *))(*(void *)v8 + 24))(v8, a2, &v14);
      int v11 = v10;
      uint64_t v12 = v10;
      if (!v10)
      {
        degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)&v16, (uint64_t)&v14);
        uint64_t v12 = v3;
      }
      unsigned int v18 = (void **)v15;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v18);
      if (v9) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v9);
      }
      if (v11) {
        break;
      }
      v5 += 2;
      uint64_t v3 = v12;
      if (v5 == v6) {
        goto LABEL_10;
      }
    }
  }
  *(void *)&long long v14 = v17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
  return v12;
}

void sub_1D179F3A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  a9 = (void **)&a17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::UnionPredicate::elements(degas::UnionPredicate *this, degas::Bitmap *a2)
{
  long long v14 = 0u;
  memset(v15, 0, 25);
  uint64_t v4 = (uint64_t *)*((void *)this + 1);
  uint64_t v5 = (uint64_t *)*((void *)this + 2);
  if (v4 == v5)
  {
LABEL_10:
    degas::Bitmap::operator=(a2, &v14);
    uint64_t v10 = 0;
  }
  else
  {
    while (1)
    {
      uint64_t v6 = *v4;
      uint64_t v7 = (std::__shared_weak_count *)v4[1];
      if (v7) {
        atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v12 = 0u;
      memset(v13, 0, 25);
      uint64_t v8 = (*(uint64_t (**)(uint64_t, long long *))(*(void *)v6 + 16))(v6, &v12);
      int v9 = v8;
      uint64_t v10 = v8;
      if (!v8)
      {
        degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)&v14, (uint64_t)&v12);
        uint64_t v10 = v2;
      }
      long long v16 = (void **)v13;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v16);
      if (v7) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v7);
      }
      if (v9) {
        break;
      }
      v4 += 2;
      uint64_t v2 = v10;
      if (v4 == v5) {
        goto LABEL_10;
      }
    }
  }
  *(void *)&long long v12 = v15;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);
  return v10;
}

void sub_1D179F500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  a9 = (void **)&a17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void degas::UnionPredicate::~UnionPredicate(degas::UnionPredicate *this)
{
  *(void *)this = &unk_1F2802458;
  uint64_t v1 = (void **)((char *)this + 8);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1D25F9A90);
}

{
  void **v1;

  *(void *)this = &unk_1F2802458;
  uint64_t v1 = (void **)((char *)this + 8);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

void *degas::Predicate::nullPtr(degas::Predicate *this)
{
  {
    __cxa_atexit((void (*)(void *))std::shared_ptr<degas::Predicate>::~shared_ptr[abi:ne180100], &degas::Predicate::nullPtr(void)::nullPtr, &dword_1D1654000);
  }
  return &degas::Predicate::nullPtr(void)::nullPtr;
}

uint64_t std::shared_ptr<degas::Predicate>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  return a1;
}

void *degas::YesNodePredicate::YesNodePredicate(void *result, uint64_t a2)
{
  void *result = &unk_1F2802198;
  result[1] = a2;
  return result;
}

{
  void *result = &unk_1F2802198;
  result[1] = a2;
  return result;
}

void *degas::YesEdgePredicate::YesEdgePredicate(void *result, uint64_t a2)
{
  void *result = &unk_1F28021F0;
  result[1] = a2;
  return result;
}

{
  void *result = &unk_1F28021F0;
  result[1] = a2;
  return result;
}

void *degas::NoPredicate::NoPredicate(void *this)
{
  *this = &unk_1F2802248;
  return this;
}

{
  *this = &unk_1F2802248;
  return this;
}

degas::AllLabelsNodePredicate *degas::AllLabelsNodePredicate::AllLabelsNodePredicate(degas::AllLabelsNodePredicate *this, long long **a2, const degas::NodeTable *a3, const degas::Database *a4)
{
  uint64_t v8 = *a2;
  *(void *)this = &unk_1F28022A0;
  *((void *)this + 1) = v8;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 24, a2[2], a2[3], a2[3] - a2[2]);
  *((unsigned char *)this + 48) = *((unsigned char *)a2 + 40);
  *((void *)this + 7) = a3;
  *((void *)this + 8) = a4;
  return this;
}

{
  long long *v8;

  uint64_t v8 = *a2;
  *(void *)this = &unk_1F28022A0;
  *((void *)this + 1) = v8;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 24, a2[2], a2[3], a2[3] - a2[2]);
  *((unsigned char *)this + 48) = *((unsigned char *)a2 + 40);
  *((void *)this + 7) = a3;
  *((void *)this + 8) = a4;
  return this;
}

degas::AnyLabelsNodePredicate *degas::AnyLabelsNodePredicate::AnyLabelsNodePredicate(degas::AnyLabelsNodePredicate *this, long long **a2, const degas::NodeTable *a3, const degas::Database *a4)
{
  uint64_t v8 = *a2;
  *(void *)this = &unk_1F28022F8;
  *((void *)this + 1) = v8;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 24, a2[2], a2[3], a2[3] - a2[2]);
  *((unsigned char *)this + 48) = *((unsigned char *)a2 + 40);
  *((void *)this + 7) = a3;
  *((void *)this + 8) = a4;
  return this;
}

{
  long long *v8;

  uint64_t v8 = *a2;
  *(void *)this = &unk_1F28022F8;
  *((void *)this + 1) = v8;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 24, a2[2], a2[3], a2[3] - a2[2]);
  *((unsigned char *)this + 48) = *((unsigned char *)a2 + 40);
  *((void *)this + 7) = a3;
  *((void *)this + 8) = a4;
  return this;
}

degas::AllLabelsEdgePredicate *degas::AllLabelsEdgePredicate::AllLabelsEdgePredicate(degas::AllLabelsEdgePredicate *this, long long **a2, const degas::EdgeTable *a3, const degas::Database *a4)
{
  uint64_t v8 = *a2;
  *(void *)this = &unk_1F2802350;
  *((void *)this + 1) = v8;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 24, a2[2], a2[3], a2[3] - a2[2]);
  *((unsigned char *)this + 48) = *((unsigned char *)a2 + 40);
  *((void *)this + 7) = a3;
  *((void *)this + 8) = a4;
  return this;
}

{
  long long *v8;

  uint64_t v8 = *a2;
  *(void *)this = &unk_1F2802350;
  *((void *)this + 1) = v8;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 24, a2[2], a2[3], a2[3] - a2[2]);
  *((unsigned char *)this + 48) = *((unsigned char *)a2 + 40);
  *((void *)this + 7) = a3;
  *((void *)this + 8) = a4;
  return this;
}

degas::AnyLabelsEdgePredicate *degas::AnyLabelsEdgePredicate::AnyLabelsEdgePredicate(degas::AnyLabelsEdgePredicate *this, long long **a2, const degas::EdgeTable *a3, const degas::Database *a4)
{
  uint64_t v8 = *a2;
  *(void *)this = &unk_1F28023A8;
  *((void *)this + 1) = v8;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 24, a2[2], a2[3], a2[3] - a2[2]);
  *((unsigned char *)this + 48) = *((unsigned char *)a2 + 40);
  *((void *)this + 7) = a3;
  *((void *)this + 8) = a4;
  return this;
}

{
  long long *v8;

  uint64_t v8 = *a2;
  *(void *)this = &unk_1F28023A8;
  *((void *)this + 1) = v8;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 24, a2[2], a2[3], a2[3] - a2[2]);
  *((unsigned char *)this + 48) = *((unsigned char *)a2 + 40);
  *((void *)this + 7) = a3;
  *((void *)this + 8) = a4;
  return this;
}

void *degas::IntersectPredicate::IntersectPredicate(void *a1, void **a2)
{
  *a1 = &unk_1F2802400;
  a1[2] = 0;
  a1[3] = 0;
  a1[1] = 0;
  std::vector<std::shared_ptr<degas::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::Predicate>*,std::shared_ptr<degas::Predicate>*>(a1 + 1, *a2, a2[1], ((char *)a2[1] - (char *)*a2) >> 4);
  return a1;
}

{
  *a1 = &unk_1F2802400;
  a1[2] = 0;
  a1[3] = 0;
  a1[1] = 0;
  std::vector<std::shared_ptr<degas::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::Predicate>*,std::shared_ptr<degas::Predicate>*>(a1 + 1, *a2, a2[1], ((char *)a2[1] - (char *)*a2) >> 4);
  return a1;
}

void *degas::UnionPredicate::UnionPredicate(void *a1, void **a2)
{
  *a1 = &unk_1F2802458;
  a1[2] = 0;
  a1[3] = 0;
  a1[1] = 0;
  std::vector<std::shared_ptr<degas::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::Predicate>*,std::shared_ptr<degas::Predicate>*>(a1 + 1, *a2, a2[1], ((char *)a2[1] - (char *)*a2) >> 4);
  return a1;
}

{
  *a1 = &unk_1F2802458;
  a1[2] = 0;
  a1[3] = 0;
  a1[1] = 0;
  std::vector<std::shared_ptr<degas::Predicate>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::Predicate>*,std::shared_ptr<degas::Predicate>*>(a1 + 1, *a2, a2[1], ((char *)a2[1] - (char *)*a2) >> 4);
  return a1;
}

void sub_1D17A082C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5384(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5385(uint64_t a1)
{
}

void *degas::NodeLabelQuery::NodeLabelQuery(void *result, uint64_t a2, uint64_t a3)
{
  void *result = a2;
  result[1] = a3;
  return result;
}

{
  void *result = a2;
  result[1] = a3;
  return result;
}

void *degas::EdgeLabelQuery::EdgeLabelQuery(void *result, uint64_t a2, uint64_t a3)
{
  void *result = a2;
  result[1] = a3;
  return result;
}

{
  void *result = a2;
  result[1] = a3;
  return result;
}

uint64_t degas::implAllElementsFromLabels(degas::LabelTable *a1, degas::Bitmap *a2, uint64_t a3)
{
  AllStatement = degas::LabelTable::readAllStatement(a1);
  uint64_t v6 = (degas::Statement *)*AllStatement;
  uint64_t v7 = (atomic_ullong *)AllStatement[1];
  v14[0] = v6;
  v14[1] = (degas::Statement *)v7;
  if (v7) {
    atomic_fetch_add_explicit(v7 + 1, 1uLL, memory_order_relaxed);
  }
  while (1)
  {
    unsigned int v8 = degas::Statement::next((sqlite3_stmt **)v6);
    if (v8 != 1) {
      break;
    }
    long long v12 = 0u;
    memset(v13, 0, 25);
    uint64_t v9 = *(void *)(a3 + 24);
    if (!v9) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(uint64_t, degas::Statement **, long long *))(*(void *)v9 + 48))(v9, v14, &v12);
    degas::Bitmap::unionWith<degas::Bitmap>(a2, (uint64_t)&v12);
    char v15 = (void **)v13;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v15);
    uint64_t v6 = v14[0];
  }
  if (v8 == 2) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v8;
  }
  degas::Cursor::~Cursor(v14);
  return v10;
}

void sub_1D17A1A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  *(void *)(v9 - 40) = v8;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v9 - 40));
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x1D25F9A90);
}

uint64_t degas::NodeLabelQuery::allNodes(const degas::NodeTable **this, degas::Bitmap *a2)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *this;
  if (*((unsigned char *)*this + 49))
  {
    uint64_t v4 = (const degas::NodeTable *)((char *)this[1] + 80);
    v10[0] = &unk_1F28025E8;
    v10[3] = v10;
    uint64_t v5 = degas::implAllElementsFromLabels(v4, a2, (uint64_t)v10);
    std::__function::__value_func<void ()(degas::LabelCursor &,degas::Bitmap &)>::~__value_func[abi:ne180100](v10);
  }
  else
  {
    degas::NodeCursor::NodeCursor(v9);
    degas::NodeCursor::setForSelectAll((degas::NodeCursor *)v9, v3);
    while (1)
    {
      unsigned int v6 = degas::Statement::next((sqlite3_stmt **)v9[0]);
      if (v6 != 1) {
        break;
      }
      sqlite3_int64 v7 = sqlite3_column_int64(*(sqlite3_stmt **)v9[0], 0);
      degas::Bitmap::setBit(a2, v7);
    }
    if (v6 == 2) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = v6;
    }
    degas::Cursor::~Cursor(v9);
  }
  return v5;
}

void sub_1D17A1C1C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

void *std::__function::__value_func<void ()(degas::LabelCursor &,degas::Bitmap &)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void *std::__function::__func<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::target_type()
{
}

uint64_t std::__function::__func<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5degas14NodeLabelQuery8allNodesERNS_6BitmapEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
}

void std::__function::__func<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_1F28025E8;
}

void *std::__function::__func<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_1F28025E8;
  return result;
}

void std::__function::__func<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::allNodes(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::~__func()
{
}

uint64_t degas::EdgeLabelQuery::allEdges(const degas::EdgeTable **this, degas::Bitmap *a2)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *this;
  if (*((unsigned char *)*this + 49))
  {
    uint64_t v4 = (const degas::EdgeTable *)((char *)this[1] + 80);
    v10[0] = &unk_1F2802678;
    v10[3] = v10;
    uint64_t v5 = degas::implAllElementsFromLabels(v4, a2, (uint64_t)v10);
    std::__function::__value_func<void ()(degas::LabelCursor &,degas::Bitmap &)>::~__value_func[abi:ne180100](v10);
  }
  else
  {
    degas::EdgeCursor::EdgeCursor(v9);
    degas::EdgeCursor::setForSelectAll((degas::EdgeCursor *)v9, v3);
    while (1)
    {
      unsigned int v6 = degas::Statement::next((sqlite3_stmt **)v9[0]);
      if (v6 != 1) {
        break;
      }
      sqlite3_int64 v7 = sqlite3_column_int64(*(sqlite3_stmt **)v9[0], 0);
      degas::Bitmap::setBit(a2, v7);
    }
    if (v6 == 2) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = v6;
    }
    degas::Cursor::~Cursor(v9);
  }
  return v5;
}

void sub_1D17A1E94(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

void *std::__function::__func<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::target_type()
{
}

uint64_t std::__function::__func<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5degas14EdgeLabelQuery8allEdgesERNS_6BitmapEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
}

void std::__function::__func<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_1F2802678;
}

void *std::__function::__func<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_1F2802678;
  return result;
}

void std::__function::__func<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::allEdges(degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::~__func()
{
}

uint64_t degas::implElementsForLabelFromLabels(degas::LabelTable *a1, sqlite3_int64 a2, degas::Bitmap *a3, uint64_t a4)
{
  degas::LabelCursor::LabelCursor((degas::LabelCursor *)v12, a2, a1);
  while (1)
  {
    unsigned int v6 = degas::Statement::next((sqlite3_stmt **)v12[0]);
    if (v6 != 1) {
      break;
    }
    long long v10 = 0u;
    memset(v11, 0, 25);
    uint64_t v7 = *(void *)(a4 + 24);
    if (!v7) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(uint64_t, degas::Statement **, long long *))(*(void *)v7 + 48))(v7, v12, &v10);
    degas::Bitmap::unionWith<degas::Bitmap>(a3, (uint64_t)&v10);
    unsigned __int8 v13 = (void **)v11;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v13);
  }
  if (v6 == 2) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v6;
  }
  degas::Cursor::~Cursor(v12);
  return v8;
}

void sub_1D17A2058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  *(void *)(v9 - 40) = v8;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v9 - 40));
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

uint64_t degas::NodeLabelQuery::nodesForLabel(const degas::NodeTable **this, sqlite3_int64 a2, degas::Bitmap *a3)
{
  v12[4] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *this;
  if (*((unsigned char *)*this + 49))
  {
    unsigned int v6 = (const degas::NodeTable *)((char *)this[1] + 80);
    v12[0] = &unk_1F28026F8;
    void v12[3] = v12;
    uint64_t v7 = degas::implElementsForLabelFromLabels(v6, a2, a3, (uint64_t)v12);
    std::__function::__value_func<void ()(degas::LabelCursor &,degas::Bitmap &)>::~__value_func[abi:ne180100](v12);
  }
  else
  {
    degas::NodeCursor::NodeCursor(v11);
    degas::NodeCursor::setForLabel((degas::NodeCursor *)v11, a2, v5);
    while (1)
    {
      unsigned int v8 = degas::Statement::next((sqlite3_stmt **)v11[0]);
      if (v8 != 1) {
        break;
      }
      sqlite3_int64 v9 = sqlite3_column_int64(*(sqlite3_stmt **)v11[0], 0);
      degas::Bitmap::setBit(a3, v9);
    }
    if (v8 == 2) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = v8;
    }
    degas::Cursor::~Cursor(v11);
  }
  return v7;
}

void sub_1D17A2198(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

void *std::__function::__func<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::target_type()
{
}

uint64_t std::__function::__func<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5degas14NodeLabelQuery13nodesForLabelEyRNS_6BitmapEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
}

void std::__function::__func<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_1F28026F8;
}

void *std::__function::__func<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_1F28026F8;
  return result;
}

void std::__function::__func<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::NodeLabelQuery::nodesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::~__func()
{
}

uint64_t degas::EdgeLabelQuery::edgesForLabel(const degas::EdgeTable **this, sqlite3_int64 a2, degas::Bitmap *a3)
{
  v12[4] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *this;
  if (*((unsigned char *)*this + 49))
  {
    unsigned int v6 = (const degas::EdgeTable *)((char *)this[1] + 80);
    v12[0] = &unk_1F2802778;
    void v12[3] = v12;
    uint64_t v7 = degas::implElementsForLabelFromLabels(v6, a2, a3, (uint64_t)v12);
    std::__function::__value_func<void ()(degas::LabelCursor &,degas::Bitmap &)>::~__value_func[abi:ne180100](v12);
  }
  else
  {
    degas::EdgeCursor::EdgeCursor(v11);
    degas::EdgeCursor::setForLabel((degas::EdgeCursor *)v11, a2, v5);
    while (1)
    {
      unsigned int v8 = degas::Statement::next((sqlite3_stmt **)v11[0]);
      if (v8 != 1) {
        break;
      }
      sqlite3_int64 v9 = sqlite3_column_int64(*(sqlite3_stmt **)v11[0], 0);
      degas::Bitmap::setBit(a3, v9);
    }
    if (v8 == 2) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = v8;
    }
    degas::Cursor::~Cursor(v11);
  }
  return v7;
}

void sub_1D17A23A0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

void *std::__function::__func<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::target_type()
{
}

uint64_t std::__function::__func<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5degas14EdgeLabelQuery13edgesForLabelEyRNS_6BitmapEE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
}

void std::__function::__func<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_1F2802778;
}

void *std::__function::__func<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_1F2802778;
  return result;
}

void std::__function::__func<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForLabel(unsigned long long,degas::Bitmap &)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap &)>::~__func()
{
}

uint64_t degas::implElementsForAllLabelsFromLabels(degas::LabelTable *a1, Bitmap *a2, degas::Bitmap *a3, uint64_t a4)
{
  degas::LabelCursor::LabelCursor((degas::LabelCursor *)v13, a2, a1);
  for (char i = 1; ; char i = 0)
  {
    unsigned int v7 = degas::Statement::next((sqlite3_stmt **)v13[0]);
    if (v7 != 1) {
      break;
    }
    long long v11 = 0u;
    memset(v12, 0, 25);
    uint64_t v8 = *(void *)(a4 + 24);
    if (!v8) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(uint64_t, degas::Statement **, long long *))(*(void *)v8 + 48))(v8, v13, &v11);
    if (i) {
      degas::Bitmap::operator=(a3, &v11);
    }
    else {
      degas::Bitmap::intersectWith<degas::Bitmap>(a3, (degas::Bitmap *)&v11);
    }
    long long v14 = (void **)v12;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v14);
  }
  if (v7 == 2) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v7;
  }
  degas::Cursor::~Cursor(v13);
  return v9;
}

void sub_1D17A2580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  *(void *)(v9 - 40) = v8;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v9 - 40));
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

uint64_t degas::NodeLabelQuery::nodesForAllLabels(const degas::NodeTable **this, const degas::Bitmap *a2, degas::Bitmap *a3, char a4)
{
  v13[4] = *MEMORY[0x1E4F143B8];
  unsigned int v6 = *this;
  if (!*((unsigned char *)*this + 49) || (a4 & 1) != 0)
  {
    degas::NodeCursor::NodeCursor(v12);
    degas::NodeCursor::setForAllLabels((degas::NodeCursor *)v12, a2, v6);
    while (1)
    {
      unsigned int v9 = degas::Statement::next((sqlite3_stmt **)v12[0]);
      if (v9 != 1) {
        break;
      }
      sqlite3_int64 v10 = sqlite3_column_int64(*(sqlite3_stmt **)v12[0], 0);
      degas::Bitmap::setBit(a3, v10);
    }
    if (v9 == 2) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v9;
    }
    degas::Cursor::~Cursor(v12);
  }
  else
  {
    unsigned int v7 = (const degas::NodeTable *)((char *)this[1] + 80);
    v13[0] = &unk_1F28027F8;
    v13[3] = v13;
    uint64_t v8 = degas::implElementsForAllLabelsFromLabels(v7, (Bitmap *)a2, a3, (uint64_t)v13);
    std::__function::__value_func<void ()(degas::LabelCursor &,degas::Bitmap &)>::~__value_func[abi:ne180100](v13);
  }
  return v8;
}

void sub_1D17A26C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

void *std::__function::__func<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target_type()
{
}

uint64_t std::__function::__func<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5degas14NodeLabelQuery17nodesForAllLabelsERKNS_6BitmapERS1_bE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
}

void std::__function::__func<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_1F28027F8;
}

void *std::__function::__func<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_1F28027F8;
  return result;
}

void std::__function::__func<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::~__func()
{
}

uint64_t degas::NodeLabelQuery::filterNodesForAllLabels(const degas::NodeTable **this, Bitmap *a2, const degas::Bitmap *a3, degas::Bitmap *a4)
{
  v16[4] = *MEMORY[0x1E4F143B8];
  unsigned int v7 = *this;
  if (*((unsigned char *)*this + 49))
  {
    *(_OWORD *)unsigned __int8 v13 = 0u;
    memset(v14, 0, 25);
    uint64_t v8 = (const degas::NodeTable *)((char *)this[1] + 80);
    v16[0] = &unk_1F2802878;
    v16[3] = v16;
    uint64_t v9 = degas::implElementsForAllLabelsFromLabels(v8, a2, (degas::Bitmap *)v13, (uint64_t)v16);
    std::__function::__value_func<void ()(degas::LabelCursor &,degas::Bitmap &)>::~__value_func[abi:ne180100](v16);
    if (!v9)
    {
      degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)v13, a3);
      degas::Bitmap::operator=(a4, v13);
    }
    char v15 = (void **)v14;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v15);
  }
  else
  {
    degas::NodeCursor::NodeCursor(v13);
    degas::NodeCursor::setForAllLabelsAndIdentifiers((degas::NodeCursor *)v13, (const degas::Bitmap *)a2, (Bitmap *)a3, v7);
    while (1)
    {
      unsigned int v10 = degas::Statement::next((sqlite3_stmt **)v13[0]);
      if (v10 != 1) {
        break;
      }
      sqlite3_int64 v11 = sqlite3_column_int64(*(sqlite3_stmt **)v13[0], 0);
      degas::Bitmap::setBit(a4, v11);
    }
    if (v10 == 2) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v10;
    }
    degas::Cursor::~Cursor(v13);
  }
  return v9;
}

void sub_1D17A2910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void *std::__function::__func<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target_type()
{
}

uint64_t std::__function::__func<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5degas14NodeLabelQuery23filterNodesForAllLabelsERKNS_6BitmapES3_RS1_E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
}

void std::__function::__func<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_1F2802878;
}

void *std::__function::__func<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_1F2802878;
  return result;
}

void std::__function::__func<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::~__func()
{
}

uint64_t degas::EdgeLabelQuery::edgesForAllLabels(const degas::EdgeTable **this, const degas::Bitmap *a2, degas::Bitmap *a3, char a4)
{
  v13[4] = *MEMORY[0x1E4F143B8];
  unsigned int v6 = *this;
  if (!*((unsigned char *)*this + 49) || (a4 & 1) != 0)
  {
    degas::EdgeCursor::EdgeCursor(v12);
    degas::EdgeCursor::setForAllLabels((degas::EdgeCursor *)v12, a2, v6);
    while (1)
    {
      unsigned int v9 = degas::Statement::next((sqlite3_stmt **)v12[0]);
      if (v9 != 1) {
        break;
      }
      sqlite3_int64 v10 = sqlite3_column_int64(*(sqlite3_stmt **)v12[0], 0);
      degas::Bitmap::setBit(a3, v10);
    }
    if (v9 == 2) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v9;
    }
    degas::Cursor::~Cursor(v12);
  }
  else
  {
    unsigned int v7 = (const degas::EdgeTable *)((char *)this[1] + 80);
    v13[0] = &unk_1F28028F8;
    v13[3] = v13;
    uint64_t v8 = degas::implElementsForAllLabelsFromLabels(v7, (Bitmap *)a2, a3, (uint64_t)v13);
    std::__function::__value_func<void ()(degas::LabelCursor &,degas::Bitmap &)>::~__value_func[abi:ne180100](v13);
  }
  return v8;
}

void sub_1D17A2B38(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

void *std::__function::__func<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target_type()
{
}

uint64_t std::__function::__func<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5degas14EdgeLabelQuery17edgesForAllLabelsERKNS_6BitmapERS1_bE3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
}

void std::__function::__func<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_1F28028F8;
}

void *std::__function::__func<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_1F28028F8;
  return result;
}

void std::__function::__func<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAllLabels(degas::Bitmap const&,degas::Bitmap&,BOOL)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::~__func()
{
}

uint64_t degas::EdgeLabelQuery::filterEdgesForAllLabels(const degas::EdgeTable **this, Bitmap *a2, const degas::Bitmap *a3, degas::Bitmap *a4)
{
  v16[4] = *MEMORY[0x1E4F143B8];
  unsigned int v7 = *this;
  if (*((unsigned char *)*this + 49))
  {
    *(_OWORD *)unsigned __int8 v13 = 0u;
    memset(v14, 0, 25);
    uint64_t v8 = (const degas::EdgeTable *)((char *)this[1] + 80);
    v16[0] = &unk_1F2802978;
    v16[3] = v16;
    uint64_t v9 = degas::implElementsForAllLabelsFromLabels(v8, a2, (degas::Bitmap *)v13, (uint64_t)v16);
    std::__function::__value_func<void ()(degas::LabelCursor &,degas::Bitmap &)>::~__value_func[abi:ne180100](v16);
    if (!v9)
    {
      degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)v13, a3);
      degas::Bitmap::operator=(a4, v13);
    }
    char v15 = (void **)v14;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v15);
  }
  else
  {
    degas::EdgeCursor::EdgeCursor(v13);
    degas::EdgeCursor::setForAllLabelsAndIdentifiers((degas::EdgeCursor *)v13, (const degas::Bitmap *)a2, (Bitmap *)a3, v7);
    while (1)
    {
      unsigned int v10 = degas::Statement::next((sqlite3_stmt **)v13[0]);
      if (v10 != 1) {
        break;
      }
      sqlite3_int64 v11 = sqlite3_column_int64(*(sqlite3_stmt **)v13[0], 0);
      degas::Bitmap::setBit(a4, v11);
    }
    if (v10 == 2) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v10;
    }
    degas::Cursor::~Cursor(v13);
  }
  return v9;
}

void sub_1D17A2D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void *std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target_type()
{
}

uint64_t std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5degas14EdgeLabelQuery23filterEdgesForAllLabelsERKNS_6BitmapES3_RS1_E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
}

void std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_1F2802978;
}

void *std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_1F2802978;
  return result;
}

void std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAllLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::~__func()
{
}

uint64_t degas::implElementsForAnyLabelsFromLabels(degas::LabelTable *a1, Bitmap *a2, degas::Bitmap *a3, uint64_t a4)
{
  degas::LabelCursor::LabelCursor((degas::LabelCursor *)v13, a2, a1);
  for (char i = 1; ; char i = 0)
  {
    unsigned int v7 = degas::Statement::next((sqlite3_stmt **)v13[0]);
    if (v7 != 1) {
      break;
    }
    long long v11 = 0u;
    memset(v12, 0, 25);
    uint64_t v8 = *(void *)(a4 + 24);
    if (!v8) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(uint64_t, degas::Statement **, long long *))(*(void *)v8 + 48))(v8, v13, &v11);
    if (i) {
      degas::Bitmap::operator=(a3, &v11);
    }
    else {
      degas::Bitmap::unionWith<degas::Bitmap>(a3, (uint64_t)&v11);
    }
    long long v14 = (void **)v12;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v14);
  }
  if (v7 == 2) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v7;
  }
  degas::Cursor::~Cursor(v13);
  return v9;
}

void sub_1D17A2F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  *(void *)(v9 - 40) = v8;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v9 - 40));
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

uint64_t degas::NodeLabelQuery::nodesForAnyLabels(const degas::NodeTable **this, Bitmap *a2, degas::Bitmap *a3)
{
  v12[4] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *this;
  if (*((unsigned char *)*this + 49))
  {
    unsigned int v6 = (const degas::NodeTable *)((char *)this[1] + 80);
    v12[0] = &unk_1F28029F8;
    void v12[3] = v12;
    uint64_t v7 = degas::implElementsForAnyLabelsFromLabels(v6, a2, a3, (uint64_t)v12);
    std::__function::__value_func<void ()(degas::LabelCursor &,degas::Bitmap &)>::~__value_func[abi:ne180100](v12);
  }
  else
  {
    degas::NodeCursor::NodeCursor(v11);
    degas::NodeCursor::setForAnyLabels((degas::NodeCursor *)v11, (const degas::Bitmap *)a2, v5);
    while (1)
    {
      unsigned int v8 = degas::Statement::next((sqlite3_stmt **)v11[0]);
      if (v8 != 1) {
        break;
      }
      sqlite3_int64 v9 = sqlite3_column_int64(*(sqlite3_stmt **)v11[0], 0);
      degas::Bitmap::setBit(a3, v9);
    }
    if (v8 == 2) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = v8;
    }
    degas::Cursor::~Cursor(v11);
  }
  return v7;
}

void sub_1D17A30C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

void *std::__function::__func<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target_type()
{
}

uint64_t std::__function::__func<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5degas14NodeLabelQuery17nodesForAnyLabelsERKNS_6BitmapERS1_E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
}

void std::__function::__func<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_1F28029F8;
}

void *std::__function::__func<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_1F28029F8;
  return result;
}

void std::__function::__func<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::nodesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::~__func()
{
}

uint64_t degas::NodeLabelQuery::filterNodesForAnyLabels(const degas::NodeTable **this, Bitmap *a2, const degas::Bitmap *a3, degas::Bitmap *a4)
{
  v16[4] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *this;
  if (*((unsigned char *)*this + 49))
  {
    *(_OWORD *)unsigned __int8 v13 = 0u;
    memset(v14, 0, 25);
    unsigned int v8 = (const degas::NodeTable *)((char *)this[1] + 80);
    v16[0] = &unk_1F2802A78;
    v16[3] = v16;
    uint64_t v9 = degas::implElementsForAnyLabelsFromLabels(v8, a2, (degas::Bitmap *)v13, (uint64_t)v16);
    std::__function::__value_func<void ()(degas::LabelCursor &,degas::Bitmap &)>::~__value_func[abi:ne180100](v16);
    if (!v9)
    {
      degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)v13, a3);
      degas::Bitmap::operator=(a4, v13);
    }
    char v15 = (void **)v14;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v15);
  }
  else
  {
    degas::NodeCursor::NodeCursor(v13);
    degas::NodeCursor::setForAnyLabelsAndIdentifiers((degas::NodeCursor *)v13, (const degas::Bitmap *)a2, (Bitmap *)a3, v7);
    while (1)
    {
      unsigned int v10 = degas::Statement::next((sqlite3_stmt **)v13[0]);
      if (v10 != 1) {
        break;
      }
      sqlite3_int64 v11 = sqlite3_column_int64(*(sqlite3_stmt **)v13[0], 0);
      degas::Bitmap::setBit(a4, v11);
    }
    if (v10 == 2) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v10;
    }
    degas::Cursor::~Cursor(v13);
  }
  return v9;
}

void sub_1D17A330C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void *std::__function::__func<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target_type()
{
}

uint64_t std::__function::__func<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5degas14NodeLabelQuery23filterNodesForAnyLabelsERKNS_6BitmapES3_RS1_E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
}

void std::__function::__func<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_1F2802A78;
}

void *std::__function::__func<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_1F2802A78;
  return result;
}

void std::__function::__func<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::NodeLabelQuery::filterNodesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::~__func()
{
}

uint64_t degas::EdgeLabelQuery::edgesForAnyLabels(const degas::EdgeTable **this, Bitmap *a2, degas::Bitmap *a3)
{
  v12[4] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *this;
  if (*((unsigned char *)*this + 49))
  {
    unsigned int v6 = (const degas::EdgeTable *)((char *)this[1] + 80);
    v12[0] = &unk_1F2802AF8;
    void v12[3] = v12;
    uint64_t v7 = degas::implElementsForAnyLabelsFromLabels(v6, a2, a3, (uint64_t)v12);
    std::__function::__value_func<void ()(degas::LabelCursor &,degas::Bitmap &)>::~__value_func[abi:ne180100](v12);
  }
  else
  {
    degas::EdgeCursor::EdgeCursor(v11);
    degas::EdgeCursor::setForAnyLabels((degas::EdgeCursor *)v11, (const degas::Bitmap *)a2, v5);
    while (1)
    {
      unsigned int v8 = degas::Statement::next((sqlite3_stmt **)v11[0]);
      if (v8 != 1) {
        break;
      }
      sqlite3_int64 v9 = sqlite3_column_int64(*(sqlite3_stmt **)v11[0], 0);
      degas::Bitmap::setBit(a3, v9);
    }
    if (v8 == 2) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = v8;
    }
    degas::Cursor::~Cursor(v11);
  }
  return v7;
}

void sub_1D17A3530(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

void *std::__function::__func<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target_type()
{
}

uint64_t std::__function::__func<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5degas14EdgeLabelQuery17edgesForAnyLabelsERKNS_6BitmapERS1_E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
}

void std::__function::__func<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_1F2802AF8;
}

void *std::__function::__func<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_1F2802AF8;
  return result;
}

void std::__function::__func<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::edgesForAnyLabels(degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::~__func()
{
}

uint64_t degas::EdgeLabelQuery::filterEdgesForAnyLabels(const degas::EdgeTable **this, Bitmap *a2, const degas::Bitmap *a3, degas::Bitmap *a4)
{
  v16[4] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *this;
  if (*((unsigned char *)*this + 49))
  {
    *(_OWORD *)unsigned __int8 v13 = 0u;
    memset(v14, 0, 25);
    unsigned int v8 = (const degas::EdgeTable *)((char *)this[1] + 80);
    v16[0] = &unk_1F2802B78;
    v16[3] = v16;
    uint64_t v9 = degas::implElementsForAnyLabelsFromLabels(v8, a2, (degas::Bitmap *)v13, (uint64_t)v16);
    std::__function::__value_func<void ()(degas::LabelCursor &,degas::Bitmap &)>::~__value_func[abi:ne180100](v16);
    if (!v9)
    {
      degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)v13, a3);
      degas::Bitmap::operator=(a4, v13);
    }
    char v15 = (void **)v14;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v15);
  }
  else
  {
    degas::EdgeCursor::EdgeCursor(v13);
    degas::EdgeCursor::setForAnyLabelsAndIdentifiers((degas::EdgeCursor *)v13, (const degas::Bitmap *)a2, (Bitmap *)a3, v7);
    while (1)
    {
      unsigned int v10 = degas::Statement::next((sqlite3_stmt **)v13[0]);
      if (v10 != 1) {
        break;
      }
      sqlite3_int64 v11 = sqlite3_column_int64(*(sqlite3_stmt **)v13[0], 0);
      degas::Bitmap::setBit(a4, v11);
    }
    if (v10 == 2) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v10;
    }
    degas::Cursor::~Cursor(v13);
  }
  return v9;
}

void sub_1D17A377C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void *std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target_type()
{
}

uint64_t std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::target(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), (uint64_t)"ZN5degas14EdgeLabelQuery23filterEdgesForAnyLabelsERKNS_6BitmapES3_RS1_E3$_0"))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::operator()(uint64_t a1, sqlite3_stmt ***a2, degas::Bitmap *a3)
{
}

void std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_1F2802B78;
}

void *std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_1F2802B78;
  return result;
}

void std::__function::__func<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0,std::allocator<degas::EdgeLabelQuery::filterEdgesForAnyLabels(degas::Bitmap const&,degas::Bitmap const&,degas::Bitmap&)::$_0>,void ()(degas::LabelCursor &,degas::Bitmap&)>::~__func()
{
}

uint64_t degas::EdgeFilter_Labels::resolveEdges(degas::EdgeFilter_Labels *this, degas::Bitmap *a2)
{
  uint64_t v3 = *((void *)this + 1);
  v7[0] = (const degas::EdgeTable *)(v3 + 248);
  v7[1] = (const degas::EdgeTable *)v3;
  uint64_t v4 = (degas::EdgeFilter_Labels *)((char *)this + 16);
  if (degas::Bitmap::count((degas::EdgeFilter_Labels *)((char *)this + 16)) != 1) {
    return degas::EdgeLabelQuery::edgesForAllLabels(v7, v4, a2, 0);
  }
  sqlite3_int64 Bit = degas::Bitmap::firstBit(v4);
  return degas::EdgeLabelQuery::edgesForLabel(v7, Bit, a2);
}

void degas::EdgeFilter_Labels::~EdgeFilter_Labels(degas::EdgeFilter_Labels *this)
{
  *(void *)this = &unk_1F2802C20;
  uint64_t v1 = (void **)((char *)this + 32);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1D25F9A90);
}

{
  void **v1;

  *(void *)this = &unk_1F2802C20;
  uint64_t v1 = (void **)((char *)this + 32);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v1;

  *(void *)this = &unk_1F2802C20;
  uint64_t v1 = (void **)((char *)this + 32);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
}

uint64_t degas::EdgeFilter_Attribute::resolveEdges(degas::EdgeFilter_Attribute *this, degas::Bitmap *a2)
{
  uint64_t v4 = (degas::Database *)*((void *)this + 1);
  v7[0] = (uint64_t)v4 + 528;
  v7[1] = degas::Database::edgeCount(v4);
  int v5 = *((_DWORD *)this + 4);
  switch(v5)
  {
    case 3:
      return degas::AttributeQuery::elementsForAttributeValue(v7, *((void *)this + 3), (uint64_t)this + 48, 1, a2);
    case 2:
      return degas::AttributeQuery::elementsForAttributeValue(v7, *((void *)this + 3), 1, a2, *((double *)this + 5));
    case 1:
      return degas::AttributeQuery::elementsForAttributeValue(v7, *((void *)this + 3), *((void *)this + 4), 1, a2);
  }
  return 3;
}

void degas::EdgeFilter_Attribute::~EdgeFilter_Attribute(void **this)
{
  *this = &unk_1F2802C48;
  if (*((char *)this + 71) < 0) {
    operator delete(this[6]);
  }
  JUMPOUT(0x1D25F9A90);
}

{
  *this = &unk_1F2802C48;
  if (*((char *)this + 71) < 0) {
    operator delete(this[6]);
  }
}

{
  *this = &unk_1F2802C48;
  if (*((char *)this + 71) < 0) {
    operator delete(this[6]);
  }
}

uint64_t degas::EdgeFilter_Or::resolveEdges(degas::EdgeFilter_Or *this, degas::Bitmap *a2)
{
  long long v14 = 0u;
  memset(v15, 0, 25);
  uint64_t v4 = (uint64_t *)*((void *)this + 2);
  int v5 = (uint64_t *)*((void *)this + 3);
  if (v4 == v5)
  {
LABEL_10:
    degas::Bitmap::operator=(a2, &v14);
    uint64_t v10 = 0;
  }
  else
  {
    while (1)
    {
      uint64_t v6 = *v4;
      uint64_t v7 = (std::__shared_weak_count *)v4[1];
      if (v7) {
        atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      long long v12 = 0u;
      memset(v13, 0, 25);
      uint64_t v8 = (*(uint64_t (**)(uint64_t, long long *))(*(void *)v6 + 16))(v6, &v12);
      int v9 = v8;
      uint64_t v10 = v8;
      if (!v8)
      {
        degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)&v14, (uint64_t)&v12);
        uint64_t v10 = v2;
      }
      long long v16 = (void **)v13;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v16);
      if (v7) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v7);
      }
      if (v9) {
        break;
      }
      v4 += 2;
      uint64_t v2 = v10;
      if (v4 == v5) {
        goto LABEL_10;
      }
    }
  }
  *(void *)&long long v12 = v15;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v12);
  return v10;
}

void sub_1D17A3F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  a9 = (void **)&a17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void degas::EdgeFilter_Or::~EdgeFilter_Or(degas::EdgeFilter_Or *this)
{
  *(void *)this = &unk_1F2802C70;
  uint64_t v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1D25F9A90);
}

{
  void **v1;

  *(void *)this = &unk_1F2802C70;
  uint64_t v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v1;

  *(void *)this = &unk_1F2802C70;
  uint64_t v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

uint64_t degas::EdgeFilter_And::resolveEdges(degas::EdgeFilter_And *this, degas::Bitmap *a2)
{
  long long v10 = 0u;
  memset(v11, 0, 25);
  uint64_t v3 = (void *)*((void *)this + 2);
  uint64_t v4 = (void *)*((void *)this + 3);
  if (v3 == v4)
  {
LABEL_8:
    degas::Bitmap::operator=(a2, &v10);
    uint64_t v6 = 0;
  }
  else
  {
    char v5 = 1;
    while (1)
    {
      long long v8 = 0u;
      memset(v9, 0, 25);
      uint64_t v6 = (*(uint64_t (**)(void, long long *))(*(void *)*v3 + 16))(*v3, &v8);
      if (v6) {
        break;
      }
      if (v5) {
        degas::Bitmap::operator=(&v10, &v8);
      }
      else {
        degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)&v10, (degas::Bitmap *)&v8);
      }
      long long v12 = (void **)v9;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v12);
      char v5 = 0;
      v3 += 2;
      if (v3 == v4) {
        goto LABEL_8;
      }
    }
    long long v12 = (void **)v9;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v12);
  }
  *(void *)&long long v8 = v11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
  return v6;
}

void sub_1D17A419C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  a9 = (void **)&a17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

void degas::EdgeFilter_And::~EdgeFilter_And(degas::EdgeFilter_And *this)
{
  *(void *)this = &unk_1F2802C98;
  uint64_t v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
  JUMPOUT(0x1D25F9A90);
}

{
  void **v1;

  *(void *)this = &unk_1F2802C98;
  uint64_t v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

{
  void **v1;

  *(void *)this = &unk_1F2802C98;
  uint64_t v1 = (void **)((char *)this + 16);
  std::vector<std::shared_ptr<degas::Predicate>>::__destroy_vector::operator()[abi:ne180100](&v1);
}

void *degas::EdgeFilter::EdgeFilter(void *result, uint64_t a2)
{
  void *result = &unk_1F2802BF8;
  result[1] = a2;
  return result;
}

degas::EdgeFilter_Labels *degas::EdgeFilter_Labels::EdgeFilter_Labels(degas::EdgeFilter_Labels *this, degas::Database *a2, long long **a3)
{
  *(void *)this = &unk_1F2802C20;
  *((void *)this + 1) = a2;
  *((void *)this + 2) = *a3;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 32, a3[2], a3[3], a3[3] - a3[2]);
  *((unsigned char *)this + 56) = *((unsigned char *)a3 + 40);
  return this;
}

{
  *(void *)this = &unk_1F2802C20;
  *((void *)this + 1) = a2;
  *((void *)this + 2) = *a3;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 32, a3[2], a3[3], a3[3] - a3[2]);
  *((unsigned char *)this + 56) = *((unsigned char *)a3 + 40);
  return this;
}

degas::EdgeFilter_Labels *degas::EdgeFilter_Labels::EdgeFilter_Labels(degas::EdgeFilter_Labels *this, degas::Database *a2, unint64_t a3)
{
  *(void *)this = &unk_1F2802C20;
  *((void *)this + 1) = a2;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)((char *)this + 41) = 0u;
  *((_OWORD *)this + 1) = 0u;
  degas::Bitmap::setBit((degas::EdgeFilter_Labels *)((char *)this + 16), a3);
  return this;
}

void sub_1D17A440C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  a10 = (void **)(v10 + 32);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

uint64_t degas::EdgeFilter_Labels::addLabel(degas::EdgeFilter_Labels *this, unint64_t a2)
{
  return degas::Bitmap::setBit((degas::EdgeFilter_Labels *)((char *)this + 16), a2);
}

double degas::EdgeFilter_Attribute::EdgeFilter_Attribute(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)a1 = &unk_1F2802C48;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = a3;
  *(void *)(a1 + 32) = a4;
  double result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  return result;
}

{
  double result;

  *(void *)a1 = &unk_1F2802C48;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = a3;
  *(void *)(a1 + 32) = a4;
  double result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  return result;
}

uint64_t degas::EdgeFilter_Attribute::EdgeFilter_Attribute(uint64_t result, uint64_t a2, uint64_t a3, double a4)
{
  *(void *)double result = &unk_1F2802C48;
  *(void *)(result + 8) = a2;
  *(_DWORD *)(result + 16) = 2;
  *(void *)(result + 24) = a3;
  *(void *)(result + 32) = 0;
  *(double *)(result + 40) = a4;
  *(void *)(result + 56) = 0;
  *(void *)(result + 64) = 0;
  *(void *)(result + 48) = 0;
  return result;
}

{
  *(void *)double result = &unk_1F2802C48;
  *(void *)(result + 8) = a2;
  *(_DWORD *)(result + 16) = 2;
  *(void *)(result + 24) = a3;
  *(void *)(result + 32) = 0;
  *(double *)(result + 40) = a4;
  *(void *)(result + 56) = 0;
  *(void *)(result + 64) = 0;
  *(void *)(result + 48) = 0;
  return result;
}

uint64_t degas::EdgeFilter_Attribute::EdgeFilter_Attribute(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4)
{
  *(void *)a1 = &unk_1F2802C48;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = 3;
  char v5 = (std::string *)(a1 + 48);
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 24) = a3;
  if (*((char *)a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)a4, *((void *)a4 + 1));
  }
  else
  {
    long long v6 = *a4;
    v5->__r_.__value_.__r.__words[2] = *((void *)a4 + 2);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  return a1;
}

void *degas::EdgeFilter_Or::EdgeFilter_Or(void *result, uint64_t a2)
{
  void *result = &unk_1F2802C70;
  result[1] = a2;
  result[3] = 0;
  result[4] = 0;
  result[2] = 0;
  return result;
}

{
  void *result = &unk_1F2802C70;
  result[1] = a2;
  result[3] = 0;
  result[4] = 0;
  result[2] = 0;
  return result;
}

void *degas::EdgeFilter_Or::EdgeFilter_Or(void *a1, uint64_t a2, void **a3)
{
  *a1 = &unk_1F2802C70;
  a1[1] = a2;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  std::vector<std::shared_ptr<degas::EdgeFilter>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::EdgeFilter>*,std::shared_ptr<degas::EdgeFilter>*>(a1 + 2, *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
  return a1;
}

{
  *a1 = &unk_1F2802C70;
  a1[1] = a2;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  std::vector<std::shared_ptr<degas::EdgeFilter>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::EdgeFilter>*,std::shared_ptr<degas::EdgeFilter>*>(a1 + 2, *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
  return a1;
}

void *std::vector<std::shared_ptr<degas::EdgeFilter>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::EdgeFilter>*,std::shared_ptr<degas::EdgeFilter>*>(void *result, void *a2, void *a3, unint64_t a4)
{
  if (a4)
  {
    if (a4 >> 60) {
      std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
    }
    long long v6 = result;
    double result = std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<degas::Predicate>>>(a4);
    void *v6 = result;
    v6[1] = result;
    for (v6[2] = &result[2 * v7]; a2 != a3; a2 += 2)
    {
      void *result = *a2;
      uint64_t v8 = a2[1];
      result[1] = v8;
      if (v8) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
      }
      result += 2;
    }
    v6[1] = result;
  }
  return result;
}

void sub_1D17A4784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

void degas::EdgeFilter_Or::addSubFilter(uint64_t a1, long long *a2)
{
}

void *degas::EdgeFilter_And::EdgeFilter_And(void *result, uint64_t a2)
{
  void *result = &unk_1F2802C98;
  result[1] = a2;
  result[3] = 0;
  result[4] = 0;
  result[2] = 0;
  return result;
}

{
  void *result = &unk_1F2802C98;
  result[1] = a2;
  result[3] = 0;
  result[4] = 0;
  result[2] = 0;
  return result;
}

void *degas::EdgeFilter_And::EdgeFilter_And(void *a1, uint64_t a2, void **a3)
{
  *a1 = &unk_1F2802C98;
  a1[1] = a2;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  std::vector<std::shared_ptr<degas::EdgeFilter>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::EdgeFilter>*,std::shared_ptr<degas::EdgeFilter>*>(a1 + 2, *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
  return a1;
}

{
  *a1 = &unk_1F2802C98;
  a1[1] = a2;
  a1[3] = 0;
  a1[4] = 0;
  a1[2] = 0;
  std::vector<std::shared_ptr<degas::EdgeFilter>>::__init_with_size[abi:ne180100]<std::shared_ptr<degas::EdgeFilter>*,std::shared_ptr<degas::EdgeFilter>*>(a1 + 2, *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
  return a1;
}

void degas::EdgeFilter_And::addSubFilter(uint64_t a1, long long *a2)
{
}

uint64_t degas::returnCodeFromSqlite(int a1, unsigned int a2)
{
  if (a1 == 101) {
    int v2 = 2;
  }
  else {
    int v2 = a2;
  }
  if (a1 == 100) {
    unsigned int v3 = 1;
  }
  else {
    unsigned int v3 = v2;
  }
  if (a1 == 17) {
    unsigned int v4 = 4;
  }
  else {
    unsigned int v4 = a2;
  }
  if (!a1) {
    unsigned int v4 = 0;
  }
  if (a1 <= 99) {
    return v4;
  }
  else {
    return v3;
  }
}

uint64_t degas::sqliteFlagFromDataProtectionClass(int a1)
{
  if ((a1 - 1) > 2) {
    return 0x100000;
  }
  else {
    return dword_1D17CF574[a1 - 1];
  }
}

degas::Database *degas::Database::Database(degas::Database *this)
{
  *((void *)this + 6) = 0;
  *((void *)this + 5) = (char *)this + 48;
  int v2 = (degas::Database *)((char *)this + 40);
  *((unsigned char *)this + 32) = 0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0x2800000000;
  *((void *)this + 9) = 0;
  degas::LabelTable::LabelTable((degas::Database *)((char *)this + 80), 0, (degas::Database *)((char *)this + 40));
  degas::MetadataTable::MetadataTable((degas::Database *)((char *)this + 136), 0, v2);
  std::string::basic_string[abi:ne180100]<0>(&v29, "Node");
  *((void *)this + 24) = &unk_1F2801DE0;
  char v3 = HIBYTE(v30);
  if (SHIBYTE(v30) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 200), (const std::string::value_type *)v29, *((std::string::size_type *)&v29 + 1));
    char v3 = HIBYTE(v30);
  }
  else
  {
    *(_OWORD *)((char *)this + 200) = v29;
    *((void *)this + 27) = v30;
  }
  *((void *)this + 28) = 0;
  *((void *)this + 29) = v2;
  *((void *)this + 24) = &unk_1F2802130;
  *((_WORD *)this + 120) = 262;
  if (v3 < 0) {
    operator delete((void *)v29);
  }
  std::string::basic_string[abi:ne180100]<0>(&v29, "Edge");
  *((void *)this + 31) = &unk_1F2801DE0;
  char v4 = HIBYTE(v30);
  if (SHIBYTE(v30) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 256), (const std::string::value_type *)v29, *((std::string::size_type *)&v29 + 1));
    char v4 = HIBYTE(v30);
  }
  else
  {
    *((_OWORD *)this + 16) = v29;
    *((void *)this + 34) = v30;
  }
  *((void *)this + 35) = 0;
  *((void *)this + 36) = v2;
  *((void *)this + 31) = &unk_1F2801EF8;
  *((_WORD *)this + 148) = 258;
  if (v4 < 0) {
    operator delete((void *)v29);
  }
  degas::AttributeTable::AttributeTable((degas::Database *)((char *)this + 304), 0, v2);
  std::string::basic_string[abi:ne180100]<0>(&v29, "NodeValue");
  *((void *)this + 45) = &unk_1F2801DE0;
  char v5 = (std::string *)((char *)this + 368);
  char v6 = HIBYTE(v30);
  if (SHIBYTE(v30) < 0)
  {
    std::string::__init_copy_ctor_external(v5, (const std::string::value_type *)v29, *((std::string::size_type *)&v29 + 1));
    char v6 = HIBYTE(v30);
  }
  else
  {
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v29;
    *((void *)this + 48) = v30;
  }
  *((void *)this + 49) = 0;
  *((void *)this + 50) = v2;
  *((void *)this + 45) = &unk_1F28013D0;
  *((unsigned char *)this + 408) = 7;
  if (v6 < 0) {
    operator delete((void *)v29);
  }
  std::string::basic_string[abi:ne180100]<0>(&v29, "EdgeValue");
  *((void *)this + 52) = &unk_1F2801DE0;
  uint64_t v7 = (std::string *)((char *)this + 424);
  char v8 = HIBYTE(v30);
  if (SHIBYTE(v30) < 0)
  {
    std::string::__init_copy_ctor_external(v7, (const std::string::value_type *)v29, *((std::string::size_type *)&v29 + 1));
    char v8 = HIBYTE(v30);
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v29;
    *((void *)this + 55) = v30;
  }
  *((void *)this + 56) = 0;
  *((void *)this + 57) = v2;
  *((void *)this + 52) = &unk_1F28013D0;
  *((unsigned char *)this + 464) = 3;
  if (v8 < 0) {
    operator delete((void *)v29);
  }
  std::string::basic_string[abi:ne180100]<0>(&v29, "NodeValue");
  *((void *)this + 59) = &unk_1F2801DE0;
  int v9 = (std::string *)((char *)this + 480);
  char v10 = HIBYTE(v30);
  if (SHIBYTE(v30) < 0)
  {
    std::string::__init_copy_ctor_external(v9, (const std::string::value_type *)v29, *((std::string::size_type *)&v29 + 1));
    char v10 = HIBYTE(v30);
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v29;
    *((void *)this + 62) = v30;
  }
  *((void *)this + 63) = 0;
  *((void *)this + 64) = v2;
  *((void *)this + 59) = &unk_1F28020E8;
  *((unsigned char *)this + 520) = 9;
  if (v10 < 0) {
    operator delete((void *)v29);
  }
  std::string::basic_string[abi:ne180100]<0>(&v29, "EdgeValue");
  *((void *)this + 66) = &unk_1F2801DE0;
  sqlite3_int64 v11 = (std::string *)((char *)this + 536);
  char v12 = HIBYTE(v30);
  if (SHIBYTE(v30) < 0)
  {
    std::string::__init_copy_ctor_external(v11, (const std::string::value_type *)v29, *((std::string::size_type *)&v29 + 1));
    char v12 = HIBYTE(v30);
  }
  else
  {
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v29;
    *((void *)this + 69) = v30;
  }
  *((void *)this + 70) = 0;
  *((void *)this + 71) = v2;
  *((void *)this + 66) = &unk_1F28020E8;
  *((unsigned char *)this + 576) = 10;
  if (v12 < 0) {
    operator delete((void *)v29);
  }
  std::string::basic_string[abi:ne180100]<0>(&v29, "NodeValue");
  *((void *)this + 73) = &unk_1F2801DE0;
  unsigned __int8 v13 = (std::string *)((char *)this + 592);
  char v14 = HIBYTE(v30);
  if (SHIBYTE(v30) < 0)
  {
    std::string::__init_copy_ctor_external(v13, (const std::string::value_type *)v29, *((std::string::size_type *)&v29 + 1));
    char v14 = HIBYTE(v30);
  }
  else
  {
    *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v29;
    *((void *)this + 76) = v30;
  }
  *((void *)this + 77) = 0;
  *((void *)this + 78) = v2;
  *((void *)this + 73) = &unk_1F2800F20;
  *((unsigned char *)this + 632) = 11;
  if (v14 < 0) {
    operator delete((void *)v29);
  }
  std::string::basic_string[abi:ne180100]<0>(&v29, "EdgeValue");
  *((void *)this + 80) = &unk_1F2801DE0;
  char v15 = (std::string *)((char *)this + 648);
  char v16 = HIBYTE(v30);
  if (SHIBYTE(v30) < 0)
  {
    std::string::__init_copy_ctor_external(v15, (const std::string::value_type *)v29, *((std::string::size_type *)&v29 + 1));
    char v16 = HIBYTE(v30);
  }
  else
  {
    *(_OWORD *)&v15->__r_.__value_.__l.__data_ = v29;
    *((void *)this + 83) = v30;
  }
  *((void *)this + 84) = 0;
  *((void *)this + 85) = v2;
  *((void *)this + 80) = &unk_1F2800F20;
  *((unsigned char *)this + 688) = 12;
  if (v16 < 0) {
    operator delete((void *)v29);
  }
  degas::TransactionLogTable::TransactionLogTable((degas::Database *)((char *)this + 696), 0, v2);
  degas::ClientLogTable::ClientLogTable((degas::Database *)((char *)this + 752), 0, v2);
  std::string::basic_string[abi:ne180100]<0>(&v29, "TombstoneNode");
  *((void *)this + 101) = &unk_1F2801DE0;
  uint64_t v17 = (std::string *)((char *)this + 816);
  char v18 = HIBYTE(v30);
  if (SHIBYTE(v30) < 0)
  {
    std::string::__init_copy_ctor_external(v17, (const std::string::value_type *)v29, *((std::string::size_type *)&v29 + 1));
    char v18 = HIBYTE(v30);
  }
  else
  {
    *(_OWORD *)&v17->__r_.__value_.__l.__data_ = v29;
    *((void *)this + 104) = v30;
  }
  *((void *)this + 105) = 0;
  *((void *)this + 106) = v2;
  *((void *)this + 101) = &unk_1F2802130;
  *((_WORD *)this + 428) = 15;
  if (v18 < 0) {
    operator delete((void *)v29);
  }
  std::string::basic_string[abi:ne180100]<0>(&v29, "TombstoneEdge");
  *((void *)this + 108) = &unk_1F2801DE0;
  uint64_t v19 = (std::string *)((char *)this + 872);
  char v20 = HIBYTE(v30);
  if (SHIBYTE(v30) < 0)
  {
    std::string::__init_copy_ctor_external(v19, (const std::string::value_type *)v29, *((std::string::size_type *)&v29 + 1));
    char v20 = HIBYTE(v30);
  }
  else
  {
    *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v29;
    *((void *)this + 111) = v30;
  }
  *((void *)this + 112) = 0;
  *((void *)this + 113) = v2;
  *((void *)this + 108) = &unk_1F2801EF8;
  *((_WORD *)this + 456) = 16;
  if (v20 < 0) {
    operator delete((void *)v29);
  }
  std::string::basic_string[abi:ne180100]<0>(&v29, "TombstoneNodeValue");
  *((void *)this + 115) = &unk_1F2801DE0;
  char v21 = HIBYTE(v30);
  if (SHIBYTE(v30) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 928), (const std::string::value_type *)v29, *((std::string::size_type *)&v29 + 1));
    char v21 = HIBYTE(v30);
  }
  else
  {
    *((_OWORD *)this + 58) = v29;
    *((void *)this + 118) = v30;
  }
  *((void *)this + 119) = 0;
  *((void *)this + 120) = v2;
  *((void *)this + 115) = &unk_1F28013D0;
  *((unsigned char *)this + 968) = 17;
  if (v21 < 0) {
    operator delete((void *)v29);
  }
  std::string::basic_string[abi:ne180100]<0>(&v29, "TombstoneEdgeValue");
  *((void *)this + 122) = &unk_1F2801DE0;
  char v22 = HIBYTE(v30);
  if (SHIBYTE(v30) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)this + 41, (const std::string::value_type *)v29, *((std::string::size_type *)&v29 + 1));
    char v22 = HIBYTE(v30);
  }
  else
  {
    *(_OWORD *)((char *)this + 984) = v29;
    *((void *)this + 125) = v30;
  }
  *((void *)this + 126) = 0;
  *((void *)this + 127) = v2;
  *((void *)this + 122) = &unk_1F28013D0;
  *((unsigned char *)this + 1024) = 18;
  if (v22 < 0) {
    operator delete((void *)v29);
  }
  std::string::basic_string[abi:ne180100]<0>(&v29, "TombstoneNodeValue");
  *((void *)this + 129) = &unk_1F2801DE0;
  char v23 = HIBYTE(v30);
  if (SHIBYTE(v30) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 1040), (const std::string::value_type *)v29, *((std::string::size_type *)&v29 + 1));
    char v23 = HIBYTE(v30);
  }
  else
  {
    *((_OWORD *)this + 65) = v29;
    *((void *)this + 132) = v30;
  }
  *((void *)this + 133) = 0;
  *((void *)this + 134) = v2;
  *((void *)this + 129) = &unk_1F28020E8;
  *((unsigned char *)this + 1080) = 19;
  if (v23 < 0) {
    operator delete((void *)v29);
  }
  std::string::basic_string[abi:ne180100]<0>(&v29, "TombstoneEdgeValue");
  *((void *)this + 136) = &unk_1F2801DE0;
  char v24 = HIBYTE(v30);
  if (SHIBYTE(v30) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 1096), (const std::string::value_type *)v29, *((std::string::size_type *)&v29 + 1));
    char v24 = HIBYTE(v30);
  }
  else
  {
    *(_OWORD *)((char *)this + 1096) = v29;
    *((void *)this + 139) = v30;
  }
  *((void *)this + 140) = 0;
  *((void *)this + 141) = v2;
  *((void *)this + 136) = &unk_1F28020E8;
  *((unsigned char *)this + 1136) = 20;
  if (v24 < 0) {
    operator delete((void *)v29);
  }
  degas::LabelledEdgeTable::LabelledEdgeTable((degas::Database *)((char *)this + 1144), 0, v2);
  *((_OWORD *)this + 75) = 0u;
  std::string::basic_string[abi:ne180100]<0>(&v29, "identifierBitmap");
  if (SHIBYTE(v30) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 1216), (const std::string::value_type *)v29, *((std::string::size_type *)&v29 + 1));
    int v25 = SHIBYTE(v30);
    *((void *)this + 155) = 0;
    if (v25 < 0) {
      operator delete((void *)v29);
    }
  }
  else
  {
    *((_OWORD *)this + 76) = v29;
    *((void *)this + 154) = v30;
    *((void *)this + 155) = 0;
  }
  std::string::basic_string[abi:ne180100]<0>(&v29, "valueArray");
  uint64_t v26 = (std::string *)((char *)this + 1248);
  if (SHIBYTE(v30) < 0)
  {
    std::string::__init_copy_ctor_external(v26, (const std::string::value_type *)v29, *((std::string::size_type *)&v29 + 1));
    int v27 = SHIBYTE(v30);
    *((void *)this + 159) = 0;
    if (v27 < 0) {
      operator delete((void *)v29);
    }
  }
  else
  {
    *(_OWORD *)&v26->__r_.__value_.__l.__data_ = v29;
    *((void *)this + 158) = v30;
    *((void *)this + 159) = 0;
  }
  *((void *)this + 161) = -1;
  *((void *)this + 160) = -1;
  *((_DWORD *)this + 324) = 0;
  *(_OWORD *)((char *)this + 1336) = 0u;
  *((void *)this + 163) = 0;
  *((void *)this + 165) = 0;
  *((void *)this + 164) = 0;
  *((unsigned char *)this + 1328) = 0;
  *((_DWORD *)this + 338) = 3;
  *((_WORD *)this + 678) = 0;
  *((_OWORD *)this + 85) = 0u;
  *((_OWORD *)this + 86) = 0u;
  *(_OWORD *)((char *)this + 1385) = 0u;
  *((_OWORD *)this + 88) = 0u;
  *((_OWORD *)this + 89) = 0u;
  *(_OWORD *)((char *)this + 1433) = 0u;
  *((_OWORD *)this + 92) = 0u;
  *((_OWORD *)this + 91) = 0u;
  *(_OWORD *)((char *)this + 1481) = 0u;
  *(_OWORD *)((char *)this + 1529) = 0u;
  *((_OWORD *)this + 95) = 0u;
  *((_OWORD *)this + 94) = 0u;
  *((_OWORD *)this + 97) = 0u;
  *((_OWORD *)this + 98) = 0u;
  *(_OWORD *)((char *)this + 1577) = 0u;
  *((_OWORD *)this + 100) = 0u;
  *((_OWORD *)this + 101) = 0u;
  *(_OWORD *)((char *)this + 1625) = 0u;
  *((_OWORD *)this + 103) = 0u;
  *((_OWORD *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 1673) = 0u;
  return this;
}

void sub_1D17A54D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void **a11, uint64_t a12, void **a13, uint64_t a14, void **a15, uint64_t a16, void **a17, uint64_t a18, void **a19, uint64_t a20,void **a21,uint64_t a22,void **a23,uint64_t a24,void **a25,uint64_t a26,void **a27,uint64_t a28,void **a29,uint64_t a30)
{
  if (*(char *)(v39 - 89) < 0) {
    operator delete(*(void **)(v39 - 112));
  }
  if (*(char *)(v30 + 1239) < 0) {
    operator delete(*v36);
  }
  *(void *)(v30 + 1144) = &unk_1F2801DE0;
  *(void *)(v30 + 1176) = 0;
  if (*(char *)(v30 + 1175) < 0) {
    operator delete(*(void **)(v30 + 1152));
  }
  *(void *)(v30 + 1088) = v33;
  *(void *)(v30 + 1120) = 0;
  if (*(char *)(v30 + 1119) < 0) {
    operator delete(*v31);
  }
  *(void *)(v30 + 1032) = v37;
  *(void *)(v30 + 1064) = 0;
  if (*(char *)(v30 + 1063) < 0) {
    operator delete(*v35);
  }
  *(void *)(v30 + 976) = v34;
  *(void *)(v30 + 1008) = 0;
  if (*(char *)(v30 + 1007) < 0) {
    operator delete(*v32);
  }
  *(void *)(v30 + 920) = a12;
  *(void *)(v30 + 952) = 0;
  if (*(char *)(v30 + 951) < 0) {
    operator delete(*v38);
  }
  *(void *)(v30 + 864) = a14;
  *(void *)(v30 + 896) = 0;
  if (*(char *)(v30 + 895) < 0) {
    operator delete(*a11);
  }
  *(void *)(v30 + 808) = a16;
  *(void *)(v30 + 840) = 0;
  if (*(char *)(v30 + 839) < 0) {
    operator delete(*a13);
  }
  *(void *)(v30 + 752) = &unk_1F2801DE0;
  *(void *)(v30 + 784) = 0;
  if (*(char *)(v30 + 783) < 0) {
    operator delete(*(void **)(v30 + 760));
  }
  *(void *)(v30 + 696) = &unk_1F2801DE0;
  *(void *)(v30 + 728) = 0;
  if (*(char *)(v30 + 727) < 0) {
    operator delete(*(void **)(v30 + 704));
  }
  *(void *)(v30 + 640) = a22;
  *(void *)(v30 + 672) = 0;
  if (*(char *)(v30 + 671) < 0) {
    operator delete(*a15);
  }
  *(void *)(v30 + 584) = a24;
  *(void *)(v30 + 616) = 0;
  if (*(char *)(v30 + 615) < 0) {
    operator delete(*a17);
  }
  *(void *)(v30 + 528) = a26;
  *(void *)(v30 + 560) = 0;
  if (*(char *)(v30 + 559) < 0) {
    operator delete(*a19);
  }
  *(void *)(v30 + 472) = a28;
  *(void *)(v30 + 504) = 0;
  if (*(char *)(v30 + 503) < 0) {
    operator delete(*a21);
  }
  *(void *)(v30 + 416) = a30;
  *(void *)(v30 + 448) = 0;
  if (*(char *)(v30 + 447) < 0) {
    operator delete(*a23);
  }
  *(void *)(v30 + 360) = *(void *)(v39 - 160);
  *(void *)(v30 + 392) = 0;
  if (*(char *)(v30 + 391) < 0) {
    operator delete(*a25);
  }
  *(void *)(v30 + 304) = &unk_1F2801DE0;
  *(void *)(v30 + 336) = 0;
  if (*(char *)(v30 + 335) < 0) {
    operator delete(*(void **)(v30 + 312));
  }
  *(void *)(v30 + 248) = *(void *)(v39 - 144);
  *(void *)(v30 + 280) = 0;
  if (*(char *)(v30 + 279) < 0) {
    operator delete(*a27);
  }
  *(void *)(v30 + 192) = *(void *)(v39 - 136);
  *(void *)(v30 + 224) = 0;
  if (*(char *)(v30 + 223) < 0) {
    operator delete(*a29);
  }
  *(void *)(v30 + 136) = &unk_1F2801DE0;
  *(void *)(v30 + 168) = 0;
  if (*(char *)(v30 + 167) < 0) {
    operator delete(*(void **)(v30 + 144));
  }
  *(void *)(v30 + 80) = &unk_1F2801DE0;
  *(void *)(v30 + 112) = 0;
  if (*(char *)(v30 + 111) < 0) {
    operator delete(*(void **)(v30 + 88));
  }
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>>>::destroy(*(void **)(v30 + 48));
  if (*(char *)(v30 + 23) < 0) {
    operator delete(*(void **)v30);
  }
  _Unwind_Resume(a1);
}

void sub_1D17A5950()
{
}

void sub_1D17A5958()
{
}

void sub_1D17A5960()
{
}

void sub_1D17A5968()
{
}

void sub_1D17A5970()
{
}

void sub_1D17A5978()
{
}

void sub_1D17A5980()
{
}

void sub_1D17A5988()
{
}

void sub_1D17A5990()
{
}

void sub_1D17A5998()
{
}

void sub_1D17A59A0()
{
}

void sub_1D17A59A8()
{
}

void sub_1D17A59B0()
{
}

void sub_1D17A59B8()
{
}

void sub_1D17A59C0()
{
}

void sub_1D17A59C8()
{
}

void degas::Database::TransactionChanges::~TransactionChanges(degas::Database::TransactionChanges *this)
{
  int v2 = (void **)((char *)this + 256);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
  int v2 = (void **)((char *)this + 208);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
  int v2 = (void **)((char *)this + 160);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
  int v2 = (void **)((char *)this + 112);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
  int v2 = (void **)((char *)this + 64);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
  int v2 = (void **)((char *)this + 16);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v2);
}

void degas::Database::~Database(void **this)
{
  degas::Database::close((degas::Database *)this);
  char v3 = this + 208;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v3);
  char v3 = this + 202;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v3);
  char v3 = this + 196;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v3);
  char v3 = this + 190;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v3);
  char v3 = this + 184;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v3);
  char v3 = this + 178;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v3);
  char v3 = this + 172;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v3);
  int v2 = (std::__shared_weak_count *)this[168];
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  if (*((char *)this + 1327) < 0) {
    operator delete(this[163]);
  }
  if (*((char *)this + 1271) < 0) {
    operator delete(this[156]);
  }
  if (*((char *)this + 1239) < 0) {
    operator delete(this[152]);
  }
  this[143] = &unk_1F2801DE0;
  this[147] = 0;
  if (*((char *)this + 1175) < 0) {
    operator delete(this[144]);
  }
  this[136] = &unk_1F2801DE0;
  this[140] = 0;
  if (*((char *)this + 1119) < 0) {
    operator delete(this[137]);
  }
  this[129] = &unk_1F2801DE0;
  this[133] = 0;
  if (*((char *)this + 1063) < 0) {
    operator delete(this[130]);
  }
  this[122] = &unk_1F2801DE0;
  this[126] = 0;
  if (*((char *)this + 1007) < 0) {
    operator delete(this[123]);
  }
  this[115] = &unk_1F2801DE0;
  this[119] = 0;
  if (*((char *)this + 951) < 0) {
    operator delete(this[116]);
  }
  this[108] = &unk_1F2801DE0;
  this[112] = 0;
  if (*((char *)this + 895) < 0) {
    operator delete(this[109]);
  }
  this[101] = &unk_1F2801DE0;
  this[105] = 0;
  if (*((char *)this + 839) < 0) {
    operator delete(this[102]);
  }
  this[94] = &unk_1F2801DE0;
  this[98] = 0;
  if (*((char *)this + 783) < 0) {
    operator delete(this[95]);
  }
  this[87] = &unk_1F2801DE0;
  this[91] = 0;
  if (*((char *)this + 727) < 0) {
    operator delete(this[88]);
  }
  this[80] = &unk_1F2801DE0;
  this[84] = 0;
  if (*((char *)this + 671) < 0) {
    operator delete(this[81]);
  }
  this[73] = &unk_1F2801DE0;
  this[77] = 0;
  if (*((char *)this + 615) < 0) {
    operator delete(this[74]);
  }
  this[66] = &unk_1F2801DE0;
  this[70] = 0;
  if (*((char *)this + 559) < 0) {
    operator delete(this[67]);
  }
  this[59] = &unk_1F2801DE0;
  this[63] = 0;
  if (*((char *)this + 503) < 0) {
    operator delete(this[60]);
  }
  this[52] = &unk_1F2801DE0;
  this[56] = 0;
  if (*((char *)this + 447) < 0) {
    operator delete(this[53]);
  }
  this[45] = &unk_1F2801DE0;
  this[49] = 0;
  if (*((char *)this + 391) < 0) {
    operator delete(this[46]);
  }
  this[38] = &unk_1F2801DE0;
  this[42] = 0;
  if (*((char *)this + 335) < 0) {
    operator delete(this[39]);
  }
  this[31] = &unk_1F2801DE0;
  this[35] = 0;
  if (*((char *)this + 279) < 0) {
    operator delete(this[32]);
  }
  this[24] = &unk_1F2801DE0;
  this[28] = 0;
  if (*((char *)this + 223) < 0) {
    operator delete(this[25]);
  }
  this[17] = &unk_1F2801DE0;
  this[21] = 0;
  if (*((char *)this + 167) < 0) {
    operator delete(this[18]);
  }
  this[10] = &unk_1F2801DE0;
  this[14] = 0;
  if (*((char *)this + 111) < 0) {
    operator delete(this[11]);
  }
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>>>::destroy(this[6]);
  if (*((char *)this + 23) < 0) {
    operator delete(*this);
  }
}

uint64_t degas::Database::close(degas::Database *this)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v2 = (degas::Statement *)*((void *)this + 150);
  if (v2)
  {
    degas::Statement::~Statement(v2);
    MEMORY[0x1D25F9A90]();
    *((void *)this + 150) = 0;
  }
  char v3 = (degas::Statement *)*((void *)this + 151);
  if (v3)
  {
    degas::Statement::~Statement(v3);
    MEMORY[0x1D25F9A90]();
    *((void *)this + 151) = 0;
  }
  degas::StatementCache::purgeAllStatements((os_unfair_lock_s *)this + 10);
  char v4 = (std::__shared_weak_count *)*((void *)this + 168);
  *(_OWORD *)((char *)this + 1336) = 0u;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  char v5 = (sqlite3 *)*((void *)this + 3);
  if (v5)
  {
    if (!*((unsigned char *)this + 32))
    {
      *(void *)pnCkpt = 0;
      sqlite3_wal_checkpoint_v2(v5, 0, 0, &pnCkpt[1], pnCkpt);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        int v10 = pnCkpt[1];
        __int16 v11 = 1024;
        int v12 = pnCkpt[0];
        _os_log_debug_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "[KGDB] checkpoint on closing, total wal pages %d, checkpointed %d", buf, 0xEu);
      }
      sqlite3_exec(*((sqlite3 **)this + 3), "pragma incremental_vacuum(3)", 0, 0, 0);
      char v5 = (sqlite3 *)*((void *)this + 3);
    }
    char v6 = (degas *)sqlite3_close(v5);
    if (degas::sDatabasePathTracking == 1 && *((unsigned char *)this + 1328))
    {
      degas::databaseMap(v6);
      degas::DatabaseMap::deregisterDatabase((uint64_t)&degas::databaseMap(void)::databaseMap, (uint64_t *)this, (uint64_t *)this);
    }
    *((void *)this + 3) = 0;
    degas::Database::updateTableInstances(this);
  }
  return 0;
}

void degas::databaseMap(degas *this)
{
  {
    qword_1EA6569A8 = 0;
    degas::databaseMap(void)::databaseMap = (uint64_t)&qword_1EA6569A8;
    qword_1EA6569C8 = 0;
    qword_1EA6569C0 = 0;
    qword_1EA6569B0 = 0;
    unk_1EA6569B8 = &qword_1EA6569C0;
    dword_1EA6569D0 = 0;
    __cxa_atexit((void (*)(void *))degas::DatabaseMap::~DatabaseMap, &degas::databaseMap(void)::databaseMap, &dword_1D1654000);
  }
}

void *degas::Database::updateTableInstances(void *this)
{
  uint64_t v1 = this[3];
  this[14] = v1;
  this[21] = v1;
  this[28] = v1;
  this[35] = v1;
  this[42] = v1;
  this[49] = v1;
  this[56] = v1;
  this[63] = v1;
  this[70] = v1;
  this[77] = v1;
  this[84] = v1;
  this[105] = v1;
  this[112] = v1;
  this[119] = v1;
  this[126] = v1;
  this[133] = v1;
  this[140] = v1;
  this[91] = v1;
  this[98] = v1;
  this[155] = v1;
  this[159] = v1;
  this[147] = v1;
  return this;
}

void degas::DatabaseMap::~DatabaseMap(degas::DatabaseMap *this)
{
}

void std::__tree<std::__value_type<std::string,degas::Database *>,std::__map_value_compare<std::string,std::__value_type<std::string,degas::Database *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,degas::Database *>>>::destroy(char *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,degas::Database *>,std::__map_value_compare<std::string,std::__value_type<std::string,degas::Database *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,degas::Database *>>>::destroy(*(void *)a1);
    std::__tree<std::__value_type<std::string,degas::Database *>,std::__map_value_compare<std::string,std::__value_type<std::string,degas::Database *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,degas::Database *>>>::destroy(*((void *)a1 + 1));
    if (a1[55] < 0) {
      operator delete(*((void **)a1 + 4));
    }
    operator delete(a1);
  }
}

void degas::Database::setEnableQueryLogging(degas::Database *this)
{
  degas::sQueryLogging = 1;
}

void degas::Database::setEnableQueryProfiling(degas::Database *this)
{
  degas::sQueryProfiling = 1;
}

void degas::Database::setEnableDatabasePathTracking(degas::Database *this)
{
  degas::sDatabasePathTracking = 1;
}

void degas::Database::setEnableInsertLabelTracking(degas::Database *this)
{
  degas::sDatabaseInsertLabelTracking = 1;
}

void degas::Database::setEnableLabelReferenceChecking(degas::Database *this)
{
  degas::sDatabaseLabelReferenceChecking = 1;
}

uint64_t degas::Database::setEnableChangeTracking(uint64_t this)
{
  *(_WORD *)(this + 1356) |= 0x10u;
  return this;
}

uint64_t degas::Database::setDeliberateFail(uint64_t this)
{
  *(_WORD *)(this + 1356) |= 8u;
  return this;
}

uint64_t degas::Database::setEnableLabelElementCache(uint64_t this)
{
  *(_WORD *)(this + 1356) |= 2u;
  return this;
}

uint64_t degas::Database::setDisableLabelElementCache(uint64_t this)
{
  *(_WORD *)(this + 1356) ^= 2u;
  return this;
}

uint64_t degas::Database::setTraceCallback(uint64_t this)
{
  if ((degas::sQueryProfiling & 1) != 0 || degas::sQueryLogging)
  {
    if (degas::sQueryProfiling) {
      unsigned int v1 = degas::sQueryLogging | 2;
    }
    else {
      unsigned int v1 = degas::sQueryLogging;
    }
    return sqlite3_trace_v2(*(sqlite3 **)(this + 24), v1, (int (__cdecl *)(unsigned int, void *, void *, void *))degas::degasTraceHandler, 0);
  }
  return this;
}

uint64_t degas::degasTraceHandler(degas *this, unsigned int a2, sqlite3_stmt *pStmt, uint64_t *a4, void *a5)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (this == 2)
  {
    uint64_t v6 = *a4;
    uint64_t v7 = sqlite3_expanded_sql(pStmt);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v9 = 134218242;
      double v10 = (double)v6 * 0.000000001;
      __int16 v11 = 2080;
      int v12 = v7;
      _os_log_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "timing:%lfs  sql:%s", (uint8_t *)&v9, 0x16u);
    }
    sqlite3_free(v7);
  }
  else if (this == 1 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    double v10 = *(double *)&a4;
    _os_log_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "sql:%s", (uint8_t *)&v9, 0xCu);
  }
  return 0;
}

void degas::Database::setDataProtectionClass(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 24) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)char v4 = 0;
    _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "trying to set data protection class after database is open - that isn't going to work", v4, 2u);
  }
  *(_DWORD *)(a1 + 1352) = a2;
}

uint64_t degas::Database::isReadOnly(degas::Database *this)
{
  return *((unsigned __int8 *)this + 32);
}

uint64_t degas::Database::openReadOnly(std::string::size_type a1, std::string::size_type a2)
{
  std::string::size_type v2 = a2;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = *(_DWORD *)(a1 + 1352);
  if (*(char *)(a2 + 23) < 0) {
    a2 = *(void *)a2;
  }
  if (kgWaitForProtectedAccess(v4, (const char *)a2) == 1)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 1352) - 1;
    if (v5 > 2) {
      int v6 = 1048577;
    }
    else {
      int v6 = dword_1D17CF580[v5];
    }
    std::string::operator=((std::string *)a1, (const std::string *)v2);
    *(unsigned char *)(a1 + 32) = 1;
    if (*(char *)(v2 + 23) >= 0) {
      uint64_t v7 = (const char *)v2;
    }
    else {
      uint64_t v7 = *(const char **)v2;
    }
    char v8 = (sqlite3 **)(a1 + 24);
    int v9 = (degas *)sqlite3_open_v2(v7, (sqlite3 **)(a1 + 24), v6, 0);
    if (!v9)
    {
      if (degas::sDatabasePathTracking == 1)
      {
        degas::databaseMap(v9);
        degas::DatabaseMap::registerDatabase((void **)&degas::databaseMap(void)::databaseMap, v2, a1);
        *(unsigned char *)(a1 + 1328) = 1;
      }
      sqlite3_extended_result_codes(*(sqlite3 **)(a1 + 24), 1);
      sqlite3_busy_handler(*(sqlite3 **)(a1 + 24), (int (__cdecl *)(void *, int))degas::busyHandler, 0);
      degas::Database::setTraceCallback(a1);
      degas::Database::updateTableInstances((void *)a1);
      degas::Database::beginTransaction((sqlite3 **)a1);
      if (!degas::Database::checkSchema((degas::Database *)a1, 0)) {
        goto LABEL_27;
      }
      *(void *)buf = 0;
      int v10 = degas::Database::metadataValue((degas::Database *)a1, 3, (sqlite3_int64 *)buf);
      if (v10)
      {
        if (v10)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
            goto LABEL_27;
          }
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = 1;
          char v16 = MEMORY[0x1E4F14500];
          uint64_t v17 = "failed to read database format version, unable to open rc=%d";
LABEL_44:
          _os_log_error_impl(&dword_1D1654000, v16, OS_LOG_TYPE_ERROR, v17, buf, 8u);
          goto LABEL_27;
        }
      }
      else
      {
        int v11 = *(_DWORD *)buf;
        if (*(_DWORD *)buf)
        {
LABEL_23:
          if (v11 == 8)
          {
            BOOL v20 = 0;
            *(void *)buf = 0;
            uint64_t v24 = 0;
            uint64_t v25 = 0;
            int DatabaseHealth = degas::Database::getDatabaseHealth((degas::Database *)a1, &v20, (uint64_t)buf);
            if (v20)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                uint64_t v19 = buf;
                if (v25 < 0) {
                  uint64_t v19 = *(uint8_t **)buf;
                }
                *(_DWORD *)char v21 = 136315138;
                char v22 = v19;
                _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "not opening graph database for read due to fatal problem: %s", v21, 0xCu);
              }
              int v13 = 9;
            }
            else
            {
              int v13 = DatabaseHealth;
            }
            if (SHIBYTE(v25) < 0) {
              operator delete(*(void **)buf);
            }
            if (!v13)
            {
              int AggregateFunctions = degas::Database::createAggregateFunctions((sqlite3 **)a1);
              if (!AggregateFunctions)
              {
                int collation = sqlite3_create_collation(*v8, "nocasenodiacritics", 1, 0, (int (__cdecl *)(void *, int, const void *, int, const void *))degas::noCaseNoDiacriticsCollation);
                if (!collation || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
                  goto LABEL_27;
                }
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = collation;
                char v16 = MEMORY[0x1E4F14500];
                uint64_t v17 = "failed to add collations, unable to open rc=%d";
                goto LABEL_44;
              }
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = AggregateFunctions;
                char v16 = MEMORY[0x1E4F14500];
                uint64_t v17 = "failed to create sqlite functions and aggregates, unable to open rc=%d";
                goto LABEL_44;
              }
            }
          }
LABEL_27:
          degas::Database::commitTransaction((degas::Database *)a1);
          if ((*(_WORD *)(a1 + 1356) & 2) == 0) {
            operator new();
          }
          operator new();
        }
      }
      int v11 = *(_DWORD *)(a1 + 1296);
      if (v11 == 2) {
        goto LABEL_27;
      }
      goto LABEL_23;
    }
    if (*v8) {
      degas::Database::close((degas::Database *)a1);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to get data protected access to graph database file", buf, 2u);
  }
  return 3;
}

void sub_1D17A69D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t degas::Database::beginTransaction(sqlite3 **this)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  std::string::size_type v2 = (sqlite3_stmt **)degas::Database::beginStatement((degas::Database *)this);
  uint64_t v3 = degas::Statement::update(v2);
  if (v3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v6 = sqlite3_errmsg(this[3]);
    int v7 = 136315138;
    char v8 = v6;
    _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "begin failed: %s", (uint8_t *)&v7, 0xCu);
  }
  unsigned int v4 = this[167];
  if (v4) {
    (*(void (**)(sqlite3 *))(*(void *)v4 + 48))(v4);
  }
  return v3;
}

BOOL degas::Database::checkSchema(degas::Database *this, int a2)
{
  if (*((unsigned char *)this + 32) && (a2 & 1) != 0) {
    return 0;
  }
  int v5 = a2 ^ 1;
  BOOL v6 = degas::Table::checkTableExists((degas::Database *)((char *)this + 80));
  BOOL v7 = v6;
  if ((v6 | v5))
  {
    int Table = 0;
    int v9 = v6 | a2;
  }
  else
  {
    int Table = degas::LabelTable::createTable((degas::Database *)((char *)this + 80));
    int v9 = a2;
  }
  BOOL result = 0;
  if (v9 && !Table)
  {
    BOOL v10 = degas::Table::checkTableExists((degas::Database *)((char *)this + 136));
    if ((v10 | v5))
    {
      int v11 = v10;
      int v12 = 0;
      int v13 = !v7 || !v10;
    }
    else
    {
      int v12 = degas::MetadataTable::createTable((degas::Database *)((char *)this + 136));
      int v11 = 1;
      int v13 = 1;
    }
    BOOL result = 0;
    if (v11)
    {
      if (!v12)
      {
        if ((*((_WORD *)this + 678) & 8) != 0)
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "simulated failure");
          degas::Database::setDatabaseFatalProblem((uint64_t)this, (uint64_t *)__p);
          if (v23 < 0) {
            operator delete(__p[0]);
          }
          return 0;
        }
        if (degas::Table::checkTableExists((degas::Database *)((char *)this + 192)))
        {
          char v14 = (degas::Database *)((char *)this + 248);
          if (degas::Table::checkTableExists((degas::Database *)((char *)this + 248))) {
            goto LABEL_27;
          }
          if (!a2) {
            return 0;
          }
        }
        else
        {
          if (!a2 || degas::NodeTable::createTable((degas::Database *)((char *)this + 192))) {
            return 0;
          }
          char v14 = (degas::Database *)((char *)this + 248);
          if (degas::Table::checkTableExists((degas::Database *)((char *)this + 248)))
          {
LABEL_26:
            int v13 = 1;
LABEL_27:
            if (degas::Table::checkTableExists((degas::Database *)((char *)this + 304)))
            {
              char v15 = (degas::Database *)((char *)this + 360);
              if (degas::Table::checkTableExists((degas::Database *)((char *)this + 360)))
              {
LABEL_29:
                int v16 = 0;
                goto LABEL_30;
              }
              if (!a2) {
                return 0;
              }
            }
            else
            {
              if (!a2 || degas::AttributeTable::createTable((degas::Database *)((char *)this + 304))) {
                return 0;
              }
              char v15 = (degas::Database *)((char *)this + 360);
              int v13 = 1;
              if (degas::Table::checkTableExists((degas::Database *)((char *)this + 360))) {
                goto LABEL_29;
              }
            }
            if (degas::AttributeValueTable::createTable(v15)) {
              return 0;
            }
            int v16 = 1;
LABEL_30:
            if (degas::Table::checkTableExists((degas::Database *)((char *)this + 416)))
            {
              uint64_t v17 = (degas::Database *)((char *)this + 696);
              if (degas::Table::checkTableExists((degas::Database *)((char *)this + 696))) {
                goto LABEL_45;
              }
              if (!a2) {
                return 0;
              }
            }
            else
            {
              if (!a2 || degas::AttributeValueTable::createTable((degas::Database *)((char *)this + 416))) {
                return 0;
              }
              uint64_t v17 = (degas::Database *)((char *)this + 696);
              int v16 = 1;
              if (degas::Table::checkTableExists((degas::Database *)((char *)this + 696))) {
                goto LABEL_45;
              }
            }
            if (degas::TransactionLogTable::createTable(v17)) {
              return 0;
            }
LABEL_45:
            if (degas::Table::checkTableExists((degas::Database *)((char *)this + 752)))
            {
              char v18 = (degas::Database *)((char *)this + 808);
              if (degas::Table::checkTableExists((degas::Database *)((char *)this + 808))) {
                goto LABEL_53;
              }
              if (!a2) {
                return 0;
              }
            }
            else
            {
              if (!a2 || degas::ClientLogTable::createTable((degas::Database *)((char *)this + 752))) {
                return 0;
              }
              char v18 = (degas::Database *)((char *)this + 808);
              if (degas::Table::checkTableExists((degas::Database *)((char *)this + 808))) {
                goto LABEL_53;
              }
            }
            if (degas::NodeTable::createTable(v18)) {
              return 0;
            }
LABEL_53:
            if (degas::Table::checkTableExists((degas::Database *)((char *)this + 864)))
            {
              uint64_t v19 = (degas::Database *)((char *)this + 920);
              if (!degas::Table::checkTableExists((degas::Database *)((char *)this + 920)))
              {
                if (!a2) {
                  return 0;
                }
                goto LABEL_60;
              }
            }
            else
            {
              if (!a2 || degas::EdgeTable::createTable((degas::Database *)((char *)this + 864))) {
                return 0;
              }
              uint64_t v19 = (degas::Database *)((char *)this + 920);
              if (!degas::Table::checkTableExists((degas::Database *)((char *)this + 920)))
              {
LABEL_60:
                if (degas::AttributeValueTable::createTable(v19)) {
                  return 0;
                }
              }
            }
            if (degas::Table::checkTableExists((degas::Database *)((char *)this + 976))
              || a2 && !degas::AttributeValueTable::createTable((degas::Database *)((char *)this + 976)))
            {
              if (v16) {
                int v20 = 1;
              }
              else {
                int v20 = 2;
              }
              if (v13) {
                int v20 = 0;
              }
              *((_DWORD *)this + 324) = v20;
              int v21 = degas::BitmapTable::createTable((degas::Database *)((char *)this + 1216));
              BOOL result = 0;
              if (!v21) {
                return degas::ArrayTable::createTable((degas::Database *)((char *)this + 1248)) == 0;
              }
              return result;
            }
            return 0;
          }
        }
        if (degas::EdgeTable::createTable(v14)) {
          return 0;
        }
        goto LABEL_26;
      }
    }
  }
  return result;
}

void sub_1D17A6E68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t degas::Database::metadataValue(degas::Database *this, sqlite3_int64 a2, sqlite3_int64 *a3)
{
  degas::MetadataCursor::MetadataCursor((degas::MetadataCursor *)v7, a2, (degas::Database *)((char *)this + 136));
  if (degas::Statement::next((sqlite3_stmt **)v7[0]) == 1)
  {
    sqlite3_int64 v4 = sqlite3_column_int64(*(sqlite3_stmt **)v7[0], 1);
    uint64_t v5 = 0;
  }
  else
  {
    sqlite3_int64 v4 = 0;
    uint64_t v5 = 2;
  }
  *a3 = v4;
  degas::Cursor::~Cursor(v7);
  return v5;
}

void sub_1D17A6EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::Database::getDatabaseHealth(degas::Database *a1, BOOL *a2, uint64_t a3)
{
  unint64_t v9 = 0;
  int v6 = degas::Database::metadataValue(a1, 4, (sqlite3_int64 *)&v9);
  if (v6 == 2)
  {
    uint64_t result = 0;
    *a2 = 0;
  }
  else if (v6)
  {
    return 1;
  }
  else
  {
    BOOL v7 = v9 == 1;
    *a2 = v9 == 1;
    if (v7)
    {
      return degas::Database::metadataValue((uint64_t)a1, 5, a3);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t degas::Database::createAggregateFunctions(sqlite3 **this)
{
  uint64_t result = sqlite3_create_function(this[3], "literalBitmapUnion", 1, 1, 0, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))degas::literalBitmapUnionStep, (void (__cdecl *)(sqlite3_context *))degas::literalBitmapUnionFinal);
  if (!result)
  {
    uint64_t result = sqlite3_create_function(this[3], "literalBitmapIntersection", 1, 1, 0, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))degas::literalBitmapIntersectionStep, (void (__cdecl *)(sqlite3_context *))degas::literalBitmapIntersectionFinal);
    if (!result)
    {
      uint64_t result = sqlite3_create_function(this[3], "mergeLiteralBitmap", 1, 1, 0, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))degas::mergeLiteralBitmapStep, (void (__cdecl *)(sqlite3_context *))degas::mergeLiteralBitmapFinal);
      if (!result)
      {
        sqlite3_int64 v4 = this[3];
        return degas::createBitmapFunctions(v4, v3);
      }
    }
  }
  return result;
}

uint64_t degas::Database::commitTransaction(degas::Database *this)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((*((_WORD *)this + 678) & 0x10) != 0
    && (*((void *)this + 172) != *((void *)this + 173)
     || *((void *)this + 178) != *((void *)this + 179)
     || *((void *)this + 184) != *((void *)this + 185)
     || *((void *)this + 196) != *((void *)this + 197)
     || *((void *)this + 202) != *((void *)this + 203)
     || *((void *)this + 190) != *((void *)this + 191)))
  {
    if (degas::TransactionLogTable::insert((sqlite3 **)this + 87, (sqlite3_int64 *)v21, (degas::Database *)((char *)this + 1360), (degas::Database *)((char *)this + 1408), (degas::Database *)((char *)this + 1456), (degas::Database *)((char *)this + 1504), (degas::Database *)((char *)this + 1552), (degas::Database *)((char *)this + 1600))&& os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v13 = sqlite3_errmsg(*((sqlite3 **)this + 3));
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "logging of changes failed: %s", buf, 0xCu);
    }
    degas::Database::TransactionChanges::clear((degas::Database *)((char *)this + 1360));
  }
  uint64_t v2 = *((void *)this + 167);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 56))(v2);
  }
  if (degas::sDatabaseInsertLabelTracking == 1 && degas::Bitmap::count((degas::Database *)((char *)this + 1648)))
  {
    *(_OWORD *)buf = 0u;
    memset(v25, 0, 25);
    degas::LabelCursor::LabelCursor((degas::LabelCursor *)v18, (Bitmap *)((char *)this + 1648), (degas::Database *)((char *)this + 80));
    while (1)
    {
      int v3 = degas::Statement::next((sqlite3_stmt **)v18[0]);
      if (v3 != 1) {
        break;
      }
      sqlite3_int64 v4 = sqlite3_column_int64(*(sqlite3_stmt **)v18[0], 0);
      degas::Bitmap::setBit((degas::Bitmap *)buf, v4);
    }
    if (v3 != 2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      char v14 = sqlite3_errmsg(*((sqlite3 **)this + 3));
      *(_DWORD *)int v21 = 136315138;
      *(void *)&uint8_t v21[4] = v14;
      _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "checking for missing labels failed: %s", v21, 0xCu);
    }
    BOOL v6 = degas::Bitmap::operator==((uint64_t)buf, (uint64_t)this + 1648);
    if (!v6)
    {
      *(void *)int v21 = *((void *)this + 206);
      *(_OWORD *)&v21[8] = 0u;
      long long v22 = 0u;
      std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>(&v21[16], *((long long **)this + 208), *((long long **)this + 209), (uint64_t)(*((void *)this + 209) - *((void *)this + 208)) >> 4);
      char v23 = *((unsigned char *)this + 1688);
      degas::Bitmap::diffWith<degas::Bitmap>((degas::Bitmap *)v21, (degas::Bitmap *)buf);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        degas::Bitmap::description((uint64_t *)__p, (degas::Bitmap *)v21);
        char v15 = v17 >= 0 ? __p : (void **)__p[0];
        *(_DWORD *)uint64_t v19 = 136315138;
        int v20 = v15;
        _os_log_fault_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "missing labels on insert commit:%s", v19, 0xCu);
        if (v17 < 0) {
          operator delete(__p[0]);
        }
      }
      __p[0] = &v21[16];
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
    }
    BOOL v5 = !v6;
    *((void *)this + 206) = 0;
    *((void *)this + 207) = 0;
    uint64_t v7 = *((void *)this + 209);
    for (uint64_t i = *((void *)this + 208); v7 != i; v7 -= 16)
    {
      degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(v7 - 16));
      *(void *)(v7 - 8) = 0;
    }
    *((void *)this + 209) = i;
    degas::Cursor::~Cursor(v18);
    *(void *)int v21 = v25;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v21);
  }
  else
  {
    BOOL v5 = 0;
  }
  unint64_t v9 = (sqlite3_stmt **)degas::Database::commitStatement(this);
  unsigned int v10 = degas::Statement::update(v9);
  if (v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v12 = sqlite3_errmsg(*((sqlite3 **)this + 3));
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = v12;
    _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "commit failed: %s", buf, 0xCu);
  }
  if (v5 && v10 == 0) {
    return 3;
  }
  else {
    return v10;
  }
}

void sub_1D17A74DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10, uint64_t a11, uint64_t a12, degas::Statement *a13, uint64_t a14, uint64_t a15, uint64_t a16, void **a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  a17 = (void **)&a25;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a17);
  _Unwind_Resume(a1);
}

void std::shared_ptr<degas::LabelIndex>::reset[abi:ne180100]<degas::LabelIndex_Immediate,void>()
{
}

void sub_1D17A75C0(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__shared_ptr_pointer<degas::LabelIndex_Immediate *,std::shared_ptr<degas::LabelIndex>::__shared_ptr_default_delete<degas::LabelIndex,degas::LabelIndex_Immediate>,std::allocator<degas::LabelIndex_Immediate>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), 0x80000001D17CF3E9)) {
    return a1 + 24;
  }
  else {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<degas::LabelIndex_Immediate *,std::shared_ptr<degas::LabelIndex>::__shared_ptr_default_delete<degas::LabelIndex,degas::LabelIndex_Immediate>,std::allocator<degas::LabelIndex_Immediate>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_pointer<degas::LabelIndex_Immediate *,std::shared_ptr<degas::LabelIndex>::__shared_ptr_default_delete<degas::LabelIndex,degas::LabelIndex_Immediate>,std::allocator<degas::LabelIndex_Immediate>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D25F9A90);
}

uint64_t std::__shared_ptr_pointer<degas::LabelIndex_Snapshot *,std::shared_ptr<degas::LabelIndex>::__shared_ptr_default_delete<degas::LabelIndex,degas::LabelIndex_Snapshot>,std::allocator<degas::LabelIndex_Snapshot>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), 0x80000001D17CF2E7)) {
    return a1 + 24;
  }
  else {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<degas::LabelIndex_Snapshot *,std::shared_ptr<degas::LabelIndex>::__shared_ptr_default_delete<degas::LabelIndex,degas::LabelIndex_Snapshot>,std::allocator<degas::LabelIndex_Snapshot>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_pointer<degas::LabelIndex_Snapshot *,std::shared_ptr<degas::LabelIndex>::__shared_ptr_default_delete<degas::LabelIndex,degas::LabelIndex_Snapshot>,std::allocator<degas::LabelIndex_Snapshot>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D25F9A90);
}

void degas::Database::TransactionChanges::clear(degas::Database::TransactionChanges *this)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  uint64_t v2 = *((void *)this + 2);
  for (uint64_t i = *((void *)this + 3); i != v2; i -= 16)
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(i - 16));
    *(void *)(i - 8) = 0;
  }
  *((void *)this + 3) = v2;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  uint64_t v4 = *((void *)this + 8);
  for (uint64_t j = *((void *)this + 9); j != v4; j -= 16)
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(j - 16));
    *(void *)(j - 8) = 0;
  }
  *((void *)this + 9) = v4;
  *((void *)this + 12) = 0;
  *((void *)this + 13) = 0;
  uint64_t v6 = *((void *)this + 14);
  for (uint64_t k = *((void *)this + 15); k != v6; k -= 16)
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(k - 16));
    *(void *)(k - 8) = 0;
  }
  *((void *)this + 15) = v6;
  *((void *)this + 18) = 0;
  *((void *)this + 19) = 0;
  uint64_t v8 = *((void *)this + 20);
  for (uint64_t m = *((void *)this + 21); m != v8; m -= 16)
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(m - 16));
    *(void *)(m - 8) = 0;
  }
  *((void *)this + 21) = v8;
  *((void *)this + 24) = 0;
  *((void *)this + 25) = 0;
  uint64_t v10 = *((void *)this + 26);
  for (uint64_t n = *((void *)this + 27); n != v10; n -= 16)
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(n - 16));
    *(void *)(n - 8) = 0;
  }
  *((void *)this + 27) = v10;
  *((void *)this + 30) = 0;
  *((void *)this + 31) = 0;
  uint64_t v12 = *((void *)this + 32);
  for (iuint64_t i = *((void *)this + 33); ii != v12; ii -= 16)
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(ii - 16));
    *(void *)(ii - 8) = 0;
  }
  *((void *)this + 33) = v12;
}

uint64_t degas::Database::commitStatement(degas::Database *this)
{
  uint64_t v2 = (degas::Statement *)*((void *)this + 151);
  if (!v2) {
    operator new();
  }
  degas::Statement::prepareForUse(v2);
  return *((void *)this + 151);
}

void sub_1D17A7944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

CFComparisonResult degas::noCaseNoDiacriticsCollation(degas *this, void *a2, UInt8 *bytes, const void *a4, const UInt8 *a5, const void *a6)
{
  int v7 = (int)a4;
  CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef v9 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E4F1CF80], bytes, (int)a2, 0x8000100u, 0);
  CFStringRef v10 = CFStringCreateWithBytes(v8, a5, v7, 0x8000100u, 0);
  CFComparisonResult v11 = CFStringCompare(v9, v10, 0x191uLL);
  CFRelease(v9);
  CFRelease(v10);
  return v11;
}

uint64_t degas::Database::metadataValue(uint64_t a1, sqlite3_int64 a2, uint64_t a3)
{
  degas::MetadataCursor::MetadataCursor((degas::MetadataCursor *)v6, a2, (const degas::MetadataTable *)(a1 + 136));
  if (degas::Statement::next((sqlite3_stmt **)v6[0]) == 1)
  {
    degas::Statement::stringColumnValue((sqlite3_stmt **)v6[0], 1, a3);
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 2;
  }
  degas::Cursor::~Cursor(v6);
  return v4;
}

void sub_1D17A7A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::Database::setDatabaseFatalProblem(uint64_t a1, uint64_t *a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    return 8;
  }
  BOOL v5 = (degas::MetadataTable *)(a1 + 136);
  uint64_t result = degas::MetadataTable::insertOrUpdate((degas::MetadataTable *)(a1 + 136), 4, 1);
  if (!result)
  {
    if (*(unsigned char *)(a1 + 32)) {
      return 8;
    }
    return degas::MetadataTable::insertOrUpdate(v5, 5, a2);
  }
  return result;
}

uint64_t degas::Database::beginStatement(degas::Database *this)
{
  uint64_t v2 = (degas::Statement *)*((void *)this + 150);
  if (!v2) {
    operator new();
  }
  degas::Statement::prepareForUse(v2);
  return *((void *)this + 150);
}

void sub_1D17A7BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t degas::busyHandler(degas *this, void *a2)
{
  if ((int)a2 > 19) {
    return 0;
  }
  uint64_t v2 = 1;
  usleep(a2 + (1 << (char)a2) + 1);
  return v2;
}

uint64_t degas::Database::databaseFormatVersion(degas::Database *a1, _DWORD *a2)
{
  unint64_t v4 = 0;
  uint64_t result = degas::Database::metadataValue(a1, 3, (sqlite3_int64 *)&v4);
  if (!result) {
    *a2 = v4;
  }
  return result;
}

uint64_t degas::Database::addCollations(sqlite3 **this)
{
  return sqlite3_create_collation(this[3], "nocasenodiacritics", 1, 0, (int (__cdecl *)(void *, int, const void *, int, const void *))degas::noCaseNoDiacriticsCollation);
}

uint64_t degas::Database::openWrite(std::string::size_type a1, std::string::size_type a2)
{
  std::string::size_type v2 = a2;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = *(_DWORD *)(a1 + 1352);
  if (*(char *)(a2 + 23) < 0) {
    a2 = *(void *)a2;
  }
  if (kgWaitForProtectedAccess(v4, (const char *)a2) == 1)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 1352) - 1;
    if (v5 > 2) {
      int v6 = 1048578;
    }
    else {
      int v6 = dword_1D17CF58C[v5];
    }
    std::string::operator=((std::string *)a1, (const std::string *)v2);
    if (*(char *)(v2 + 23) >= 0) {
      int v7 = (const char *)v2;
    }
    else {
      int v7 = *(const char **)v2;
    }
    CFAllocatorRef v8 = (sqlite3 **)(a1 + 24);
    CFStringRef v9 = (degas *)sqlite3_open_v2(v7, (sqlite3 **)(a1 + 24), v6, 0);
    if (!v9)
    {
      if (degas::sDatabasePathTracking == 1)
      {
        degas::databaseMap(v9);
        degas::DatabaseMap::registerDatabase((void **)&degas::databaseMap(void)::databaseMap, v2, a1);
        *(unsigned char *)(a1 + 1328) = 1;
      }
      sqlite3_extended_result_codes(*(sqlite3 **)(a1 + 24), 1);
      sqlite3_busy_handler(*(sqlite3 **)(a1 + 24), (int (__cdecl *)(void *, int))degas::busyHandler, 0);
      sqlite3_wal_autocheckpoint(*(sqlite3 **)(a1 + 24), 100);
      degas::Database::setTraceCallback(a1);
      degas::Database::updateTableInstances((void *)a1);
      degas::Database::beginTransaction((sqlite3 **)a1);
      if (!degas::Database::checkSchema((degas::Database *)a1, 1))
      {
        degas::Database::commitTransaction((degas::Database *)a1);
        goto LABEL_45;
      }
      *(void *)buf = 0;
      int v10 = degas::Database::metadataValue((degas::Database *)a1, 3, (sqlite3_int64 *)buf);
      if (v10)
      {
        if (v10)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = 1;
            _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to read database format version, unable to open rc=%d", buf, 8u);
          }
          degas::Database::commitTransaction((degas::Database *)a1);
LABEL_45:
          if ((*(_WORD *)(a1 + 1356) & 2) == 0) {
            operator new();
          }
          operator new();
        }
      }
      else
      {
        unsigned int v11 = *(_DWORD *)buf;
        if (*(_DWORD *)buf) {
          goto LABEL_30;
        }
      }
      unsigned int v11 = *(_DWORD *)(a1 + 1296);
      if (v11)
      {
        if (v11 == 2) {
          unsigned int v11 = 1;
        }
      }
      else
      {
        unsigned int v11 = 8;
      }
      if (!*(unsigned char *)(a1 + 32)) {
        degas::MetadataTable::insertOrUpdate((degas::MetadataTable *)(a1 + 136), 3, v11);
      }
LABEL_30:
      if (v11 != 8)
      {
        uint64_t v12 = *(void *)(a1 + 24);
        *(void *)buf = a1;
        uint64_t v24 = v12;
        if (degas::Migration::migrate((degas::Migration *)buf, v11, 8))
        {
          degas::Database::commitTransaction((degas::Database *)a1);
LABEL_44:
          sqlite3_exec(*v8, "pragma incremental_vacuum(5)", 0, 0, 0);
          goto LABEL_45;
        }
      }
      BOOL v20 = 0;
      *(void *)buf = 0;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      int DatabaseHealth = degas::Database::getDatabaseHealth((degas::Database *)a1, &v20, (uint64_t)buf);
      if (v20)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          uint64_t v19 = buf;
          if (v25 < 0) {
            uint64_t v19 = *(uint8_t **)buf;
          }
          *(_DWORD *)int v21 = 136315138;
          long long v22 = v19;
          _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "not opening graph database for write due to fatal problem: %s", v21, 0xCu);
        }
        int v14 = 9;
      }
      else
      {
        int v14 = DatabaseHealth;
      }
      if (SHIBYTE(v25) < 0) {
        operator delete(*(void **)buf);
      }
      if (v14) {
        goto LABEL_42;
      }
      int AggregateFunctions = degas::Database::createAggregateFunctions((sqlite3 **)a1);
      if (AggregateFunctions)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
LABEL_42:
          BOOL v16 = v11 == 8;
          degas::Database::commitTransaction((degas::Database *)a1);
          goto LABEL_43;
        }
        BOOL v16 = v11 == 8;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = AggregateFunctions;
        _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to create sqlite functions and aggregates, unable to open rc=%d", buf, 8u);
        degas::Database::commitTransaction((degas::Database *)a1);
      }
      else
      {
        int collation = sqlite3_create_collation(*v8, "nocasenodiacritics", 1, 0, (int (__cdecl *)(void *, int, const void *, int, const void *))degas::noCaseNoDiacriticsCollation);
        if (!collation || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_42;
        }
        BOOL v16 = v11 == 8;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = collation;
        _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to add collations, unable to open rc=%d", buf, 8u);
        degas::Database::commitTransaction((degas::Database *)a1);
      }
LABEL_43:
      if (v16) {
        goto LABEL_45;
      }
      goto LABEL_44;
    }
    if (*v8) {
      degas::Database::close((degas::Database *)a1);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to get data protected access to graph database file", buf, 2u);
  }
  return 3;
}

void sub_1D17A820C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::shared_ptr<degas::LabelIndex>::reset[abi:ne180100]<degas::LabelIndex_Transaction,void>()
{
}

void sub_1D17A82DC(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__shared_ptr_pointer<degas::LabelIndex_Transaction *,std::shared_ptr<degas::LabelIndex>::__shared_ptr_default_delete<degas::LabelIndex,degas::LabelIndex_Transaction>,std::allocator<degas::LabelIndex_Transaction>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](*(void *)(a2 + 8), 0x80000001D17CF4EELL)) {
    return a1 + 24;
  }
  else {
    return 0;
  }
}

uint64_t std::__shared_ptr_pointer<degas::LabelIndex_Transaction *,std::shared_ptr<degas::LabelIndex>::__shared_ptr_default_delete<degas::LabelIndex,degas::LabelIndex_Transaction>,std::allocator<degas::LabelIndex_Transaction>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void std::__shared_ptr_pointer<degas::LabelIndex_Transaction *,std::shared_ptr<degas::LabelIndex>::__shared_ptr_default_delete<degas::LabelIndex,degas::LabelIndex_Transaction>,std::allocator<degas::LabelIndex_Transaction>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D25F9A90);
}

uint64_t degas::Database::setDatabaseFormatVersion(uint64_t a1, unsigned int a2)
{
  if (*(unsigned char *)(a1 + 32)) {
    return 8;
  }
  else {
    return degas::MetadataTable::insertOrUpdate((degas::MetadataTable *)(a1 + 136), 3, a2);
  }
}

uint64_t degas::Database::openCreate(std::string::size_type a1, std::string::size_type a2)
{
  std::string::size_type v2 = a2;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = *(_DWORD *)(a1 + 1352);
  if (*(char *)(a2 + 23) < 0) {
    a2 = *(void *)a2;
  }
  if (kgWaitForProtectedAccess(v4, (const char *)a2) == 1)
  {
    unsigned int v5 = *(_DWORD *)(a1 + 1352) - 1;
    if (v5 > 2) {
      int v6 = 1048582;
    }
    else {
      int v6 = dword_1D17CF598[v5];
    }
    std::string::operator=((std::string *)a1, (const std::string *)v2);
    if (*(char *)(v2 + 23) >= 0) {
      int v7 = (const char *)v2;
    }
    else {
      int v7 = *(const char **)v2;
    }
    CFAllocatorRef v8 = (sqlite3 **)(a1 + 24);
    CFStringRef v9 = (degas *)sqlite3_open_v2(v7, (sqlite3 **)(a1 + 24), v6, 0);
    if (!v9)
    {
      if (degas::sDatabasePathTracking == 1)
      {
        degas::databaseMap(v9);
        degas::DatabaseMap::registerDatabase((void **)&degas::databaseMap(void)::databaseMap, v2, a1);
        *(unsigned char *)(a1 + 1328) = 1;
      }
      sqlite3_extended_result_codes(*(sqlite3 **)(a1 + 24), 1);
      sqlite3_busy_handler(*(sqlite3 **)(a1 + 24), (int (__cdecl *)(void *, int))degas::busyHandler, 0);
      sqlite3_wal_autocheckpoint(*(sqlite3 **)(a1 + 24), 100);
      degas::Database::setTraceCallback(a1);
      int v10 = sqlite3_exec(*(sqlite3 **)(a1 + 24), "pragma journal_mode=WAL;", 0, 0, 0);
      if (v10)
      {
        int v11 = v10;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v11;
          _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "setting WAL mode failed, rc=%d, continuing", buf, 8u);
        }
      }
      degas::Database::updateTableInstances((void *)a1);
      if (!degas::Table::checkTableExists((degas::Table *)(a1 + 80)))
      {
        int v12 = sqlite3_exec(*v8, "pragma autovacuum=incremental", 0, 0, 0);
        if (v12)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v12;
            _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "setting autovacuum mode failed, rc=%d, continuing", buf, 8u);
          }
        }
      }
      degas::Database::beginTransaction((sqlite3 **)a1);
      if (!degas::Database::checkSchema((degas::Database *)a1, 1)) {
        goto LABEL_28;
      }
      *(void *)buf = 0;
      int v13 = degas::Database::metadataValue((degas::Database *)a1, 3, (sqlite3_int64 *)buf);
      if (v13)
      {
        if (v13)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = 1;
            _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to read database format version, unable to open rc=%d", buf, 8u);
          }
LABEL_28:
          degas::Database::commitTransaction((degas::Database *)a1);
          goto LABEL_52;
        }
      }
      else
      {
        unsigned int v14 = *(_DWORD *)buf;
        if (*(_DWORD *)buf) {
          goto LABEL_37;
        }
      }
      unsigned int v14 = *(_DWORD *)(a1 + 1296);
      if (v14)
      {
        if (v14 == 2) {
          unsigned int v14 = 1;
        }
      }
      else
      {
        unsigned int v14 = 8;
      }
      if (!*(unsigned char *)(a1 + 32)) {
        degas::MetadataTable::insertOrUpdate((degas::MetadataTable *)(a1 + 136), 3, v14);
      }
LABEL_37:
      if (v14 != 8)
      {
        uint64_t v15 = *(void *)(a1 + 24);
        *(void *)buf = a1;
        uint64_t v27 = v15;
        if (degas::Migration::migrate((degas::Migration *)buf, v14, 8))
        {
          degas::Database::commitTransaction((degas::Database *)a1);
LABEL_51:
          sqlite3_exec(*v8, "pragma incremental_vacuum(5)", 0, 0, 0);
LABEL_52:
          if ((*(_WORD *)(a1 + 1356) & 2) == 0) {
            operator new();
          }
          operator new();
        }
      }
      BOOL v23 = 0;
      *(void *)buf = 0;
      uint64_t v27 = 0;
      uint64_t v28 = 0;
      int DatabaseHealth = degas::Database::getDatabaseHealth((degas::Database *)a1, &v23, (uint64_t)buf);
      if (v23)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          long long v22 = buf;
          if (v28 < 0) {
            long long v22 = *(uint8_t **)buf;
          }
          *(_DWORD *)uint64_t v24 = 136315138;
          uint64_t v25 = v22;
          _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "not opening graph database for write/create due to fatal problem: %s", v24, 0xCu);
        }
        int v17 = 9;
      }
      else
      {
        int v17 = DatabaseHealth;
      }
      if (SHIBYTE(v28) < 0) {
        operator delete(*(void **)buf);
      }
      if (v17) {
        goto LABEL_49;
      }
      int AggregateFunctions = degas::Database::createAggregateFunctions((sqlite3 **)a1);
      if (AggregateFunctions)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
LABEL_49:
          BOOL v19 = v14 == 8;
          degas::Database::commitTransaction((degas::Database *)a1);
          goto LABEL_50;
        }
        BOOL v19 = v14 == 8;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = AggregateFunctions;
        _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to create sqlite functions and aggregates, unable to open rc=%d", buf, 8u);
        degas::Database::commitTransaction((degas::Database *)a1);
      }
      else
      {
        int collation = sqlite3_create_collation(*v8, "nocasenodiacritics", 1, 0, (int (__cdecl *)(void *, int, const void *, int, const void *))degas::noCaseNoDiacriticsCollation);
        if (!collation || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_49;
        }
        BOOL v19 = v14 == 8;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = collation;
        _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to add collations, unable to open rc=%d", buf, 8u);
        degas::Database::commitTransaction((degas::Database *)a1);
      }
LABEL_50:
      if (v19) {
        goto LABEL_52;
      }
      goto LABEL_51;
    }
    if (*v8) {
      degas::Database::close((degas::Database *)a1);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to get data protected access to graph database file", buf, 2u);
  }
  return 3;
}

void sub_1D17A8A34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL degas::Database::databaseIsEmpty(degas::Database *this)
{
  return !degas::Table::checkTableExists((degas::Database *)((char *)this + 80));
}

uint64_t degas::Database::truncateDatabase(degas::Database *this)
{
  if (*((unsigned char *)this + 32)) {
    return 8;
  }
  uint64_t v3 = *((void *)this + 167);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 72))(v3);
  }
  int v4 = 129;
  if (sqlite3_file_control(*((sqlite3 **)this + 3), 0, 101, &v4)) {
    return 3;
  }
  else {
    return 0;
  }
}

uint64_t degas::Database::backupDatabase(uint64_t a1, uint64_t a2)
{
  ppDb = 0;
  if (*(char *)(a2 + 23) >= 0) {
    int v4 = (const char *)a2;
  }
  else {
    int v4 = *(const char **)a2;
  }
  if (sqlite3_open_v2(v4, &ppDb, 6, 0)) {
    return 3;
  }
  int v10 = 129;
  if (sqlite3_file_control(ppDb, 0, 101, &v10)) {
    return 3;
  }
  sqlite3_busy_handler(ppDb, (int (__cdecl *)(void *, int))degas::busyHandler, 0);
  sqlite3_extended_result_codes(ppDb, 1);
  int v6 = sqlite3_backup_init(ppDb, "main", *(sqlite3 **)(a1 + 24), "main");
  if (!v6) {
    return 3;
  }
  int v7 = v6;
  do
  {
    do
      int v8 = sqlite3_backup_step(v7, 100);
    while (!v8);
  }
  while (v8 == 5);
  if (v8 != 101 || sqlite3_backup_finish(v7)) {
    return 3;
  }
  CFStringRef v9 = (degas *)sqlite3_close(ppDb);
  ppDb = 0;
  degas::indexDirectory(v9);
  degas::LabelIndexDirectory::resetIndexForDatabasePath((os_unfair_lock_s *)&degas::indexDirectory(void)::sIndexDirectory, (void *)a2);
  return 0;
}

uint64_t degas::Database::copyDatabase(uint64_t a1, void *a2)
{
  uint64_t v3 = (degas *)_sqlite3_db_copy();
  int v4 = (int)v3;
  degas::indexDirectory(v3);
  degas::LabelIndexDirectory::resetIndexForDatabasePath((os_unfair_lock_s *)&degas::indexDirectory(void)::sIndexDirectory, a2);
  uint64_t result = 3;
  if (v4 > 99)
  {
    if (v4 == 100)
    {
      return 1;
    }
    else if (v4 == 101)
    {
      return 2;
    }
  }
  else if (v4)
  {
    if (v4 == 17) {
      return 4;
    }
    else {
      return 3;
    }
  }
  else
  {
    return 0;
  }
  return result;
}

uint64_t degas::Database::copyDatabaseFromTo(const char *a1, void *a2)
{
  ppDb = 0;
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  if (sqlite3_open_v2(a1, &ppDb, 6, 0)) {
    return 3;
  }
  int v4 = _sqlite3_db_copy();
  unsigned int v5 = (degas *)sqlite3_close(ppDb);
  degas::indexDirectory(v5);
  degas::LabelIndexDirectory::resetIndexForDatabasePath((os_unfair_lock_s *)&degas::indexDirectory(void)::sIndexDirectory, a2);
  if (v4 > 99)
  {
    if (v4 == 100) {
      return 1;
    }
    BOOL v6 = v4 == 101;
    unsigned int v7 = 2;
  }
  else
  {
    if (!v4) {
      return 0;
    }
    BOOL v6 = v4 == 17;
    unsigned int v7 = 4;
  }
  if (v6) {
    return v7;
  }
  else {
    return 3;
  }
}

uint64_t degas::Database::truncateDatabaseAtPath(uint64_t *a1)
{
  uint64_t v1 = a1;
  ppDb = 0;
  if (*((char *)a1 + 23) < 0) {
    a1 = (uint64_t *)*a1;
  }
  if (sqlite3_open_v2((const char *)a1, &ppDb, 6, 0)) {
    return 3;
  }
  int v8 = 129;
  int v3 = sqlite3_file_control(ppDb, 0, 101, &v8);
  int v4 = (degas *)sqlite3_close(ppDb);
  degas::indexDirectory(v4);
  degas::LabelIndexDirectory::resetIndexForDatabasePath((os_unfair_lock_s *)&degas::indexDirectory(void)::sIndexDirectory, v1);
  if (v3 == 101) {
    int v5 = 2;
  }
  else {
    int v5 = 3;
  }
  if (v3 == 100) {
    unsigned int v6 = 1;
  }
  else {
    unsigned int v6 = v5;
  }
  if (v3 == 17) {
    unsigned int v7 = 4;
  }
  else {
    unsigned int v7 = 3;
  }
  if (!v3) {
    unsigned int v7 = 0;
  }
  if (v3 <= 99) {
    return v7;
  }
  else {
    return v6;
  }
}

uint64_t degas::Database::isEmptyDatabaseAtPath(const char *a1)
{
  ppDb = 0;
  if (a1[23] < 0) {
    a1 = *(const char **)a1;
  }
  if (sqlite3_open_v2(a1, &ppDb, 1, 0)) {
    return 3;
  }
  std::string::size_type v2 = ppDb;
  std::string::basic_string[abi:ne180100]<0>(__p, "select * from sqlite_master where type = 'table'");
  degas::Statement::Statement(ppStmt, v2, (uint64_t)__p);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v1 = degas::Statement::next(ppStmt);
  if (v1 == 1) {
    degas::Statement::finishStatementCursor((degas::Statement *)ppStmt);
  }
  degas::Statement::~Statement((degas::Statement *)ppStmt);
  sqlite3_close(ppDb);
  return v1;
}

void sub_1D17A8F2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t degas::Database::rollbackTransaction(degas::Database *this)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *((void *)this + 167);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 64))(v2);
  }
  degas::Database::TransactionChanges::clear((degas::Database *)((char *)this + 1360));
  *((_OWORD *)this + 103) = 0u;
  uint64_t v3 = *((void *)this + 209);
  for (uint64_t i = *((void *)this + 208); v3 != i; v3 -= 16)
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(v3 - 16));
    *(void *)(v3 - 8) = 0;
  }
  *((void *)this + 209) = i;
  char v5 = (sqlite3 *)*((void *)this + 3);
  std::string::basic_string[abi:ne180100]<0>(__p, "rollback");
  degas::Statement::Statement(ppStmt, v5, (uint64_t)__p);
  if (v11 < 0) {
    operator delete(*(void **)__p);
  }
  uint64_t v6 = degas::Statement::update(ppStmt);
  if (v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v8 = sqlite3_errmsg(*((sqlite3 **)this + 3));
    *(_DWORD *)long long __p = 136315138;
    *(void *)&__p[4] = v8;
    _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "rollback failed: %s", __p, 0xCu);
  }
  degas::Statement::~Statement((degas::Statement *)ppStmt);
  return v6;
}

void sub_1D17A90C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
}

sqlite3_int64 degas::Database::addLabel(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 32)) {
    return 0;
  }
  int v4 = (sqlite3 **)(a1 + 80);
  degas::LabelCursor::LabelCursor((uint64_t *)v10, (uint64_t *)a2, (degas::LabelTable *)(a1 + 80));
  sqlite3_int64 v2 = 0;
  char v5 = 1;
  uint64_t v6 = MEMORY[0x1E4F14500];
  while (1)
  {
    int v7 = degas::Statement::next((sqlite3_stmt **)v10[0]);
    if (v7 != 1) {
      break;
    }
    sqlite3_int64 v2 = sqlite3_column_int64(*(sqlite3_stmt **)v10[0], 0);
    char v5 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      if (*(char *)(a2 + 23) >= 0) {
        uint64_t v8 = a2;
      }
      else {
        uint64_t v8 = *(void *)a2;
      }
      *(_DWORD *)buf = 136446466;
      uint64_t v13 = v8;
      __int16 v14 = 2050;
      sqlite3_int64 v15 = v2;
      _os_log_error_impl(&dword_1D1654000, v6, OS_LOG_TYPE_ERROR, "adding a label %{public}s that already exists in database with identifier %{public}llu", buf, 0x16u);
      char v5 = 0;
    }
  }
  if (v7 == 2)
  {
    sqlite3_int64 v11 = v2;
    if (v5)
    {
      degas::LabelTable::insert(v4, &v11, (uint64_t *)a2);
      sqlite3_int64 v2 = v11;
    }
  }
  degas::Cursor::~Cursor(v10);
  return v2;
}

void sub_1D17A926C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::getLabelName(uint64_t a1, sqlite3_int64 a2, uint64_t a3)
{
  degas::LabelCursor::LabelCursor((degas::LabelCursor *)v6, a2, (const degas::LabelTable *)(a1 + 80));
  uint64_t v4 = 2;
  while (degas::Statement::next((sqlite3_stmt **)v6[0]) == 1)
  {
    degas::Statement::stringColumnValue((sqlite3_stmt **)v6[0], 1, a3);
    uint64_t v4 = 0;
  }
  degas::Cursor::~Cursor(v6);
  return v4;
}

void sub_1D17A92F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::Database::setMetadataValue(uint64_t a1, sqlite3_int64 a2, uint64_t *a3)
{
  if (*(unsigned char *)(a1 + 32)) {
    return 8;
  }
  else {
    return degas::MetadataTable::insertOrUpdate((degas::MetadataTable *)(a1 + 136), a2, a3);
  }
}

uint64_t degas::Database::setMetadataValue(degas::Database *this, sqlite3_int64 a2, sqlite3_int64 a3)
{
  if (*((unsigned char *)this + 32)) {
    return 8;
  }
  else {
    return degas::MetadataTable::insertOrUpdate((degas::Database *)((char *)this + 136), a2, a3);
  }
}

uint64_t degas::Database::verifyLabels(degas::Database *this, const degas::Bitmap *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  degas::LabelCursor::LabelCursor((degas::LabelCursor *)v14, (Bitmap *)a2, (degas::Database *)((char *)this + 80));
  long long v12 = 0u;
  memset(v13, 0, 25);
  while (1)
  {
    uint64_t v3 = degas::Statement::next((sqlite3_stmt **)v14[0]);
    uint64_t v4 = v3;
    if (v3 != 1) {
      break;
    }
    sqlite3_int64 v5 = sqlite3_column_int64(*(sqlite3_stmt **)v14[0], 0);
    degas::Bitmap::setBit((degas::Bitmap *)&v12, v5);
  }
  if (v3 == 2)
  {
    if (degas::Bitmap::operator==((uint64_t)&v12, (uint64_t)a2))
    {
      uint64_t v4 = 0;
    }
    else
    {
      v10[0] = *(void ***)a2;
      memset(&v10[1], 0, 32);
      std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v10[2], *((long long **)a2 + 2), *((long long **)a2 + 3), (uint64_t)(*((void *)a2 + 3) - *((void *)a2 + 2)) >> 4);
      char v11 = *((unsigned char *)a2 + 40);
      degas::Bitmap::diffWith<degas::Bitmap>((degas::Bitmap *)v10, (degas::Bitmap *)&v12);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        degas::Bitmap::description((uint64_t *)__p, (degas::Bitmap *)v10);
        if (v9 >= 0) {
          int v7 = __p;
        }
        else {
          int v7 = (void **)__p[0];
        }
        *(_DWORD *)buf = 136315138;
        uint64_t v16 = v7;
        _os_log_fault_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "element insert refers to non-existent labels:%s", buf, 0xCu);
        if (v9 < 0) {
          operator delete(__p[0]);
        }
      }
      __p[0] = &v10[2];
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
      uint64_t v4 = 7;
    }
  }
  v10[0] = (void **)v13;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v10);
  degas::Cursor::~Cursor(v14);
  return v4;
}

void sub_1D17A94F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a10);
  a13 = (void **)&a21;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a13);
  degas::Cursor::~Cursor((degas::Statement **)(v21 - 64));
  _Unwind_Resume(a1);
}

uint64_t degas::Database::insertNode(degas::Database *this, sqlite3_int64 *a2)
{
  if (*((unsigned char *)this + 32)) {
    return 8;
  }
  if (degas::sDatabaseLabelReferenceChecking != 1
    || (uint64_t v2 = degas::Database::verifyLabels(this, (const degas::Bitmap *)(a2 + 1)), !v2))
  {
    long long v11 = 0u;
    memset(v12, 0, 25);
    uint64_t v2 = degas::NodeTable::insert((sqlite3 **)this + 24, a2, (const degas::Bitmap *)(a2 + 1));
    if (!v2)
    {
      degas::Bitmap::begin(a2 + 1, v10);
      unint64_t v5 = a2[4];
      while (1)
      {
        BOOL v6 = (sqlite3_int64 *)v10[0] == a2 + 1 && v10[1] == -1;
        if (v6 && v10[2] == v5) {
          break;
        }
        (*(void (**)(void))(**((void **)this + 167) + 80))(*((void *)this + 167));
        degas::Bitmap::iterator::operator++(v10);
      }
      uint64_t v8 = *((void *)this + 160);
      if ((v8 & 0x8000000000000000) == 0) {
        *((void *)this + 160) = v8 + 1;
      }
      if ((*((_WORD *)this + 678) & 0x10) != 0) {
        degas::Bitmap::setBit((degas::Database *)((char *)this + 1360), *a2);
      }
      if (degas::sDatabaseInsertLabelTracking == 1) {
        degas::Bitmap::unionWith<degas::Bitmap>((degas::Database *)((char *)this + 1648), (uint64_t)(a2 + 1));
      }
    }
    v10[0] = (unint64_t)v12;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v10);
  }
  return v2;
}

void sub_1D17A968C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  a10 = (void **)&a15;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::updateNodeEdges(degas::Database *this, unint64_t a2, const degas::Bitmap *a3, const degas::Bitmap *a4, const degas::Bitmap *a5, const degas::Bitmap *a6)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*((unsigned char *)this + 32)) {
    return 8;
  }
  degas::NodeCursor::NodeCursor(v18);
  degas::NodeCursor::setForIdentifier((degas::NodeCursor *)v18, a2, (degas::Database *)((char *)this + 192));
  if (degas::Statement::next((sqlite3_stmt **)v18[0]) != 1) {
    goto LABEL_23;
  }
  *(_OWORD *)buf = 0u;
  memset(v21, 0, 25);
  long long v16 = 0u;
  memset(v17, 0, 25);
  long long v14 = 0u;
  memset(v15, 0, 25);
  degas::Statement::bitmapColumnValue((sqlite3_stmt **)v18[0], 2, (degas::Bitmap *)buf);
  degas::Statement::bitmapColumnValue((sqlite3_stmt **)v18[0], 3, (degas::Bitmap *)&v16);
  if (*((void *)a3 + 2) != *((void *)a3 + 3)) {
    degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)buf, (uint64_t)a3);
  }
  if (*((void *)a4 + 2) != *((void *)a4 + 3)) {
    degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)&v16, (uint64_t)a4);
  }
  if (*((void *)a5 + 2) != *((void *)a5 + 3)) {
    degas::Bitmap::diffWith<degas::Bitmap>((degas::Bitmap *)buf, a5);
  }
  if (*((void *)a6 + 2) != *((void *)a6 + 3)) {
    degas::Bitmap::diffWith<degas::Bitmap>((degas::Bitmap *)&v16, a6);
  }
  uint64_t v6 = degas::NodeTable::update((sqlite3 **)this + 24, a2, (const degas::Bitmap *)buf, (const degas::Bitmap *)&v16);
  if (!v6 && (*((_WORD *)this + 678) & 0x10) != 0) {
    degas::Database::TransactionChanges::updateNode((degas::Database *)((char *)this + 1360), a2);
  }
  BOOL v19 = (void **)v15;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v19);
  *(void *)&long long v14 = v17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
  *(void *)&long long v16 = v21;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v16);
  if (v6 == 2)
  {
LABEL_23:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = a2;
      _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed to find node %llu when updating its edges", buf, 0xCu);
    }
    uint64_t v6 = 2;
  }
  degas::Cursor::~Cursor(v18);
  return v6;
}

void sub_1D17A98EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  degas::Cursor::~Cursor((degas::Statement **)va);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::TransactionChanges::updateNode(degas::Database::TransactionChanges *this, unint64_t a2)
{
  uint64_t result = degas::Bitmap::isSet(this, a2);
  if ((result & 1) == 0)
  {
    uint64_t result = degas::Bitmap::isSet((degas::Database::TransactionChanges *)((char *)this + 192), a2);
    if ((result & 1) == 0)
    {
      return degas::Bitmap::setBit((degas::Database::TransactionChanges *)((char *)this + 96), a2);
    }
  }
  return result;
}

uint64_t degas::Database::insertEdge(uint64_t a1, sqlite3_int64 *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (degas::Database::checkNodeExistsForIdentifier((degas::Database *)a1, a2[7]) != 1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      return 3;
    }
    sqlite3_int64 v8 = a2[7];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v8;
    char v9 = MEMORY[0x1E4F14500];
    int v10 = "failed edge insert because source node %llu does not exist";
LABEL_31:
    _os_log_error_impl(&dword_1D1654000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);
    return 3;
  }
  if (degas::Database::checkNodeExistsForIdentifier((degas::Database *)a1, a2[8]) != 1)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      return 3;
    }
    sqlite3_int64 v13 = a2[8];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v13;
    char v9 = MEMORY[0x1E4F14500];
    int v10 = "failed edge insert because target node %llu does not exist";
    goto LABEL_31;
  }
  if (degas::sDatabaseLabelReferenceChecking != 1
    || (uint64_t updated = degas::Database::verifyLabels((degas::Database *)a1, (const degas::Bitmap *)(a2 + 1)), !updated))
  {
    uint64_t updated = degas::EdgeTable::insert((sqlite3 **)(a1 + 248), a2, (const degas::Bitmap *)(a2 + 1), a2[7], a2[8]);
    if (!updated)
    {
      *(_OWORD *)buf = 0u;
      memset(v18, 0, 25);
      degas::Bitmap::setBit((degas::Bitmap *)buf, *a2);
      long long v15 = 0u;
      memset(v16, 0, 25);
      degas::Bitmap::begin(a2 + 1, v14);
      sqlite3_int64 v5 = a2[4];
      while (1)
      {
        BOOL v6 = (sqlite3_int64 *)v14[0] == a2 + 1 && v14[1] == -1;
        if (v6 && v14[2] == v5) {
          break;
        }
        (*(void (**)(void))(**(void **)(a1 + 1336) + 96))(*(void *)(a1 + 1336));
        degas::Bitmap::iterator::operator++(v14);
      }
      uint64_t updated = degas::Database::updateNodeEdges((degas::Database *)a1, a2[7], (const degas::Bitmap *)&v15, (const degas::Bitmap *)buf, (const degas::Bitmap *)&v15, (const degas::Bitmap *)&v15);
      if (!updated)
      {
        uint64_t updated = degas::Database::updateNodeEdges((degas::Database *)a1, a2[8], (const degas::Bitmap *)buf, (const degas::Bitmap *)&v15, (const degas::Bitmap *)&v15, (const degas::Bitmap *)&v15);
        if (!updated)
        {
          uint64_t v12 = *(void *)(a1 + 1288);
          if ((v12 & 0x8000000000000000) == 0) {
            *(void *)(a1 + 1288) = v12 + 1;
          }
          if ((*(_WORD *)(a1 + 1356) & 0x10) != 0) {
            degas::Bitmap::setBit((degas::Bitmap *)(a1 + 1408), *a2);
          }
          if (degas::sDatabaseInsertLabelTracking == 1) {
            degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)(a1 + 1648), (uint64_t)(a2 + 1));
          }
          uint64_t updated = 0;
        }
      }
      v14[0] = (unint64_t)v16;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v14);
      *(void *)&long long v15 = v18;
      std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v15);
    }
  }
  return updated;
}

void sub_1D17A9C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  a13 = (void **)&a21;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a13);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::checkNodeExistsForIdentifier(degas::Database *this, sqlite3_int64 a2)
{
  degas::NodeCursor::NodeCursor(v6);
  degas::NodeCursor::setForIdentifier((degas::NodeCursor *)v6, a2, (degas::Database *)((char *)this + 192));
  uint64_t v4 = degas::Statement::next((sqlite3_stmt **)v6[0]);
  if (v4 == 1)
  {
    if (sqlite3_column_int64(*(sqlite3_stmt **)v6[0], 0) == a2) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 3;
    }
  }
  degas::Cursor::~Cursor(v6);
  return v4;
}

void sub_1D17A9D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::Database::insertNodes(sqlite3 **this, sqlite3_int64 **a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  if ((char *)v4 - (char *)*a2 == 56)
  {
    sqlite3_int64 v5 = *a2;
    return degas::Database::insertNode((degas::Database *)this, v5);
  }
  else
  {
    v16[0] = 0;
    v16[1] = 0;
    long long v15 = v16;
    long long v13 = 0u;
    memset(v14, 0, 25);
    if (v3 == v4)
    {
LABEL_25:
      uint64_t v7 = 0;
    }
    else
    {
      while (1)
      {
        if (degas::sDatabaseLabelReferenceChecking == 1)
        {
          uint64_t v7 = degas::Database::verifyLabels((degas::Database *)this, (const degas::Bitmap *)(v3 + 1));
          if (v7) {
            break;
          }
        }
        uint64_t v7 = degas::NodeTable::insert(this + 24, v3, (const degas::Bitmap *)(v3 + 1));
        if (v7) {
          break;
        }
        degas::Bitmap::begin(v3 + 1, v12);
        sqlite3_int64 v8 = v3[4];
        while (1)
        {
          BOOL v9 = (sqlite3_int64 *)v12[0] == v3 + 1 && v12[1] == -1;
          if (v9 && v12[2] == v8) {
            break;
          }
          (*(void (**)(sqlite3 *))(*(void *)this[167] + 80))(this[167]);
          degas::Bitmap::iterator::operator++(v12);
        }
        unint64_t v11 = (unint64_t)this[160];
        if ((v11 & 0x8000000000000000) == 0) {
          this[160] = (sqlite3 *)(v11 + 1);
        }
        if ((*((_WORD *)this + 678) & 0x10) != 0) {
          degas::Bitmap::setBit((degas::Bitmap *)(this + 170), *v3);
        }
        if (degas::sDatabaseInsertLabelTracking == 1) {
          degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)(this + 206), (uint64_t)(v3 + 1));
        }
        v3 += 7;
        if (v3 == v4) {
          goto LABEL_25;
        }
      }
    }
    v12[0] = (unint64_t)v14;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v12);
    std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::destroy(v16[0]);
    return v7;
  }
}

void sub_1D17A9EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char *a21)
{
  a10 = (void **)&a15;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a10);
  std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::destroy(a21);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::insertEdges(sqlite3 **this, sqlite3_int64 **a2)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  unint64_t v4 = 0x8E38E38E38E38E39 * (v3 - *a2);
  if (!v4) {
    return 0;
  }
  if (v4 != 1)
  {
    v65[0] = 0;
    v65[1] = 0;
    v63[1] = 0;
    v64 = v65;
    v62 = v63;
    v63[0] = 0;
    long long v60 = 0u;
    memset(v61, 0, 25);
    long long v58 = 0u;
    memset(v59, 0, 25);
    long long v56 = 0u;
    memset(v57, 0, 25);
    while (v2 != v3)
    {
      degas::Bitmap::setBit((degas::Bitmap *)&v58, v2[7]);
      degas::Bitmap::setBit((degas::Bitmap *)&v58, v2[8]);
      v2 += 9;
    }
    degas::Database::findMissingNodesForIdentifiers((degas::Database *)this, (long long **)&v58, (degas::Bitmap *)&v56);
    uint64_t v10 = v56;
    if ((void)v56 == 0xFFFFFFFFLL)
    {
      unint64_t v11 = (uint64_t *)v57[0];
      uint64_t v12 = (uint64_t *)v57[1];
      if (v57[0] == v57[1])
      {
        uint64_t v10 = 0;
      }
      else
      {
        uint64_t v10 = 0;
        do
        {
          uint64_t v13 = *v11;
          unsigned int v14 = *(_DWORD *)(*v11 + 4);
          if (v14 == -1)
          {
            uint64_t v15 = 0;
            int32x4_t v16 = 0uLL;
            do
            {
              do
              {
                int32x4_t v16 = (int32x4_t)vpadalq_u16((uint32x4_t)v16, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v13 + 4 * v15 + 16))));
                v15 += 4;
              }
              while (v15 != 32);
              uint64_t v15 = 0;
              unsigned int v14 = vaddvq_s32(v16);
              int32x4_t v16 = 0uLL;
            }
            while (v14 == -1);
            *(_DWORD *)(v13 + 4) = v14;
          }
          v10 += v14;
          v11 += 2;
        }
        while (v11 != v12);
      }
      *(void *)&long long v56 = v10;
    }
    if (v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        int v53 = degas::Bitmap::count((degas::Bitmap *)&v56);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v53;
        _os_log_fault_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "failed edge insert because %d source or target nodes do not exist", buf, 8u);
      }
      uint64_t v8 = 3;
    }
    else
    {
      uint64_t v17 = *a2;
      char v18 = a2[1];
      if (*a2 == v18)
      {
LABEL_79:
        v45 = (char *)v64;
        if (v64 == v65) {
          goto LABEL_88;
        }
        do
        {
          uint64_t updated = degas::Database::updateNodeEdges((degas::Database *)this, *((void *)v45 + 4), (const degas::Bitmap *)&v60, (const degas::Bitmap *)(v45 + 40), (const degas::Bitmap *)&v60, (const degas::Bitmap *)&v60);
          uint64_t v8 = updated;
          v47 = (char *)*((void *)v45 + 1);
          if (v47)
          {
            do
            {
              v48 = (char **)v47;
              v47 = *(char **)v47;
            }
            while (v47);
          }
          else
          {
            do
            {
              v48 = (char **)*((void *)v45 + 2);
              BOOL v20 = *v48 == v45;
              v45 = (char *)v48;
            }
            while (!v20);
          }
          if (v48 == v65) {
            break;
          }
          v45 = (char *)v48;
        }
        while (!updated);
        if (!updated)
        {
LABEL_88:
          v49 = (char *)v62;
          if (v62 == v63)
          {
            uint64_t v8 = 0;
          }
          else
          {
            do
            {
              uint64_t v50 = degas::Database::updateNodeEdges((degas::Database *)this, *((void *)v49 + 4), (const degas::Bitmap *)(v49 + 40), (const degas::Bitmap *)&v60, (const degas::Bitmap *)&v60, (const degas::Bitmap *)&v60);
              uint64_t v8 = v50;
              v51 = (char *)*((void *)v49 + 1);
              if (v51)
              {
                do
                {
                  v52 = (char **)v51;
                  v51 = *(char **)v51;
                }
                while (v51);
              }
              else
              {
                do
                {
                  v52 = (char **)*((void *)v49 + 2);
                  BOOL v20 = *v52 == v49;
                  v49 = (char *)v52;
                }
                while (!v20);
              }
              if (v52 == v63) {
                break;
              }
              v49 = (char *)v52;
            }
            while (!v50);
          }
        }
      }
      else
      {
        while (1)
        {
          if (degas::sDatabaseLabelReferenceChecking == 1)
          {
            uint64_t v8 = degas::Database::verifyLabels((degas::Database *)this, (const degas::Bitmap *)(v17 + 1));
            if (v8) {
              break;
            }
          }
          uint64_t v8 = degas::EdgeTable::insert(this + 31, v17, (const degas::Bitmap *)(v17 + 1), v17[7], v17[8]);
          if (v8) {
            break;
          }
          degas::Bitmap::begin(v17 + 1, buf);
          sqlite3_int64 v19 = v17[4];
          while (1)
          {
            BOOL v20 = *(sqlite3_int64 **)buf == v17 + 1 && v68 == -1;
            if (v20 && (void)v69 == v19) {
              break;
            }
            (*(void (**)(sqlite3 *))(*(void *)this[167] + 96))(this[167]);
            degas::Bitmap::iterator::operator++((unint64_t *)buf);
          }
          uint64_t v22 = v65[0];
          if (!v65[0]) {
            goto LABEL_51;
          }
          unint64_t v23 = v17[7];
          uint64_t v24 = v65;
          do
          {
            uint64_t v25 = v22;
            uint64_t v26 = v24;
            unint64_t v27 = *((void *)v22 + 4);
            uint64_t v28 = (char **)(v22 + 8);
            if (v27 >= v23)
            {
              uint64_t v28 = (char **)v25;
              uint64_t v24 = (char **)v25;
            }
            uint64_t v22 = *v28;
          }
          while (v22);
          if (v24 != v65 && (v27 >= v23 ? (uint64_t v29 = v25) : (uint64_t v29 = v26), v23 >= v29[4]))
          {
            uint64_t v39 = (degas::Bitmap *)(v26 + 5);
            v40 = (degas::Bitmap *)(v25 + 40);
            if (v27 >= v23) {
              v41 = v40;
            }
            else {
              v41 = v39;
            }
            degas::Bitmap::setBit(v41, *v17);
          }
          else
          {
LABEL_51:
            long long v54 = 0u;
            memset(v55, 0, 25);
            degas::Bitmap::setBit((degas::Bitmap *)&v54, *v17);
            *(void *)buf = v17[7];
            uint64_t v68 = v54;
            long long v69 = 0u;
            long long v70 = 0u;
            std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v69 + 8, *(long long **)&v55[0], *((long long **)&v55[0] + 1), (uint64_t)(*((void *)&v55[0] + 1) - *(void *)&v55[0]) >> 4);
            char v71 = BYTE8(v55[1]);
            std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long const,degas::Bitmap>>((uint64_t *)&v64, *(unint64_t *)buf, (uint64_t)buf);
            v66 = (void **)&v69 + 1;
            std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v66);
            *(void *)buf = v55;
            std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
          }
          uint64_t v30 = v63[0];
          if (!v63[0]) {
            goto LABEL_62;
          }
          unint64_t v31 = v17[8];
          v32 = v63;
          do
          {
            uint64_t v33 = v30;
            uint64_t v34 = v32;
            unint64_t v35 = *((void *)v30 + 4);
            v36 = (char **)(v30 + 8);
            if (v35 >= v31)
            {
              v36 = (char **)v33;
              v32 = (char **)v33;
            }
            uint64_t v30 = *v36;
          }
          while (v30);
          if (v32 != v63 && (v35 >= v31 ? (uint64_t v37 = v33) : (uint64_t v37 = v34), v31 >= v37[4]))
          {
            v42 = (degas::Bitmap *)(v34 + 5);
            v43 = (degas::Bitmap *)(v33 + 40);
            if (v35 >= v31) {
              v44 = v43;
            }
            else {
              v44 = v42;
            }
            degas::Bitmap::setBit(v44, *v17);
          }
          else
          {
LABEL_62:
            long long v54 = 0u;
            memset(v55, 0, 25);
            degas::Bitmap::setBit((degas::Bitmap *)&v54, *v17);
            *(void *)buf = v17[8];
            uint64_t v68 = v54;
            long long v69 = 0u;
            long long v70 = 0u;
            std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v69 + 8, *(long long **)&v55[0], *((long long **)&v55[0] + 1), (uint64_t)(*((void *)&v55[0] + 1) - *(void *)&v55[0]) >> 4);
            char v71 = BYTE8(v55[1]);
            std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long const,degas::Bitmap>>((uint64_t *)&v62, *(unint64_t *)buf, (uint64_t)buf);
            v66 = (void **)&v69 + 1;
            std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v66);
            *(void *)buf = v55;
            std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
          }
          unint64_t v38 = (unint64_t)this[161];
          if ((v38 & 0x8000000000000000) == 0) {
            this[161] = (sqlite3 *)(v38 + 1);
          }
          if ((*((_WORD *)this + 678) & 0x10) != 0) {
            degas::Bitmap::setBit((degas::Bitmap *)(this + 176), *v17);
          }
          if (degas::sDatabaseInsertLabelTracking == 1) {
            degas::Bitmap::unionWith<degas::Bitmap>((degas::Bitmap *)(this + 206), (uint64_t)(v17 + 1));
          }
          v17 += 9;
          if (v17 == v18) {
            goto LABEL_79;
          }
        }
      }
    }
    *(void *)buf = v57;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    *(void *)buf = v59;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    *(void *)buf = v61;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::destroy(v63[0]);
    std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::destroy(v65[0]);
    return v8;
  }
  BOOL v6 = *a2;
  return degas::Database::insertEdge((uint64_t)this, v6);
}

void sub_1D17AA588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  *(void *)(v33 - 160) = &a21;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v33 - 160));
  *(void *)(v33 - 160) = &a27;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v33 - 160));
  *(void *)(v33 - 160) = &a33;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v33 - 160));
  std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::destroy(*(char **)(v33 - 208));
  std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::destroy(*(char **)(v33 - 184));
  _Unwind_Resume(a1);
}

uint64_t degas::Database::findMissingNodesForIdentifiers(degas::Database *this, long long **a2, degas::Bitmap *a3)
{
  v11[0] = (degas::BitsetPtr *)*a2;
  memset(&v11[1], 0, 32);
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)&v11[2], a2[2], a2[3], a2[3] - a2[2]);
  char v12 = *((unsigned char *)a2 + 40);
  degas::NodeCursor::NodeCursor(v10);
  degas::NodeCursor::setForIdentifiers((degas::NodeCursor *)v10, (Bitmap *)a2, (degas::Database *)((char *)this + 192));
  while (1)
  {
    unsigned int v6 = degas::Statement::next((sqlite3_stmt **)v10[0]);
    if (v6 != 1) {
      break;
    }
    sqlite3_int64 v7 = sqlite3_column_int64(*(sqlite3_stmt **)v10[0], 0);
    degas::Bitmap::clearBit(v11, v7);
  }
  if (v6 == 2) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v6;
  }
  if (!v8) {
    degas::Bitmap::operator=(a3, v11);
  }
  degas::Cursor::~Cursor(v10);
  v10[0] = (degas::Statement *)&v11[2];
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v10);
  return v8;
}

void sub_1D17AA720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
}

uint64_t *std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long const,degas::Bitmap>>(uint64_t *result, unint64_t a2, uint64_t a3)
{
  unint64_t v4 = (uint64_t **)result;
  unsigned int v6 = (uint64_t **)(result + 1);
  sqlite3_int64 v5 = (uint64_t *)result[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        sqlite3_int64 v7 = (uint64_t **)v5;
        unint64_t v8 = v5[4];
        if (v8 <= a2) {
          break;
        }
        sqlite3_int64 v5 = *v7;
        unsigned int v6 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if (v8 >= a2) {
        break;
      }
      sqlite3_int64 v5 = v7[1];
      if (!v5)
      {
        unsigned int v6 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    sqlite3_int64 v7 = (uint64_t **)(result + 1);
LABEL_9:
    BOOL v9 = operator new(0x58uLL);
    *((_OWORD *)v9 + 2) = *(_OWORD *)a3;
    *((_OWORD *)v9 + 3) = 0u;
    *((_OWORD *)v9 + 4) = 0u;
    std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)v9 + 56, *(long long **)(a3 + 24), *(long long **)(a3 + 32), (uint64_t)(*(void *)(a3 + 32) - *(void *)(a3 + 24)) >> 4);
    *((unsigned char *)v9 + 80) = *(unsigned char *)(a3 + 48);
    return std::__tree<std::__value_type<unsigned long long,degas::Bitmap>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,degas::Bitmap>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,degas::Bitmap>>>::__insert_node_at(v4, (uint64_t)v7, v6, (uint64_t *)v9);
  }
  return result;
}

void sub_1D17AA830(_Unwind_Exception *a1)
{
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<unsigned long long,degas::Bitmap>,void *>>>::operator()[abi:ne180100](0, v1);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::removeNode(degas::Database *this, unint64_t a2)
{
  if (*((unsigned char *)this + 32)) {
    return 8;
  }
  long long v18 = 0u;
  memset(v19, 0, 25);
  long long v16 = 0u;
  memset(v17, 0, 25);
  degas::NodeCursor::NodeCursor(&v13);
  degas::NodeCursor::setForIdentifier((degas::NodeCursor *)&v13, a2, (degas::Database *)((char *)this + 192));
  if (degas::Statement::next((sqlite3_stmt **)v13) == 1)
  {
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v13, 2, (degas::Bitmap *)&v18);
    sqlite3_int64 v5 = degas::Statement::literalBitmapColumnValue((sqlite3_stmt **)v13, 3);
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v13, 1, (degas::Bitmap *)&v16);
    degas::Bitmap::unionWith<degas::LiteralBitmap>((degas::Bitmap *)&v18, (uint64_t)v5);
    degas::Cursor::~Cursor(&v13);
    if ((*((_WORD *)this + 678) & 0x10) != 0)
    {
      uint64_t v13 = (degas::Statement *)*((void *)this + 3);
      unint64_t v14 = (unint64_t)this + 40;
      degas::TombstoneCopier::copyNode((degas::TombstoneCopier *)&v13, a2);
    }
    degas::Bitmap::begin(&v18, &v13);
    uint64_t v6 = v19[1];
    while (1)
    {
      BOOL v7 = v13 == (degas::Statement *)&v18 && v14 == -1;
      if (v7 && v15 == v6) {
        break;
      }
      degas::Database::removeEdge(this, v14, a2);
      degas::Bitmap::iterator::operator++((unint64_t *)&v13);
    }
    degas::Bitmap::begin(&v16, &v13);
    uint64_t v9 = v17[1];
    while (1)
    {
      BOOL v10 = v13 == (degas::Statement *)&v16 && v14 == -1;
      if (v10 && v15 == v9) {
        break;
      }
      (*(void (**)(void))(**((void **)this + 167) + 88))(*((void *)this + 167));
      degas::Bitmap::iterator::operator++((unint64_t *)&v13);
    }
    uint64_t v2 = degas::AttributeValueTable::deleteEntry((degas::Database *)((char *)this + 360), a2);
    if (!v2)
    {
      uint64_t v2 = degas::NodeTable::deleteEntry((sqlite3 **)this + 24, a2);
      if (!v2)
      {
        if ((*((_WORD *)this + 678) & 0x10) != 0) {
          degas::Database::TransactionChanges::deleteNode((degas::BitsetPtr **)this + 170, a2);
        }
        uint64_t v2 = 0;
      }
    }
  }
  else
  {
    degas::Cursor::~Cursor(&v13);
    uint64_t v2 = 2;
  }
  uint64_t v13 = (degas::Statement *)v17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v13);
  *(void *)&long long v16 = v19;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v16);
  return v2;
}

void sub_1D17AAA5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  a10 = (void **)&a15;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a10);
  a13 = (void **)&a21;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a13);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::removeEdge(degas::Database *this, unint64_t a2, uint64_t a3)
{
  if (*((unsigned char *)this + 32)) {
    return 8;
  }
  BOOL v7 = (degas::EdgeCursor *)degas::EdgeCursor::EdgeCursor(v21);
  degas::EdgeCursor::setForIdentifier(v7, a2, (degas::Database *)((char *)this + 248));
  if (degas::Statement::next((sqlite3_stmt **)v21[0]) == 1)
  {
    if ((*((_WORD *)this + 678) & 0x10) != 0)
    {
      *(void *)&long long v19 = *((void *)this + 3);
      *((void *)&v19 + 1) = (char *)this + 40;
      degas::TombstoneCopier::copyEdge((degas::TombstoneCopier *)&v19, a2);
    }
    sqlite3_int64 v8 = sqlite3_column_int64(*(sqlite3_stmt **)v21[0], 2);
    sqlite3_int64 v9 = sqlite3_column_int64(*(sqlite3_stmt **)v21[0], 3);
    memset(v20, 0, 25);
    long long v19 = 0u;
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v21[0], 1, (degas::Bitmap *)&v19);
    long long v17 = 0u;
    memset(v18, 0, 25);
    long long v15 = 0u;
    memset(v16, 0, 25);
    degas::Bitmap::setBit((degas::Bitmap *)&v17, a2);
    if (v8 == a3
      || (uint64_t updated = degas::Database::updateNodeEdges(this, v8, (const degas::Bitmap *)&v15, (const degas::Bitmap *)&v15, (const degas::Bitmap *)&v15, (const degas::Bitmap *)&v17), !updated))
    {
      if (v9 == a3
        || (uint64_t updated = degas::Database::updateNodeEdges(this, v9, (const degas::Bitmap *)&v15, (const degas::Bitmap *)&v15, (const degas::Bitmap *)&v17, (const degas::Bitmap *)&v15), !updated))
      {
        degas::Bitmap::begin(&v19, v14);
        uint64_t v10 = v20[1];
        while (1)
        {
          BOOL v11 = (long long *)v14[0] == &v19 && v14[1] == -1;
          if (v11 && v14[2] == v10) {
            break;
          }
          (*(void (**)(void))(**((void **)this + 167) + 104))(*((void *)this + 167));
          degas::Bitmap::iterator::operator++(v14);
        }
        degas::AttributeValueTable::deleteEntry((degas::Database *)((char *)this + 416), a2);
        uint64_t updated = degas::EdgeTable::deleteEntry((sqlite3 **)this + 31, a2);
        if (!updated)
        {
          if ((*((_WORD *)this + 678) & 0x10) != 0) {
            degas::Bitmap::setBit((degas::Database *)((char *)this + 1408), a2);
          }
          uint64_t updated = 0;
        }
      }
    }
    v14[0] = (unint64_t)v16;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v14);
    *(void *)&long long v15 = v18;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v15);
    *(void *)&long long v17 = v20;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v17);
  }
  else
  {
    uint64_t updated = 2;
  }
  degas::Cursor::~Cursor(v21);
  return updated;
}

void sub_1D17AAD0C(_Unwind_Exception *a1)
{
  degas::Cursor::~Cursor((degas::Statement **)(v1 - 80));
  _Unwind_Resume(a1);
}

uint64_t degas::Database::TransactionChanges::deleteNode(degas::BitsetPtr **this, unint64_t a2)
{
  if (degas::Bitmap::isSet((degas::Bitmap *)this, a2))
  {
    return degas::Bitmap::clearBit(this, a2);
  }
  else
  {
    if (degas::Bitmap::isSet((degas::Bitmap *)(this + 12), a2)) {
      degas::Bitmap::clearBit(this + 12, a2);
    }
    return degas::Bitmap::setBit((degas::Bitmap *)(this + 24), a2);
  }
}

uint64_t degas::Database::removeNodes(degas::Database *this, Bitmap *a2)
{
  if (*((unsigned char *)this + 32)) {
    return 8;
  }
  if (a2->_bitSets.__begin_ == a2->_bitSets.__end_) {
    return 0;
  }
  if ((*((_WORD *)this + 678) & 0x10) != 0)
  {
    *(void *)&long long v21 = *((void *)this + 3);
    *((void *)&v21 + 1) = (char *)this + 40;
    degas::TombstoneCopier::copyNodes((degas::TombstoneCopier *)&v21, a2);
  }
  long long v21 = 0u;
  memset(v22, 0, 25);
  memset(&v20, 0, 41);
  long long v18 = 0u;
  memset(v19, 0, 25);
  degas::NodeCursor::NodeCursor(v17);
  degas::NodeCursor::setForIdentifiers((degas::NodeCursor *)v17, a2, (degas::Database *)((char *)this + 192));
  while (degas::Statement::next((sqlite3_stmt **)v17[0]) == 1)
  {
    sqlite3_int64 v5 = degas::Statement::literalBitmapColumnValue((sqlite3_stmt **)v17[0], 2);
    uint64_t v6 = degas::Statement::literalBitmapColumnValue((sqlite3_stmt **)v17[0], 3);
    BOOL v7 = degas::Statement::literalBitmapColumnValue((sqlite3_stmt **)v17[0], 1);
    degas::Bitmap::unionWith<degas::LiteralBitmap>((degas::Bitmap *)&v20, (uint64_t)v5);
    degas::Bitmap::unionWith<degas::LiteralBitmap>((degas::Bitmap *)&v20, (uint64_t)v6);
    degas::Bitmap::unionWith<degas::LiteralBitmap>((degas::Bitmap *)&v18, (uint64_t)v7);
    sqlite3_int64 v8 = sqlite3_column_int64(*(sqlite3_stmt **)v17[0], 0);
    uint64_t v2 = degas::AttributeValueTable::deleteEntry((degas::Database *)((char *)this + 360), v8);
    if (v2) {
      goto LABEL_25;
    }
  }
  (*(void (**)(void, long long *, Bitmap *))(**((void **)this + 167) + 112))(*((void *)this + 167), &v18, a2);
  uint64_t v2 = degas::Database::removeEdges(this, &v20, (const degas::Bitmap *)a2);
  if (!v2)
  {
    degas::Bitmap::begin(a2, &v14);
    end = a2->_bitSets.__end_;
    while (1)
    {
      unint64_t v10 = v15;
      BOOL v11 = (Bitmap *)v14 == a2 && v15 == -1;
      if (v11 && v16 == end) {
        break;
      }
      uint64_t v2 = degas::NodeTable::deleteEntry((sqlite3 **)this + 24, v15);
      if (v2) {
        goto LABEL_25;
      }
      if ((*((_WORD *)this + 678) & 0x10) != 0) {
        degas::Database::TransactionChanges::deleteNode((degas::BitsetPtr **)this + 170, v10);
      }
      degas::Bitmap::iterator::operator++(&v14);
    }
    uint64_t v2 = 0;
  }
LABEL_25:
  degas::Cursor::~Cursor(v17);
  unint64_t v14 = (unint64_t)v19;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
  *(void *)&long long v18 = &v20._bitSets;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v18);
  v20._bitCount = (unint64_t)v22;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v20);
  return v2;
}

void sub_1D17AB05C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10, uint64_t a11, uint64_t a12, degas::Statement *a13, uint64_t a14, void **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void **a21,uint64_t a22,uint64_t a23)
{
  degas::Cursor::~Cursor(&a13);
  a10 = (void **)&a17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a10);
  a15 = (void **)&a23;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a15);
  a21 = (void **)(v23 - 96);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a21);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::removeEdges(degas::Database *this, Bitmap *a2, const degas::Bitmap *a3)
{
  if (*((unsigned char *)this + 32)) {
    return 8;
  }
  if (a2->_bitSets.__begin_ == a2->_bitSets.__end_) {
    return 0;
  }
  if ((*((_WORD *)this + 678) & 0x10) != 0)
  {
    *(void *)&long long v32 = *((void *)this + 3);
    *((void *)&v32 + 1) = (char *)this + 40;
    degas::TombstoneCopier::copyEdges((degas::TombstoneCopier *)&v32, a2);
  }
  BOOL v7 = (degas::EdgeCursor *)degas::EdgeCursor::EdgeCursor(v34);
  degas::EdgeCursor::setForIdentifiers(v7, a2, (degas::Database *)((char *)this + 248));
  long long v32 = 0u;
  memset(v33, 0, 25);
  memset(v31, 0, 25);
  long long v30 = 0u;
  long long v28 = 0u;
  memset(v29, 0, 25);
  uint64_t updated = 2;
  long long v26 = 0u;
  memset(v27, 0, 25);
  while (degas::Statement::next((sqlite3_stmt **)v34[0]) == 1)
  {
    sqlite3_int64 v8 = sqlite3_column_int64(*(sqlite3_stmt **)v34[0], 2);
    degas::Bitmap::setBit((degas::Bitmap *)&v32, v8);
    sqlite3_int64 v9 = sqlite3_column_int64(*(sqlite3_stmt **)v34[0], 3);
    degas::Bitmap::setBit((degas::Bitmap *)&v30, v9);
    unint64_t v10 = degas::Statement::literalBitmapColumnValue((sqlite3_stmt **)v34[0], 1);
    degas::Bitmap::unionWith<degas::LiteralBitmap>((degas::Bitmap *)&v28, (uint64_t)v10);
    sqlite3_int64 v11 = sqlite3_column_int64(*(sqlite3_stmt **)v34[0], 0);
    uint64_t updated = degas::AttributeValueTable::deleteEntry((degas::Database *)((char *)this + 416), v11);
  }
  degas::Bitmap::diffWith<degas::Bitmap>((degas::Bitmap *)&v32, a3);
  degas::Bitmap::begin(&v32, &v23);
  char v12 = (BitsetPtr *)v33[1];
  while (1)
  {
    BOOL v13 = (long long *)v23 == &v32 && v24 == -1;
    if (v13 && v25 == v12) {
      break;
    }
    uint64_t updated = degas::Database::updateNodeEdges(this, v24, (const degas::Bitmap *)&v26, (const degas::Bitmap *)&v26, (const degas::Bitmap *)&v26, (const degas::Bitmap *)a2);
    if (updated) {
      goto LABEL_48;
    }
    degas::Bitmap::iterator::operator++(&v23);
  }
  degas::Bitmap::diffWith<degas::Bitmap>((degas::Bitmap *)&v30, a3);
  degas::Bitmap::begin(&v30, &v23);
  unint64_t v15 = (BitsetPtr *)v31[1];
  while (1)
  {
    BOOL v16 = (long long *)v23 == &v30 && v24 == -1;
    if (v16 && v25 == v15) {
      break;
    }
    uint64_t updated = degas::Database::updateNodeEdges(this, v24, (const degas::Bitmap *)&v26, (const degas::Bitmap *)&v26, (const degas::Bitmap *)a2, (const degas::Bitmap *)&v26);
    if (updated) {
      goto LABEL_48;
    }
    degas::Bitmap::iterator::operator++(&v23);
  }
  (*(void (**)(void, long long *, Bitmap *))(**((void **)this + 167) + 120))(*((void *)this + 167), &v28, a2);
  if (!updated)
  {
    degas::Bitmap::begin(a2, &v23);
    end = a2->_bitSets.__end_;
    while (1)
    {
      unint64_t v19 = v24;
      BOOL v20 = (Bitmap *)v23 == a2 && v24 == -1;
      if (v20 && v25 == end) {
        break;
      }
      uint64_t updated = degas::EdgeTable::deleteEntry((sqlite3 **)this + 31, v24);
      if (updated) {
        goto LABEL_48;
      }
      if ((*((_WORD *)this + 678) & 0x10) != 0)
      {
        if (degas::Bitmap::isSet((degas::Database *)((char *)this + 1408), v19))
        {
          degas::Bitmap::clearBit((degas::BitsetPtr **)this + 176, v19);
        }
        else
        {
          if (degas::Bitmap::isSet((degas::Database *)((char *)this + 1504), v19)) {
            degas::Bitmap::clearBit((degas::BitsetPtr **)this + 188, v19);
          }
          degas::Bitmap::setBit((degas::Database *)((char *)this + 1600), v19);
        }
      }
      degas::Bitmap::iterator::operator++(&v23);
    }
    uint64_t updated = 0;
  }
LABEL_48:
  unint64_t v23 = (unint64_t)v27;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v23);
  *(void *)&long long v26 = v29;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v26);
  *(void *)&long long v28 = v31;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v28);
  *(void *)&long long v30 = v33;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v30);
  degas::Cursor::~Cursor(v34);
  return updated;
}

void sub_1D17AB428(_Unwind_Exception *a1)
{
  degas::Cursor::~Cursor((degas::Statement **)(v1 - 96));
  _Unwind_Resume(a1);
}

uint64_t degas::Database::removeEdge(degas::Database *this, unint64_t a2)
{
  return degas::Database::removeEdge(this, a2, 0);
}

uint64_t degas::Database::removeEdges(degas::Database *this, Bitmap *a2)
{
  long long v4 = 0u;
  memset(v5, 0, 25);
  uint64_t v2 = degas::Database::removeEdges(this, a2, (const degas::Bitmap *)&v4);
  uint64_t v6 = (void **)v5;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v6);
  return v2;
}

void sub_1D17AB510(_Unwind_Exception *a1)
{
  *(void *)(v2 - 24) = v1 + 16;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t degas::Database::getNodeInfo(degas::Database *this, sqlite3_int64 a2, degas::Bitmap *a3, degas::Bitmap *a4, degas::Bitmap *a5)
{
  degas::NodeCursor::NodeCursor(v12);
  degas::NodeCursor::setForIdentifier((degas::NodeCursor *)v12, a2, (degas::Database *)((char *)this + 192));
  if (degas::Statement::next((sqlite3_stmt **)v12[0]) == 1)
  {
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v12[0], 1, a3);
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v12[0], 2, a4);
    degas::Statement::bitmapColumnValue((sqlite3_stmt **)v12[0], 3, a5);
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 2;
  }
  degas::Cursor::~Cursor(v12);
  return v10;
}

void sub_1D17AB5E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::Database::appendSourceNodesForEdges(degas::Database *this, Bitmap *a2, degas::Bitmap *a3)
{
  degas::EdgeCursor::EdgeCursor(v8);
  degas::EdgeCursor::setForIdentifiers((degas::EdgeCursor *)v8, a2, (degas::Database *)((char *)this + 248));
  while (degas::Statement::next((sqlite3_stmt **)v8[0]) == 1)
  {
    sqlite3_int64 v6 = sqlite3_column_int64(*(sqlite3_stmt **)v8[0], 2);
    degas::Bitmap::setBit(a3, v6);
  }
  degas::Cursor::~Cursor(v8);
  return 0;
}

void sub_1D17AB684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::Database::appendTargetNodesForEdges(degas::Database *this, Bitmap *a2, degas::Bitmap *a3)
{
  degas::EdgeCursor::EdgeCursor(v8);
  degas::EdgeCursor::setForIdentifiers((degas::EdgeCursor *)v8, a2, (degas::Database *)((char *)this + 248));
  while (degas::Statement::next((sqlite3_stmt **)v8[0]) == 1)
  {
    sqlite3_int64 v6 = sqlite3_column_int64(*(sqlite3_stmt **)v8[0], 3);
    degas::Bitmap::setBit(a3, v6);
  }
  degas::Cursor::~Cursor(v8);
  return 0;
}

void sub_1D17AB72C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::Database::appendAllNodesForEdges(degas::Database *this, Bitmap *a2, degas::Bitmap *a3)
{
  degas::EdgeCursor::EdgeCursor(v9);
  degas::EdgeCursor::setForIdentifiers((degas::EdgeCursor *)v9, a2, (degas::Database *)((char *)this + 248));
  while (degas::Statement::next((sqlite3_stmt **)v9[0]) == 1)
  {
    sqlite3_int64 v6 = sqlite3_column_int64(*(sqlite3_stmt **)v9[0], 3);
    degas::Bitmap::setBit(a3, v6);
    sqlite3_int64 v7 = sqlite3_column_int64(*(sqlite3_stmt **)v9[0], 2);
    degas::Bitmap::setBit(a3, v7);
  }
  degas::Cursor::~Cursor(v9);
  return 0;
}

void sub_1D17AB7F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::Database::appendSourceAndTargetNodesForEdges(degas::Database *this, Bitmap *a2, degas::Bitmap *a3, degas::Bitmap *a4)
{
  degas::EdgeCursor::EdgeCursor(v11);
  degas::EdgeCursor::setForIdentifiers((degas::EdgeCursor *)v11, a2, (degas::Database *)((char *)this + 248));
  while (degas::Statement::next((sqlite3_stmt **)v11[0]) == 1)
  {
    sqlite3_int64 v8 = sqlite3_column_int64(*(sqlite3_stmt **)v11[0], 3);
    degas::Bitmap::setBit(a4, v8);
    sqlite3_int64 v9 = sqlite3_column_int64(*(sqlite3_stmt **)v11[0], 2);
    degas::Bitmap::setBit(a3, v9);
  }
  degas::Cursor::~Cursor(v11);
  return 0;
}

void sub_1D17AB8BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::Database::sortNodesByIntAttribute(uint64_t a1, sqlite3_int64 a2, int a3, sqlite3_int64 a4, Bitmap *a5, uint64_t a6)
{
  degas::SortAttributeValueCursor::SortAttributeValueCursor(v17);
  degas::SortAttributeValueCursor::setForIntAttrIdentifiers((degas::SortAttributeValueCursor *)v17, a2, a5, a3, a4, (const degas::SortAttributeValueTable *)(a1 + 584));
  while (1)
  {
    unsigned int v12 = degas::Statement::next((sqlite3_stmt **)v17[0]);
    if (v12 != 1) {
      break;
    }
    sqlite3_int64 v13 = sqlite3_column_int64(*(sqlite3_stmt **)v17[0], 0);
    sqlite3_int64 v14 = sqlite3_column_int64(*(sqlite3_stmt **)v17[0], 1);
    (*(void (**)(uint64_t, sqlite3_int64, sqlite3_int64))(a6 + 16))(a6, v13, v14);
  }
  if (v12 == 2) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = v12;
  }
  degas::Cursor::~Cursor(v17);
  return v15;
}

void sub_1D17AB9B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::Database::sortNodesByRealAttribute(uint64_t a1, sqlite3_int64 a2, int a3, sqlite3_int64 a4, Bitmap *a5, uint64_t a6)
{
  degas::SortAttributeValueCursor::SortAttributeValueCursor(v17);
  degas::SortAttributeValueCursor::setForRealAttrIdentifiers((degas::SortAttributeValueCursor *)v17, a2, a5, a3, a4, (const degas::SortAttributeValueTable *)(a1 + 584));
  while (1)
  {
    unsigned int v12 = degas::Statement::next((sqlite3_stmt **)v17[0]);
    if (v12 != 1) {
      break;
    }
    sqlite3_int64 v13 = sqlite3_column_int64(*(sqlite3_stmt **)v17[0], 0);
    double v14 = sqlite3_column_double(*(sqlite3_stmt **)v17[0], 1);
    (*(void (**)(uint64_t, sqlite3_int64, double))(a6 + 16))(a6, v13, v14);
  }
  if (v12 == 2) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = v12;
  }
  degas::Cursor::~Cursor(v17);
  return v15;
}

void sub_1D17ABAA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::Database::sortNodesByStringAttribute(uint64_t a1, sqlite3_int64 a2, int a3, sqlite3_int64 a4, Bitmap *a5, uint64_t a6)
{
  degas::SortAttributeValueCursor::SortAttributeValueCursor(v18);
  degas::SortAttributeValueCursor::setForStringAttrIdentifiers((degas::SortAttributeValueCursor *)v18, a2, a5, a3, a4, (const degas::SortAttributeValueTable *)(a1 + 584));
  while (1)
  {
    unsigned int v12 = degas::Statement::next((sqlite3_stmt **)v18[0]);
    if (v12 != 1) {
      break;
    }
    sqlite3_int64 v13 = sqlite3_column_int64(*(sqlite3_stmt **)v18[0], 0);
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v17 = 0;
    degas::Statement::stringColumnValue((sqlite3_stmt **)v18[0], 1, (uint64_t)__p);
    (*(void (**)(uint64_t, sqlite3_int64, void **))(a6 + 16))(a6, v13, __p);
    if (SHIBYTE(v17) < 0) {
      operator delete(__p[0]);
    }
  }
  if (v12 == 2) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = v12;
  }
  degas::Cursor::~Cursor(v18);
  return v14;
}

void sub_1D17ABBAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, degas::Statement *a16)
{
}

uint64_t degas::Database::sortEdgesByIntAttribute(uint64_t a1, sqlite3_int64 a2, int a3, sqlite3_int64 a4, Bitmap *a5, uint64_t a6)
{
  degas::SortAttributeValueCursor::SortAttributeValueCursor(v17);
  degas::SortAttributeValueCursor::setForIntAttrIdentifiers((degas::SortAttributeValueCursor *)v17, a2, a5, a3, a4, (const degas::SortAttributeValueTable *)(a1 + 640));
  while (1)
  {
    unsigned int v12 = degas::Statement::next((sqlite3_stmt **)v17[0]);
    if (v12 != 1) {
      break;
    }
    sqlite3_int64 v13 = sqlite3_column_int64(*(sqlite3_stmt **)v17[0], 0);
    sqlite3_int64 v14 = sqlite3_column_int64(*(sqlite3_stmt **)v17[0], 1);
    (*(void (**)(uint64_t, sqlite3_int64, sqlite3_int64))(a6 + 16))(a6, v13, v14);
  }
  if (v12 == 2) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = v12;
  }
  degas::Cursor::~Cursor(v17);
  return v15;
}

void sub_1D17ABCB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::Database::sortEdgesByRealAttribute(uint64_t a1, sqlite3_int64 a2, int a3, sqlite3_int64 a4, Bitmap *a5, uint64_t a6)
{
  degas::SortAttributeValueCursor::SortAttributeValueCursor(v17);
  degas::SortAttributeValueCursor::setForRealAttrIdentifiers((degas::SortAttributeValueCursor *)v17, a2, a5, a3, a4, (const degas::SortAttributeValueTable *)(a1 + 640));
  while (1)
  {
    unsigned int v12 = degas::Statement::next((sqlite3_stmt **)v17[0]);
    if (v12 != 1) {
      break;
    }
    sqlite3_int64 v13 = sqlite3_column_int64(*(sqlite3_stmt **)v17[0], 0);
    double v14 = sqlite3_column_double(*(sqlite3_stmt **)v17[0], 1);
    (*(void (**)(uint64_t, sqlite3_int64, double))(a6 + 16))(a6, v13, v14);
  }
  if (v12 == 2) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = v12;
  }
  degas::Cursor::~Cursor(v17);
  return v15;
}

void sub_1D17ABDA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::Database::sortEdgesByStringAttribute(uint64_t a1, sqlite3_int64 a2, int a3, sqlite3_int64 a4, Bitmap *a5, uint64_t a6)
{
  degas::SortAttributeValueCursor::SortAttributeValueCursor(v18);
  degas::SortAttributeValueCursor::setForStringAttrIdentifiers((degas::SortAttributeValueCursor *)v18, a2, a5, a3, a4, (const degas::SortAttributeValueTable *)(a1 + 640));
  while (1)
  {
    unsigned int v12 = degas::Statement::next((sqlite3_stmt **)v18[0]);
    if (v12 != 1) {
      break;
    }
    sqlite3_int64 v13 = sqlite3_column_int64(*(sqlite3_stmt **)v18[0], 0);
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v17 = 0;
    degas::Statement::stringColumnValue((sqlite3_stmt **)v18[0], 1, (uint64_t)__p);
    (*(void (**)(uint64_t, sqlite3_int64, void **))(a6 + 16))(a6, v13, __p);
    if (SHIBYTE(v17) < 0) {
      operator delete(__p[0]);
    }
  }
  if (v12 == 2) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = v12;
  }
  degas::Cursor::~Cursor(v18);
  return v14;
}

void sub_1D17ABEB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, degas::Statement *a16)
{
}

unint64_t degas::Database::nodeCount(degas::Database *this)
{
  unint64_t result = *((void *)this + 160);
  if (result == -1)
  {
    unint64_t v3 = 0;
    if (degas::Table::rowCount((degas::Database *)((char *)this + 192), (sqlite3_int64 *)&v3))
    {
      return *((void *)this + 160);
    }
    else
    {
      unint64_t result = v3;
      *((void *)this + 160) = v3;
    }
  }
  return result;
}

unint64_t degas::Database::edgeCount(degas::Database *this)
{
  unint64_t result = *((void *)this + 161);
  if (result == -1)
  {
    unint64_t v3 = 0;
    if (degas::Table::rowCount((degas::Database *)((char *)this + 248), (sqlite3_int64 *)&v3))
    {
      return *((void *)this + 161);
    }
    else
    {
      unint64_t result = v3;
      *((void *)this + 161) = v3;
    }
  }
  return result;
}

uint64_t degas::Database::checkEdgeExistsForIdentifier(degas::Database *this, sqlite3_int64 a2)
{
  degas::EdgeCursor::EdgeCursor(v6);
  degas::EdgeCursor::setForIdentifier((degas::EdgeCursor *)v6, a2, (degas::Database *)((char *)this + 248));
  uint64_t v4 = degas::Statement::next((sqlite3_stmt **)v6[0]);
  if (v4 == 1)
  {
    if (sqlite3_column_int64(*(sqlite3_stmt **)v6[0], 0) == a2) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 3;
    }
  }
  degas::Cursor::~Cursor(v6);
  return v4;
}

void sub_1D17AC014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::Database::edgesOfNodes(uint64_t a1, sqlite3_stmt ***a2, void *a3, unsigned int a4)
{
  long long v13 = 0u;
  memset(v14, 0, 25);
  unsigned int v7 = a4 & 0xFFFFFFFD;
  while (1)
  {
    unsigned int v8 = degas::Statement::next(*a2);
    if (v8 != 1) {
      break;
    }
    if (a4 <= 1)
    {
      sqlite3_int64 v9 = degas::Statement::literalBitmapColumnValue(*a2, 3);
      degas::Bitmap::unionWith<degas::LiteralBitmap>((degas::Bitmap *)&v13, (uint64_t)v9);
    }
    if (!v7)
    {
      uint64_t v10 = degas::Statement::literalBitmapColumnValue(*a2, 2);
      degas::Bitmap::unionWith<degas::LiteralBitmap>((degas::Bitmap *)&v13, (uint64_t)v10);
    }
  }
  degas::Bitmap::operator=(a3, &v13);
  if (v8 == 2) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v8;
  }
  uint64_t v15 = (void **)v14;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v15);
  return v11;
}

void sub_1D17AC0FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void **a16)
{
  a16 = (void **)&a11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

void degas::Database::edgesOfNode()
{
}

void sub_1D17AC1D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<degas::NodeCursor>::reset[abi:ne180100]((degas::Statement ***)va);
  _Unwind_Resume(a1);
}

degas::Statement **std::unique_ptr<degas::NodeCursor>::reset[abi:ne180100](degas::Statement ***a1)
{
  unint64_t result = *a1;
  *a1 = 0;
  if (result)
  {
    degas::Cursor::~Cursor(result);
    JUMPOUT(0x1D25F9A90);
  }
  return result;
}

void degas::Database::edgesOfNodes()
{
}

void sub_1D17AC2DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<degas::NodeCursor>::reset[abi:ne180100]((degas::Statement ***)va);
  _Unwind_Resume(a1);
}

void degas::Database::filterEdgesOfNodes()
{
}

void sub_1D17AC3DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::unique_ptr<degas::NodeCursor>::reset[abi:ne180100]((degas::Statement ***)va);
  _Unwind_Resume(a1);
}

void degas::Database::filterEdgesBetweenNodes(degas::Database *this, const degas::Bitmap *a2, const degas::Bitmap *a3, const degas::Bitmap *a4, degas::Bitmap *a5)
{
  unint64_t v6 = degas::Bitmap::count(a2);
  if (v6 > degas::Bitmap::count(a3)) {
    degas::Database::filterEdgesOfNodes();
  }
  degas::Database::filterEdgesOfNodes();
}

void sub_1D17AC4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void **a16)
{
  a16 = (void **)&a11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

void degas::Database::edgesBetweenNodes(degas::Database *this, const degas::Bitmap *a2, const degas::Bitmap *a3, degas::Bitmap *a4)
{
  unint64_t v5 = degas::Bitmap::count(a2);
  if (v5 > degas::Bitmap::count(a3)) {
    degas::Database::edgesOfNodes();
  }
  degas::Database::edgesOfNodes();
}

void sub_1D17AC5FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void **a16)
{
  a16 = (void **)&a11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::nodeNeighbors(degas::Database *a1, sqlite3_stmt ***a2, void *a3, unsigned int a4)
{
  long long v16 = 0u;
  memset(v17, 0, 25);
  memset(&v15, 0, 41);
  unsigned int v8 = a4 & 0xFFFFFFFD;
  memset(&v14, 0, 41);
  while (1)
  {
    uint64_t v9 = degas::Statement::next(*a2);
    uint64_t v10 = v9;
    if (v9 != 1) {
      break;
    }
    if (a4 <= 1)
    {
      uint64_t v11 = degas::Statement::literalBitmapColumnValue(*a2, 3);
      if (v11[1]) {
        degas::Bitmap::unionWith<degas::LiteralBitmap>((degas::Bitmap *)&v15, (uint64_t)v11);
      }
    }
    if (!v8)
    {
      unsigned int v12 = degas::Statement::literalBitmapColumnValue(*a2, 2);
      if (v12[1]) {
        degas::Bitmap::unionWith<degas::LiteralBitmap>((degas::Bitmap *)&v14, (uint64_t)v12);
      }
    }
  }
  if (v9 == 2)
  {
    if (v15._bitSets.__begin_ != v15._bitSets.__end_) {
      degas::Database::appendTargetNodesForEdges(a1, &v15, (degas::Bitmap *)&v16);
    }
    if (v14._bitSets.__begin_ != v14._bitSets.__end_) {
      degas::Database::appendSourceNodesForEdges(a1, &v14, (degas::Bitmap *)&v16);
    }
    degas::Bitmap::operator=(a3, &v16);
    uint64_t v10 = 0;
  }
  p_bitSets = &v14._bitSets;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_bitSets);
  v14._bitCount = (unint64_t)&v15._bitSets;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);
  v15._bitCount = (unint64_t)v17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v15);
  return v10;
}

void sub_1D17AC774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  *(void *)(v23 - 56) = &a11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v23 - 56));
  a9 = (void **)&a17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a9);
  a15 = (void **)&a23;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a15);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::nodeNeighbors(uint64_t a1, unint64_t a2, degas::Bitmap *a3, unsigned int a4)
{
  memset(&v9, 0, 41);
  degas::Bitmap::setBit((degas::Bitmap *)&v9, a2);
  uint64_t v7 = degas::Database::nodeNeighbors(a1, &v9, a3, a4);
  p_bitSets = &v9._bitSets;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_bitSets);
  return v7;
}

void sub_1D17AC850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void **a16)
{
  a16 = (void **)(v16 + 16);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::nodeNeighbors(uint64_t a1, Bitmap *a2, degas::Bitmap *a3, unsigned int a4)
{
  if (a4 > 1)
  {
    uint64_t v9 = 0;
  }
  else
  {
    long long v13 = 0u;
    memset(v14, 0, 25);
    degas::LabelledEdgeCursor::LabelledEdgeCursor(v12);
    degas::LabelledEdgeCursor::setForTargetNodesFromSourceNodes((degas::LabelledEdgeCursor *)v12, a2, (const degas::LabelledEdgeTable *)(a1 + 1144));
    while (1)
    {
      uint64_t v8 = degas::Statement::next((sqlite3_stmt **)v12[0]);
      uint64_t v9 = v8;
      if (v8 != 1) {
        break;
      }
      degas::Statement::bitmapColumnValue((sqlite3_stmt **)v12[0], 0, (degas::Bitmap *)&v13);
    }
    if (v8 == 2)
    {
      degas::Bitmap::operator=(a3, &v13);
      uint64_t v9 = 0;
    }
    degas::Cursor::~Cursor(v12);
    v12[0] = (degas::Statement *)v14;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v12);
  }
  if ((a4 & 0xFFFFFFFD) == 0)
  {
    long long v13 = 0u;
    memset(v14, 0, 25);
    degas::LabelledEdgeCursor::LabelledEdgeCursor(v12);
    degas::LabelledEdgeCursor::setForSourceNodesFromTargetNodes((degas::LabelledEdgeCursor *)v12, a2, (const degas::LabelledEdgeTable *)(a1 + 1144));
    while (1)
    {
      uint64_t v10 = degas::Statement::next((sqlite3_stmt **)v12[0]);
      uint64_t v9 = v10;
      if (v10 != 1) {
        break;
      }
      degas::Statement::bitmapColumnValue((sqlite3_stmt **)v12[0], 0, (degas::Bitmap *)&v13);
    }
    if (v10 == 2)
    {
      degas::Bitmap::unionWith<degas::Bitmap>(a3, (uint64_t)&v13);
      uint64_t v9 = 0;
    }
    degas::Cursor::~Cursor(v12);
    v12[0] = (degas::Statement *)v14;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v12);
  }
  return v9;
}

void sub_1D17AC9CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t *a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13)
{
  a9 = &a13;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::nodeNeighbors(uint64_t a1, Bitmap *a2, degas::Bitmap *a3, const degas::Bitmap *a4, unsigned int a5)
{
  if (a5 > 1)
  {
    uint64_t v11 = 0;
  }
  else
  {
    long long v15 = 0u;
    memset(v16, 0, 25);
    degas::LabelledEdgeCursor::LabelledEdgeCursor(v14);
    degas::LabelledEdgeCursor::setForTargetNodesFromLabelsSourceNodes((degas::LabelledEdgeCursor *)v14, a2, a4, (const degas::LabelledEdgeTable *)(a1 + 1144));
    while (1)
    {
      uint64_t v10 = degas::Statement::next((sqlite3_stmt **)v14[0]);
      uint64_t v11 = v10;
      if (v10 != 1) {
        break;
      }
      degas::Statement::bitmapColumnValue((sqlite3_stmt **)v14[0], 0, (degas::Bitmap *)&v15);
    }
    if (v10 == 2)
    {
      degas::Bitmap::operator=(a3, &v15);
      uint64_t v11 = 0;
    }
    degas::Cursor::~Cursor(v14);
    v14[0] = (degas::Statement *)v16;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v14);
  }
  if ((a5 & 0xFFFFFFFD) == 0)
  {
    long long v15 = 0u;
    memset(v16, 0, 25);
    degas::LabelledEdgeCursor::LabelledEdgeCursor(v14);
    degas::LabelledEdgeCursor::setForSourceNodesFromLabelsTargetNodes((degas::LabelledEdgeCursor *)v14, a2, a4, (const degas::LabelledEdgeTable *)(a1 + 1144));
    while (1)
    {
      uint64_t v12 = degas::Statement::next((sqlite3_stmt **)v14[0]);
      uint64_t v11 = v12;
      if (v12 != 1) {
        break;
      }
      degas::Statement::bitmapColumnValue((sqlite3_stmt **)v14[0], 0, (degas::Bitmap *)&v15);
    }
    if (v12 == 2)
    {
      degas::Bitmap::unionWith<degas::Bitmap>(a3, (uint64_t)&v15);
      uint64_t v11 = 0;
    }
    degas::Cursor::~Cursor(v14);
    v14[0] = (degas::Statement *)v16;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v14);
  }
  return v11;
}

void sub_1D17ACB6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t *a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13)
{
  a9 = &a13;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::nodeNeighborsViaEdges(degas::Database *a1, sqlite3_stmt ***a2, degas::Bitmap *a3, void *a4, unsigned int a5)
{
  long long v18 = 0u;
  memset(v19, 0, 25);
  memset(&v17, 0, 41);
  unsigned int v10 = a5 & 0xFFFFFFFD;
  memset(&v16, 0, 41);
  while (1)
  {
    uint64_t v11 = degas::Statement::next(*a2);
    uint64_t v12 = v11;
    if (v11 != 1) {
      break;
    }
    if (a5 <= 1)
    {
      long long v13 = degas::Statement::literalBitmapColumnValue(*a2, 3);
      if (v13[1]) {
        degas::Bitmap::unionWith<degas::LiteralBitmap>((degas::Bitmap *)&v17, (uint64_t)v13);
      }
    }
    if (!v10)
    {
      Bitmap v14 = degas::Statement::literalBitmapColumnValue(*a2, 2);
      if (v14[1]) {
        degas::Bitmap::unionWith<degas::LiteralBitmap>((degas::Bitmap *)&v16, (uint64_t)v14);
      }
    }
  }
  if (v11 == 2)
  {
    if (v17._bitSets.__begin_ != v17._bitSets.__end_)
    {
      degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)&v17, a3);
      degas::Database::appendTargetNodesForEdges(a1, &v17, (degas::Bitmap *)&v18);
    }
    if (v16._bitSets.__begin_ != v16._bitSets.__end_)
    {
      degas::Bitmap::intersectWith<degas::Bitmap>((degas::Bitmap *)&v16, a3);
      degas::Database::appendSourceNodesForEdges(a1, &v16, (degas::Bitmap *)&v18);
    }
    degas::Bitmap::operator=(a4, &v18);
    uint64_t v12 = 0;
  }
  p_bitSets = &v16._bitSets;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_bitSets);
  v16._bitCount = (unint64_t)&v17._bitSets;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v16);
  v17._bitCount = (unint64_t)v19;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&v17);
  return v12;
}

void sub_1D17ACD1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  *(void *)(v23 - 72) = &a11;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v23 - 72));
  a9 = (void **)&a17;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a9);
  a15 = (void **)&a23;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a15);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::nodeNeighborsViaEdges(uint64_t a1, unint64_t a2, Bitmap *a3, degas::Bitmap *a4, unsigned int a5)
{
  memset(&v11, 0, 41);
  degas::Bitmap::setBit((degas::Bitmap *)&v11, a2);
  uint64_t v9 = degas::Database::nodeNeighborsViaEdges(a1, &v11, a3, a4, a5);
  p_bitSets = &v11._bitSets;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_bitSets);
  return v9;
}

void sub_1D17ACE00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void **a16)
{
  a16 = (void **)(v16 + 16);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::nodeNeighborsViaEdges(uint64_t a1, Bitmap *a2, Bitmap *a3, degas::Bitmap *a4, unsigned int a5)
{
  if (a5 > 1)
  {
    uint64_t v11 = 0;
  }
  else
  {
    long long v15 = 0u;
    memset(v16, 0, 25);
    degas::LabelledEdgeCursor::LabelledEdgeCursor(v14);
    degas::LabelledEdgeCursor::setForTargetNodesFromEdgesSourceNodesJoinBoth((degas::LabelledEdgeCursor *)v14, a2, a3, (const degas::LabelledEdgeTable *)(a1 + 1144));
    while (1)
    {
      uint64_t v10 = degas::Statement::next((sqlite3_stmt **)v14[0]);
      uint64_t v11 = v10;
      if (v10 != 1) {
        break;
      }
      degas::Statement::bitmapColumnValue((sqlite3_stmt **)v14[0], 0, (degas::Bitmap *)&v15);
    }
    if (v10 == 2)
    {
      degas::Bitmap::operator=(a4, &v15);
      uint64_t v11 = 0;
    }
    degas::Cursor::~Cursor(v14);
    v14[0] = (degas::Statement *)v16;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v14);
  }
  if ((a5 & 0xFFFFFFFD) == 0)
  {
    long long v15 = 0u;
    memset(v16, 0, 25);
    degas::LabelledEdgeCursor::LabelledEdgeCursor(v14);
    degas::LabelledEdgeCursor::setForSourceNodesFromEdgesTargetNodesJoinBoth((degas::LabelledEdgeCursor *)v14, a2, a3, (const degas::LabelledEdgeTable *)(a1 + 1144));
    while (1)
    {
      uint64_t v12 = degas::Statement::next((sqlite3_stmt **)v14[0]);
      uint64_t v11 = v12;
      if (v12 != 1) {
        break;
      }
      degas::Statement::bitmapColumnValue((sqlite3_stmt **)v14[0], 0, (degas::Bitmap *)&v15);
    }
    if (v12 == 2)
    {
      degas::Bitmap::unionWith<degas::Bitmap>(a4, (uint64_t)&v15);
      uint64_t v11 = 0;
    }
    degas::Cursor::~Cursor(v14);
    v14[0] = (degas::Statement *)v16;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)v14);
  }
  return v11;
}

void sub_1D17ACF88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t *a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13)
{
  a9 = &a13;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&a9);
  _Unwind_Resume(a1);
}

uint64_t degas::Database::addAttribute(uint64_t a1, void *a2, uint64_t *a3)
{
  if (*(unsigned char *)(a1 + 32)) {
    return 8;
  }
  sqlite3_int64 v5 = 0;
  uint64_t result = degas::AttributeTable::insert((sqlite3 **)(a1 + 304), &v5, a3);
  if (!result) {
    *a2 = v5;
  }
  return result;
}

uint64_t degas::Database::getAttributeProperties(uint64_t a1, sqlite3_int64 a2, uint64_t a3)
{
  degas::AttributeCursor::AttributeCursor((degas::AttributeCursor *)v6, a2, (const degas::AttributeTable *)(a1 + 304));
  if (degas::Statement::next((sqlite3_stmt **)v6[0]) == 1)
  {
    degas::Statement::stringColumnValue((sqlite3_stmt **)v6[0], 1, a3);
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 2;
  }
  degas::Cursor::~Cursor(v6);
  return v4;
}

void sub_1D17AD07C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::Database::removeAttribute(degas::Database *this, sqlite3_int64 a2)
{
  if (*((unsigned char *)this + 32)) {
    return 8;
  }
  else {
    return degas::AttributeTable::deleteEntry((degas::Database *)((char *)this + 304), a2);
  }
}

uint64_t degas::Database::nodeAttributeValue(degas::Database *this, sqlite3_int64 a2, sqlite3_int64 a3, uint64_t *a4)
{
  sqlite3_int64 v5 = degas::AttributeValueTable::prepareStatementToReadByAttrIdIdentifier((degas::Database *)((char *)this + 360), a3, a2);
  unint64_t v6 = (degas::Statement *)*v5;
  uint64_t v7 = (atomic_ullong *)v5[1];
  v10[0] = v6;
  v10[1] = (degas::Statement *)v7;
  if (v7) {
    atomic_fetch_add_explicit(v7 + 1, 1uLL, memory_order_relaxed);
  }
  if (degas::Statement::next((sqlite3_stmt **)v6) == 1)
  {
    uint64_t v8 = 0;
    *a4 = sqlite3_column_int64(*(sqlite3_stmt **)v10[0], 2);
  }
  else
  {
    uint64_t v8 = 2;
  }
  degas::Cursor::~Cursor(v10);
  return v8;
}

void sub_1D17AD13C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::Database::nodeAttributeValue(degas::Database *this, sqlite3_int64 a2, sqlite3_int64 a3, double *a4)
{
  sqlite3_int64 v5 = degas::AttributeValueTable::prepareStatementToReadByAttrIdIdentifier((degas::Database *)((char *)this + 360), a3, a2);
  unint64_t v6 = (degas::Statement *)*v5;
  uint64_t v7 = (atomic_ullong *)v5[1];
  v10[0] = v6;
  v10[1] = (degas::Statement *)v7;
  if (v7) {
    atomic_fetch_add_explicit(v7 + 1, 1uLL, memory_order_relaxed);
  }
  if (degas::Statement::next((sqlite3_stmt **)v6) == 1)
  {
    uint64_t v8 = 0;
    *a4 = sqlite3_column_double(*(sqlite3_stmt **)v10[0], 3);
  }
  else
  {
    uint64_t v8 = 2;
  }
  degas::Cursor::~Cursor(v10);
  return v8;
}

void sub_1D17AD1E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::Database::nodeAttributeValue(uint64_t a1, sqlite3_int64 a2, sqlite3_int64 a3, uint64_t a4)
{
  sqlite3_int64 v5 = degas::AttributeValueTable::prepareStatementToReadByAttrIdIdentifier((degas::AttributeValueTable *)(a1 + 360), a3, a2);
  unint64_t v6 = (degas::Statement *)*v5;
  uint64_t v7 = (atomic_ullong *)v5[1];
  v10[0] = v6;
  v10[1] = (degas::Statement *)v7;
  if (v7) {
    atomic_fetch_add_explicit(v7 + 1, 1uLL, memory_order_relaxed);
  }
  if (degas::Statement::next((sqlite3_stmt **)v6) == 1)
  {
    degas::Statement::stringColumnValue((sqlite3_stmt **)v10[0], 4, a4);
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 2;
  }
  degas::Cursor::~Cursor(v10);
  return v8;
}

void sub_1D17AD288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::Database::edgeAttributeValue(degas::Database *this, sqlite3_int64 a2, sqlite3_int64 a3, uint64_t *a4)
{
  sqlite3_int64 v5 = degas::AttributeValueTable::prepareStatementToReadByAttrIdIdentifier((degas::Database *)((char *)this + 416), a3, a2);
  unint64_t v6 = (degas::Statement *)*v5;
  uint64_t v7 = (atomic_ullong *)v5[1];
  v10[0] = v6;
  v10[1] = (degas::Statement *)v7;
  if (v7) {
    atomic_fetch_add_explicit(v7 + 1, 1uLL, memory_order_relaxed);
  }
  if (degas::Statement::next((sqlite3_stmt **)v6) == 1)
  {
    uint64_t v8 = 0;
    *a4 = sqlite3_column_int64(*(sqlite3_stmt **)v10[0], 2);
  }
  else
  {
    uint64_t v8 = 2;
  }
  degas::Cursor::~Cursor(v10);
  return v8;
}

void sub_1D17AD330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::Database::edgeAttributeValue(degas::Database *this, sqlite3_int64 a2, sqlite3_int64 a3, double *a4)
{
  sqlite3_int64 v5 = degas::AttributeValueTable::prepareStatementToReadByAttrIdIdentifier((degas::Database *)((char *)this + 416), a3, a2);
  unint64_t v6 = (degas::Statement *)*v5;
  uint64_t v7 = (atomic_ullong *)v5[1];
  v10[0] = v6;
  v10[1] = (degas::Statement *)v7;
  if (v7) {
    atomic_fetch_add_explicit(v7 + 1, 1uLL, memory_order_relaxed);
  }
  if (degas::Statement::next((sqlite3_stmt **)v6) == 1)
  {
    uint64_t v8 = 0;
    *a4 = sqlite3_column_double(*(sqlite3_stmt **)v10[0], 3);
  }
  else
  {
    uint64_t v8 = 2;
  }
  degas::Cursor::~Cursor(v10);
  return v8;
}

void sub_1D17AD3D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::Database::edgeAttributeValue(uint64_t a1, sqlite3_int64 a2, sqlite3_int64 a3, uint64_t a4)
{
  sqlite3_int64 v5 = degas::AttributeValueTable::prepareStatementToReadByAttrIdIdentifier((degas::AttributeValueTable *)(a1 + 416), a3, a2);
  unint64_t v6 = (degas::Statement *)*v5;
  uint64_t v7 = (atomic_ullong *)v5[1];
  v10[0] = v6;
  v10[1] = (degas::Statement *)v7;
  if (v7) {
    atomic_fetch_add_explicit(v7 + 1, 1uLL, memory_order_relaxed);
  }
  if (degas::Statement::next((sqlite3_stmt **)v6) == 1)
  {
    degas::Statement::stringColumnValue((sqlite3_stmt **)v10[0], 4, a4);
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 2;
  }
  degas::Cursor::~Cursor(v10);
  return v8;
}

void sub_1D17AD47C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, degas::Statement *a9)
{
}

uint64_t degas::Database::setNodeAttributeValue(degas::Database *this, unint64_t a2, sqlite3_int64 a3, sqlite3_int64 a4)
{
  if (*((unsigned char *)this + 32)) {
    return 8;
  }
  uint64_t result = degas::AttributeValueTable::insertOrUpdate((degas::Database *)((char *)this + 360), a3, a2, a4);
  if (!result)
  {
    if ((*((_WORD *)this + 678) & 0x10) != 0) {
      degas::Database::TransactionChanges::updateNode((degas::Database *)((char *)this + 1360), a2);
    }
    return 0;
  }
  return result;
}

uint64_t degas::Database::setNodeAttributeValueUnsigned(degas::Database *this, unint64_t a2, sqlite3_int64 a3, sqlite3_int64 a4)
{
  if (*((unsigned char *)this + 32)) {
    return 8;
  }
  uint64_t result = degas::AttributeValueTable::insertOrUpdateUnsigned((degas::Database *)((char *)this + 360), a3, a2, a4);
  if (!result)
  {
    if ((*((_WORD *)this + 678) & 0x10) != 0) {
      degas::Database::TransactionChanges::updateNode((degas::Database *)((char *)this + 1360), a2);
    }
    return 0;
  }
  return result;
}

uint64_t degas::Database::setNodeAttributeValue(degas::Database *this, unint64_t a2, sqlite3_int64 a3, double a4)
{
  if (*((unsigned char *)this + 32)) {
    return 8;
  }
  uint64_t result = degas::AttributeValueTable::insertOrUpdate((degas::Database *)((char *)this + 360), a3, a2, a4);
  if (!result)
  {
    if ((*((_WORD *)this + 678) & 0x10) != 0) {
      degas::Database::TransactionChanges::updateNode((degas::Database *)((char *)this + 1360), a2);
    }
    return 0;
  }
  return result;
}

uint64_t degas::Database::setNodeAttributeValue(uint64_t a1, unint64_t a2, sqlite3_int64 a3, uint64_t *a4)
{
  if (*(unsigned char *)(a1 + 32)) {
    return 8;
  }
  uint64_t result = degas::AttributeValueTable::insertOrUpdate((degas::AttributeValueTable *)(a1 + 360), a3, a2, a4);
  if (!result)
  {
    if ((*(_WORD *)(a1 + 1356) & 0x10) != 0) {
      degas::Database::TransactionChanges::updateNode((degas::Database::TransactionChanges *)(a1 + 1360), a2);
    }
    return 0;
  }
  return result;
}

uint64_t degas::Database::removeNodeAttributeValues(degas::Database *this, unint64_t a2, const degas::Bitmap *a3)
{
  if (*((unsigned char *)this + 32)) {
    return 8;
  }
  degas::Bitmap::begin(a3, &v10);
  uint64_t v7 = *((void *)a3 + 3);
  while (1)
  {
    BOOL v8 = (const degas::Bitmap *)v10 == a3 && v11 == -1;
    if (v8 && v12 == v7) {
      break;
    }
    uint64_t result = degas::AttributeValueTable::deleteValue((degas::Database *)((char *)this + 360), v11, a2);
    if (result) {
      return result;
    }
    degas::Bitmap::iterator::operator++(&v10);
  }
  if ((*((_WORD *)this + 678) & 0x10) != 0) {
    degas::Database::TransactionChanges::updateNode((degas::Database *)((char *)this + 1360), a2);
  }
  return 0;
}

uint64_t degas::Database::setEdgeAttributeValue(degas::Database *this, unint64_t a2, sqlite3_int64 a3, sqlite3_int64 a4)
{
  if (*((unsigned char *)this + 32)) {
    return 8;
  }
  uint64_t result = degas::AttributeValueTable::insertOrUpdate((degas::Database *)((char *)this + 416), a3, a2, a4);
  if (!result)
  {
    if ((*((_WORD *)this + 678) & 0x10) != 0) {
      degas::Database::TransactionChanges::updateEdge((degas::Database *)((char *)this + 1360), a2);
    }
    return 0;
  }
  return result;
}

uint64_t degas::Database::TransactionChanges::updateEdge(degas::Database::TransactionChanges *this, unint64_t a2)
{
  uint64_t result = degas::Bitmap::isSet((degas::Database::TransactionChanges *)((char *)this + 48), a2);
  if ((result & 1) == 0)
  {
    uint64_t result = degas::Bitmap::isSet((degas::Database::TransactionChanges *)((char *)this + 240), a2);
    if ((result & 1) == 0)
    {
      return degas::Bitmap::setBit((degas::Database::TransactionChanges *)((char *)this + 144), a2);
    }
  }
  return result;
}

uint64_t degas::Database::setEdgeAttributeValueUnsigned(degas::Database *this, unint64_t a2, sqlite3_int64 a3, sqlite3_int64 a4)
{
  if (*((unsigned char *)this + 32)) {
    return 8;
  }
  uint64_t result = degas::AttributeValueTable::insertOrUpdateUnsigned((degas::Database *)((char *)this + 416), a3, a2, a4);
  if (!result)
  {
    if ((*((_WORD *)this + 678) & 0x10) != 0) {
      degas::Database::TransactionChanges::updateEdge((degas::Database *)((char *)this + 1360), a2);
    }
    return 0;
  }
  return result;
}

uint64_t degas::Database::setEdgeAttributeValue(degas::Database *this, unint64_t a2, sqlite3_int64 a3, double a4)
{
  if (*((unsigned char *)this + 32)) {
    return 8;
  }
  uint64_t result = degas::AttributeValueTable::insertOrUpdate((degas::Database *)((char *)this + 416), a3, a2, a4);
  if (!result)
  {
    if ((*((_WORD *)this + 678) & 0x10) != 0) {
      degas::Database::TransactionChanges::updateEdge((degas::Database *)((char *)this + 1360), a2);
    }
    return 0;
  }
  return result;
}

uint64_t degas::Database::setEdgeAttributeValue(uint64_t a1, unint64_t a2, sqlite3_int64 a3, uint64_t *a4)
{
  if (*(unsigned char *)(a1 + 32)) {
    return 8;
  }
  uint64_t result = degas::AttributeValueTable::insertOrUpdate((degas::AttributeValueTable *)(a1 + 416), a3, a2, a4);
  if (!result)
  {
    if ((*(_WORD *)(a1 + 1356) & 0x10) != 0) {
      degas::Database::TransactionChanges::updateEdge((degas::Database::TransactionChanges *)(a1 + 1360), a2);
    }
    return 0;
  }
  return result;
}

uint64_t degas::Database::removeEdgeAttributeValues(degas::Database *this, unint64_t a2, const degas::Bitmap *a3)
{
  if (*((unsigned char *)this + 32)) {
    return 8;
  }
  degas::Bitmap::begin(a3, &v10);
  uint64_t v7 = *((void *)a3 + 3);
  while (1)
  {
    BOOL v8 = (const degas::Bitmap *)v10 == a3 && v11 == -1;
    if (v8 && v12 == v7) {
      break;
    }
    uint64_t result = degas::AttributeValueTable::deleteValue((degas::Database *)((char *)this + 416), v11, a2);
    if (result) {
      return result;
    }
    degas::Bitmap::iterator::operator++(&v10);
  }
  if ((*((_WORD *)this + 678) & 0x10) != 0) {
    degas::Database::TransactionChanges::updateEdge((degas::Database *)((char *)this + 1360), a2);
  }
  return 0;
}

uint64_t degas::Database::enumerateTransactionChangesAfterTransactionId(uint64_t a1, sqlite3_int64 a2, unsigned int a3, uint64_t a4)
{
  degas::TransactionLogCursor::TransactionLogCursor((degas::TransactionLogCursor *)v28, a2, a3, (const degas::TransactionLogTable *)(a1 + 696));
  while (1)
  {
    unsigned int v4 = degas::Statement::next((sqlite3_stmt **)v28[0]);
    if (v4 != 1) {
      break;
    }
    sqlite3_int64 v5 = (void **)sqlite3_column_int64(*(sqlite3_stmt **)v28[0], 0);
    unint64_t v6 = degas::Statement::literalBitmapColumnValue((sqlite3_stmt **)v28[0], 1);
    uint64_t v7 = degas::Statement::literalBitmapColumnValue((sqlite3_stmt **)v28[0], 2);
    BOOL v8 = degas::Statement::literalBitmapColumnValue((sqlite3_stmt **)v28[0], 3);
    uint64_t v9 = degas::Statement::literalBitmapColumnValue((sqlite3_stmt **)v28[0], 4);
    unint64_t v10 = degas::Statement::literalBitmapColumnValue((sqlite3_stmt **)v28[0], 5);
    sqlite3_int64 v11 = degas::Statement::literalBitmapColumnValue((sqlite3_stmt **)v28[0], 6);
    degas::Bitmap::Bitmap((degas::Bitmap *)v16, (const degas::LiteralBitmap *)v6);
    degas::Bitmap::Bitmap((degas::Bitmap *)&v18, (const degas::LiteralBitmap *)v7);
    degas::Bitmap::Bitmap((degas::Bitmap *)&v20, (const degas::LiteralBitmap *)v8);
    degas::Bitmap::Bitmap((degas::Bitmap *)&v22, (const degas::LiteralBitmap *)v9);
    degas::Bitmap::Bitmap((degas::Bitmap *)&v24, (const degas::LiteralBitmap *)v10);
    degas::Bitmap::Bitmap((degas::Bitmap *)&v26, (const degas::LiteralBitmap *)v11);
    v29[0] = v5;
    uint64_t v12 = *(void *)(a4 + 24);
    if (!v12) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(uint64_t, void ***, unsigned char *))(*(void *)v12 + 48))(v12, v29, v16);
    v29[0] = (void **)&v27;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v29);
    v29[0] = (void **)&v25;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v29);
    v29[0] = (void **)&v23;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v29);
    v29[0] = (void **)&v21;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v29);
    v29[0] = (void **)&v19;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v29);
    v29[0] = (void **)&v17;
    std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](v29);
  }
  if (v4 == 2) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = v4;
  }
  degas::Cursor::~Cursor(v28);
  return v13;
}

void sub_1D17ADB70(_Unwind_Exception *a1)
{
  degas::Cursor::~Cursor((degas::Statement **)(v1 - 112));
  _Unwind_Resume(a1);
}

void degas::Database::cursorForAdhocStatement()
{
}

void sub_1D17ADCA8(_Unwind_Exception *a1)
{
  MEMORY[0x1D25F9A90](v1, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

void degas::Database::validateLabelReferences(degas::Database *this)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  std::string::basic_string[abi:ne180100]<0>(&v1, "select mergeLiteralBitmap(identifier), literalBitmapUnion(labels) from Node");
  degas::Database::cursorForAdhocStatement();
}

void sub_1D17AE368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,int *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,degas::Statement *a40,uint64_t a41,int *a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,void *a48,uint64_t a49,int a50,__int16 a51,char a52,char a53)
{
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  a13 = &a21;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&a13);
  a19 = &a27;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&a19);
  a25 = &a33;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&a25);
  degas::Cursor::~Cursor(&a40);
  long long __p = &a44;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  a42 = &a50;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&a42);
  degas::Cursor::~Cursor((degas::Statement **)(v53 - 224));
  a48 = (void *)(v53 - 192);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)&a48);
  *(void *)(v53 - 208) = v53 - 144;
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100]((void ***)(v53 - 208));
  degas::Cursor::~Cursor((degas::Statement **)(v53 - 112));
  _Unwind_Resume(a1);
}

uint64_t degas::Database::releaseSqliteMemory(sqlite3 **this)
{
  return sqlite3_db_release_memory(this[3]);
}

void degas::Database::purgeEmptyBitsetPages(degas::Database *this)
{
  if (degas::getBitsetPool(void)::onceToken != -1) {
    dispatch_once(&degas::getBitsetPool(void)::onceToken, &__block_literal_global_3916);
  }
  uint64_t v1 = (os_unfair_lock_s *)degas::getBitsetPool(void)::sPool;
  degas::BitsetPool::purgeEmptyPages(v1);
}

void sub_1D17AEACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1D17AEBFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D17AEC8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t degas::StatementCacheEntry::StatementCacheEntry(uint64_t result, int a2, void *a3)
{
  uint64_t v3 = a3[1];
  *(void *)uint64_t result = *a3;
  *(void *)(result + 8) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  *(_DWORD *)(result + 16) = a2;
  *(_DWORD *)(result + 20) = 1;
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = 0;
  return result;
}

{
  uint64_t v3;

  uint64_t v3 = a3[1];
  *(void *)uint64_t result = *a3;
  *(void *)(result + 8) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  *(_DWORD *)(result + 16) = a2;
  *(_DWORD *)(result + 20) = 1;
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = 0;
  return result;
}

double degas::StatementCacheEntry::StatementCacheEntry(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  double result = *(double *)(a2 + 16);
  *(double *)(a1 + 16) = result;
  return result;
}

{
  uint64_t v2;
  double result;

  uint64_t v2 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  double result = *(double *)(a2 + 16);
  *(double *)(a1 + 16) = result;
  return result;
}

uint64_t degas::StatementCacheEntry::operator=(uint64_t a1, uint64_t *a2)
{
  *(_DWORD *)(a1 + 16) = *((_DWORD *)a2 + 4);
  uint64_t v5 = *a2;
  uint64_t v4 = a2[1];
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  unint64_t v6 = *(std::__shared_weak_count **)(a1 + 8);
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v4;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  *(_DWORD *)(a1 + 20) = *((_DWORD *)a2 + 5);
  return a1;
}

BOOL degas::StatementCacheEntry::operator==(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16);
}

degas::Statement **degas::StatementCacheEntry::getStatement(degas::Statement **this)
{
  return this;
}

uint64_t degas::StatementCacheEntry::boostAttention(uint64_t this)
{
  int v1 = *(_DWORD *)(this + 20);
  if (v1 <= 3) {
    *(_DWORD *)(this + 20) = v1 + 1;
  }
  return this;
}

BOOL degas::StatementCacheEntry::fadeAttention(degas::StatementCacheEntry *this)
{
  int v1 = *((_DWORD *)this + 5);
  *((_DWORD *)this + 5) = v1 - 1;
  return v1 < 2;
}

const degas::StatementCacheEntry *degas::StatementCacheEntry::insertInClock(const degas::StatementCacheEntry *this, const degas::StatementCacheEntry *a2)
{
  uint64_t v2 = a2;
  if (a2 != this)
  {
    uint64_t v3 = *((void *)a2 + 4);
    *((void *)this + 4) = v3;
    *(void *)(v3 + 24) = this;
    uint64_t v2 = this;
  }
  *((void *)a2 + 4) = v2;
  *((void *)this + 3) = a2;
  return this;
}

uint64_t degas::StatementCacheEntry::removeFromClock(degas::StatementCacheEntry *this)
{
  int v1 = (void *)((char *)this + 24);
  uint64_t v2 = (degas::StatementCacheEntry *)*((void *)this + 3);
  if (v2 == this)
  {
    uint64_t result = 0;
  }
  else
  {
    uint64_t v3 = *((void *)this + 4);
    *(void *)(v3 + 24) = v2;
    uint64_t result = *((void *)this + 3);
    *(void *)(result + 32) = v3;
  }
  *int v1 = 0;
  v1[1] = 0;
  return result;
}

double degas::StatementCache::StatementCache(degas::StatementCache *this)
{
  *((void *)this + 2) = 0;
  *((void *)this + 1) = 0;
  *(void *)this = (char *)this + 8;
  *(void *)&double result = 0x2800000000;
  *((void *)this + 3) = 0x2800000000;
  *((void *)this + 4) = 0;
  return result;
}

{
  double result;

  *((void *)this + 2) = 0;
  *((void *)this + 1) = 0;
  *(void *)this = (char *)this + 8;
  *(void *)&double result = 0x2800000000;
  *((void *)this + 3) = 0x2800000000;
  *((void *)this + 4) = 0;
  return result;
}

void degas::StatementCache::purgeAllStatements(os_unfair_lock_s *this)
{
  uint64_t v2 = this + 6;
  os_unfair_lock_lock(this + 6);
  std::__tree<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,std::shared_ptr<degas::Bitmap>>>>::destroy(*(void **)&this[2]._os_unfair_lock_opaque);
  *(void *)&this->_os_unfair_lock_opaque = this + 2;
  *(void *)&this[4]._os_unfair_lock_opaque = 0;
  *(void *)&this[2]._os_unfair_lock_opaque = 0;
  *(void *)&this[8]._os_unfair_lock_opaque = 0;
  os_unfair_lock_unlock(v2);
}

uint64_t *degas::StatementCache::getStatement(uint64_t a1, unsigned int a2, uint64_t a3)
{
  unint64_t v6 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  uint64_t v7 = *(void *)(a1 + 8);
  if (!v7) {
    goto LABEL_12;
  }
  uint64_t v8 = a1 + 8;
  do
  {
    unsigned int v9 = *(_DWORD *)(v7 + 32);
    BOOL v10 = v9 >= a2;
    if (v9 >= a2) {
      sqlite3_int64 v11 = (uint64_t *)v7;
    }
    else {
      sqlite3_int64 v11 = (uint64_t *)(v7 + 8);
    }
    if (v10) {
      uint64_t v8 = v7;
    }
    uint64_t v7 = *v11;
  }
  while (*v11);
  if (v8 != a1 + 8 && *(_DWORD *)(v8 + 32) <= a2)
  {
    uint64_t v12 = (uint64_t *)(v8 + 40);
    int v14 = *(_DWORD *)(v8 + 60);
    if (v14 <= 3) {
      *(_DWORD *)(v8 + 60) = v14 + 1;
    }
  }
  else
  {
LABEL_12:
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(a3 + 16))(&v15, a3);
    *(_DWORD *)(v15 + 20) = a2;
    uint64_t v12 = degas::StatementCache::addStatement((uint64_t **)a1, a2, &v15);
    if (v16) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    }
  }
  degas::Statement::prepareForUse((degas::Statement *)*v12);
  os_unfair_lock_unlock(v6);
  return v12;
}

void sub_1D17AF2BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *degas::StatementCache::addStatement(uint64_t **a1, unsigned int a2, uint64_t *a3)
{
  uint64_t v7 = a1 + 1;
  unint64_t v6 = a1[1];
  if (v6)
  {
    uint64_t v8 = a1 + 1;
    do
    {
      unsigned int v9 = *((_DWORD *)v6 + 8);
      BOOL v10 = v9 >= a2;
      if (v9 >= a2) {
        sqlite3_int64 v11 = (uint64_t **)v6;
      }
      else {
        sqlite3_int64 v11 = (uint64_t **)(v6 + 1);
      }
      if (v10) {
        uint64_t v8 = (uint64_t **)v6;
      }
      unint64_t v6 = *v11;
    }
    while (*v11);
    if (v8 != v7 && *((_DWORD *)v8 + 8) <= a2) {
      return 0;
    }
  }
  if ((unint64_t)a1[2] >= *((unsigned int *)a1 + 7))
  {
    uint64_t v12 = a1[4];
    int v13 = *((_DWORD *)v12 + 5);
    *((_DWORD *)v12 + 5) = v13 - 1;
    if (v13 >= 2)
    {
      do
      {
        uint64_t v12 = (uint64_t *)v12[3];
        int v14 = *((_DWORD *)v12 + 5);
        *((_DWORD *)v12 + 5) = v14 - 1;
      }
      while (v14 >= 2);
      a1[4] = v12;
    }
    unsigned int v15 = *((_DWORD *)v12 + 4);
    uint64_t v16 = v12 + 3;
    uint64_t v17 = (uint64_t *)v12[3];
    if (v17 == v12)
    {
      uint64_t v19 = 0;
    }
    else
    {
      uint64_t v18 = v12[4];
      *(void *)(v18 + 24) = v17;
      uint64_t v19 = (uint64_t *)v12[3];
      void v19[4] = v18;
    }
    void *v16 = 0;
    v16[1] = 0;
    a1[4] = v19;
    uint64_t v21 = a1[1];
    if (v21)
    {
      uint64_t v22 = (uint64_t *)v7;
      uint64_t v23 = a1[1];
      do
      {
        unsigned int v24 = *((_DWORD *)v23 + 8);
        BOOL v25 = v24 >= v15;
        if (v24 >= v15) {
          uint64_t v26 = (uint64_t **)v23;
        }
        else {
          uint64_t v26 = (uint64_t **)(v23 + 1);
        }
        if (v25) {
          uint64_t v22 = v23;
        }
        uint64_t v23 = *v26;
      }
      while (*v26);
      if (v22 != (uint64_t *)v7 && v15 >= *((_DWORD *)v22 + 8))
      {
        uint64_t v27 = (uint64_t *)v22[1];
        if (v27)
        {
          do
          {
            long long v28 = v27;
            uint64_t v27 = (uint64_t *)*v27;
          }
          while (v27);
        }
        else
        {
          uint64_t v29 = v22;
          do
          {
            long long v28 = (uint64_t *)v29[2];
            BOOL v30 = *v28 == (void)v29;
            uint64_t v29 = v28;
          }
          while (!v30);
        }
        if (*a1 == v22) {
          *a1 = v28;
        }
        a1[2] = (uint64_t *)((char *)a1[2] - 1);
        std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v21, v22);
        unint64_t v31 = (std::__shared_weak_count *)v22[6];
        if (v31) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v31);
        }
        operator delete(v22);
      }
    }
  }
  uint64_t v33 = *a3;
  long long v32 = (std::__shared_weak_count *)a3[1];
  if (v32)
  {
    atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
    atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v34 = v32;
  }
  else
  {
    uint64_t v34 = 0;
  }
  unint64_t v35 = *v7;
  v36 = v7;
  if (!*v7)
  {
LABEL_52:
    unint64_t v38 = (uint64_t **)operator new(0x50uLL);
    uint64_t v39 = v38;
    *((_DWORD *)v38 + 8) = a2;
    v38[5] = (uint64_t *)v33;
    v38[6] = (uint64_t *)v34;
    if (v34) {
      atomic_fetch_add_explicit(&v34->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v38[7] = (uint64_t *)(a2 | 0x100000000);
    *unint64_t v38 = 0;
    v38[1] = 0;
    v38[2] = (uint64_t *)v36;
    unsigned int *v7 = (uint64_t *)v38;
    v40 = (uint64_t *)**a1;
    v41 = (uint64_t *)v38;
    if (v40)
    {
      *a1 = v40;
      v41 = *v7;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v41);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    if (!v34) {
      goto LABEL_58;
    }
LABEL_57:
    std::__shared_weak_count::__release_shared[abi:ne180100](v34);
    goto LABEL_58;
  }
  while (1)
  {
    while (1)
    {
      v36 = (uint64_t **)v35;
      unsigned int v37 = *((_DWORD *)v35 + 8);
      if (v37 <= a2) {
        break;
      }
      unint64_t v35 = *v36;
      uint64_t v7 = v36;
      if (!*v36) {
        goto LABEL_52;
      }
    }
    if (v37 >= a2) {
      break;
    }
    unint64_t v35 = v36[1];
    if (!v35)
    {
      uint64_t v7 = v36 + 1;
      goto LABEL_52;
    }
  }
  uint64_t v39 = v36;
  if (v34) {
    goto LABEL_57;
  }
LABEL_58:
  if (v32) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  }
  double result = (uint64_t *)(v39 + 5);
  v42 = a1[4];
  if (!v42)
  {
    a1[4] = result;
    v43 = (uint64_t *)(v39 + 9);
    goto LABEL_64;
  }
  v43 = v42 + 4;
  if (v42 == result)
  {
LABEL_64:
    v42 = (uint64_t *)(v39 + 5);
    goto LABEL_65;
  }
  uint64_t v44 = *v43;
  v39[9] = (uint64_t *)*v43;
  *(void *)(v44 + 24) = result;
LABEL_65:
  uint64_t *v43 = (uint64_t)result;
  v39[8] = v42;
  return result;
}

void sub_1D17AF5A4(_Unwind_Exception *exception_object)
{
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

double degas::Bitmap::Bitmap(degas::Bitmap *this)
{
  double result = 0.0;
  *(_OWORD *)((char *)this + 25) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  return result;
}

{
  double result;

  double result = 0.0;
  *(_OWORD *)((char *)this + 25) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  return result;
}

degas::Bitmap *degas::Bitmap::Bitmap(degas::Bitmap *this, long long **a2)
{
  *(void *)this = *a2;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 16, a2[2], a2[3], a2[3] - a2[2]);
  *((unsigned char *)this + 40) = *((unsigned char *)a2 + 40);
  return this;
}

{
  *(void *)this = *a2;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)this + 16, a2[2], a2[3], a2[3] - a2[2]);
  *((unsigned char *)this + 40) = *((unsigned char *)a2 + 40);
  return this;
}

char *std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    double result = std::vector<degas::BitsetPtr>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = (_OWORD *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      long long v8 = *a2++;
      *v7++ = v8;
      ++*(_DWORD *)v8;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

void sub_1D17B08F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

char *std::vector<degas::BitsetPtr>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
  }
  double result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<degas::Predicate>>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

degas::Bitmap *degas::Bitmap::Bitmap(degas::Bitmap *this, const degas::LiteralBitmap *a2)
{
  *(void *)this = 0xFFFFFFFFLL;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((unsigned char *)this + 40) = 0;
  if (degas::getBitsetPool(void)::onceToken != -1) {
    dispatch_once(&degas::getBitsetPool(void)::onceToken, &__block_literal_global_3916);
  }
  uint64_t v4 = *((unsigned int *)a2 + 1);
  if (v4)
  {
    uint64_t v5 = (os_unfair_lock_s *)degas::getBitsetPool(void)::sPool;
    unint64_t v6 = (const degas::LiteralBitmap *)((char *)a2 + 8);
    do
    {
      long long v8 = 0uLL;
      degas::BitsetPool::allocBitset(v5, (degas::BitsetPtr *)&v8, v6);
      std::vector<degas::BitsetPtr>::push_back[abi:ne180100]((uint64_t *)this + 2, &v8);
      degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&v8);
      unint64_t v6 = (const degas::Bitset *)((char *)v6 + 144);
      --v4;
    }
    while (v4);
  }
  return this;
}

void sub_1D17B0A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
}

uint64_t *std::vector<degas::BitsetPtr>::push_back[abi:ne180100](uint64_t *result, long long *a2)
{
  uint64_t v3 = result;
  uint64_t v4 = result + 2;
  unint64_t v5 = result[2];
  unint64_t v6 = (long long *)result[1];
  if ((unint64_t)v6 >= v5)
  {
    uint64_t v9 = ((uint64_t)v6 - *result) >> 4;
    if ((unint64_t)(v9 + 1) >> 60) {
      std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v5 - *result;
    uint64_t v11 = v10 >> 3;
    if (v10 >> 3 <= (unint64_t)(v9 + 1)) {
      uint64_t v11 = v9 + 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    v16[4] = v4;
    if (v12) {
      unint64_t v12 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<degas::Predicate>>>(v12);
    }
    else {
      uint64_t v13 = 0;
    }
    int v14 = (long long *)(v12 + 16 * v9);
    v16[0] = v12;
    v16[1] = v14;
    v16[3] = v12 + 16 * v13;
    long long v15 = *a2;
    *int v14 = *a2;
    ++*(_DWORD *)v15;
    v16[2] = v14 + 1;
    std::vector<degas::BitsetPtr>::__swap_out_circular_buffer(v3, v16);
    long long v8 = (_OWORD *)v3[1];
    double result = (uint64_t *)std::__split_buffer<degas::BitsetPtr>::~__split_buffer((uint64_t)v16);
  }
  else
  {
    long long v7 = *a2;
    long long *v6 = *a2;
    long long v8 = v6 + 1;
    ++*(_DWORD *)v7;
    result[1] = (uint64_t)v8;
  }
  v3[1] = (uint64_t)v8;
  return result;
}

uint64_t *std::vector<degas::BitsetPtr>::__swap_out_circular_buffer(uint64_t *result, void *a2)
{
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  uint64_t v4 = a2[1];
  while (v2 != v3)
  {
    long long v5 = *(_OWORD *)(v2 - 16);
    v2 -= 16;
    *(_OWORD *)(v4 - 16) = v5;
    v4 -= 16;
    ++*(_DWORD *)v5;
  }
  a2[1] = v4;
  uint64_t v6 = *result;
  char *result = v4;
  a2[1] = v6;
  uint64_t v7 = result[1];
  result[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = result[2];
  result[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<degas::BitsetPtr>::~__split_buffer(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v2; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 16;
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(i - 16));
    *(void *)(i - 8) = 0;
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t degas::Bitmap::Bitmap(uint64_t a1, long long **a2)
{
  *(void *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)(a1 + 16), *a2, a2[1], a2[1] - *a2);
  *(unsigned char *)(a1 + 40) = 0;
  return a1;
}

{
  *(void *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  std::vector<degas::BitsetPtr>::__init_with_size[abi:ne180100]<degas::BitsetPtr*,degas::BitsetPtr*>((char *)(a1 + 16), *a2, a2[1], a2[1] - *a2);
  *(unsigned char *)(a1 + 40) = 0;
  return a1;
}

void *degas::Bitmap::operator=(void *a1, void *a2)
{
  if (a1 != a2)
  {
    long long v5 = (void **)(a1 + 2);
    uint64_t v4 = (degas::BitsetPtr *)a1[2];
    uint64_t v7 = (char *)a2[2];
    uint64_t v6 = (char *)a2[3];
    unint64_t v8 = (v6 - v7) >> 4;
    uint64_t v9 = a1[4];
    if (v8 <= (v9 - (uint64_t)v4) >> 4)
    {
      uint64_t v16 = (degas::BitsetPtr *)a1[3];
      unint64_t v17 = (v16 - v4) >> 4;
      if (v17 >= v8)
      {
        if (v7 != v6)
        {
          do
          {
            degas::BitsetPtr::releaseBitset(v4);
            long long v22 = *(_OWORD *)v7;
            *(_OWORD *)uint64_t v4 = *(_OWORD *)v7;
            if ((void)v22) {
              ++*(_DWORD *)v22;
            }
            v7 += 16;
            uint64_t v4 = (degas::BitsetPtr *)((char *)v4 + 16);
          }
          while (v7 != v6);
          uint64_t v16 = (degas::BitsetPtr *)a1[3];
        }
        for (; v16 != v4; uint64_t v16 = (degas::BitsetPtr *)((char *)v16 - 16))
        {
          degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)((char *)v16 - 16));
          *((void *)v16 - 1) = 0;
        }
      }
      else
      {
        uint64_t v18 = &v7[16 * v17];
        if (v16 != v4)
        {
          uint64_t v19 = 16 * v17;
          do
          {
            degas::BitsetPtr::releaseBitset(v4);
            long long v20 = *(_OWORD *)v7;
            *(_OWORD *)uint64_t v4 = *(_OWORD *)v7;
            if ((void)v20) {
              ++*(_DWORD *)v20;
            }
            v7 += 16;
            uint64_t v4 = (degas::BitsetPtr *)((char *)v4 + 16);
            v19 -= 16;
          }
          while (v19);
          uint64_t v4 = (degas::BitsetPtr *)a1[3];
        }
        while (v18 != v6)
        {
          long long v21 = *(_OWORD *)v18;
          v18 += 16;
          *(_OWORD *)uint64_t v4 = v21;
          uint64_t v4 = (degas::BitsetPtr *)((char *)v4 + 16);
          ++*(_DWORD *)v21;
        }
      }
      a1[3] = v4;
    }
    else
    {
      if (v4)
      {
        uint64_t v10 = (degas::BitsetPtr *)a1[3];
        uint64_t v11 = (void *)a1[2];
        if (v10 != v4)
        {
          do
          {
            degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)((char *)v10 - 16));
            *((void *)v10 - 1) = 0;
            uint64_t v10 = (degas::BitsetPtr *)((char *)v10 - 16);
          }
          while (v10 != v4);
          uint64_t v11 = *v5;
        }
        a1[3] = v4;
        operator delete(v11);
        uint64_t v9 = 0;
        *long long v5 = 0;
        a1[3] = 0;
        a1[4] = 0;
      }
      if (v6 - v7 < 0) {
        std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v12 = v9 >> 3;
      if (v9 >> 3 <= v8) {
        uint64_t v12 = (v6 - v7) >> 4;
      }
      if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v13 = v12;
      }
      std::vector<degas::BitsetPtr>::__vallocate[abi:ne180100](a1 + 2, v13);
      int v14 = (_OWORD *)a1[3];
      while (v7 != v6)
      {
        long long v15 = *(_OWORD *)v7;
        v7 += 16;
        *v14++ = v15;
        ++*(_DWORD *)v15;
      }
      a1[3] = v14;
    }
  }
  *a1 = *a2;
  a1[1] = 0;
  return a1;
}

BOOL degas::Bitmap::operator==(uint64_t a1, uint64_t a2)
{
  if (a2 == a1) {
    return 1;
  }
  v24[7] = v2;
  v24[8] = v3;
  unint64_t v5 = -1;
  v24[0] = -1;
  uint64_t v6 = *(degas::Bitset ***)(a1 + 16);
  uint64_t v7 = *(degas::Bitset ***)(a1 + 24);
  if (v6 == v7)
  {
    unint64_t v9 = -1;
  }
  else
  {
    unint64_t v8 = *v6;
    unint64_t v9 = *((void *)*v6 + 1);
    if (v9 > 0xFFFFFFFFFFFFFBFFLL || (*((unsigned char *)v8 + 16) & 1) == 0)
    {
      degas::Bitset::nextBit(v8, v24, *((void *)*v6 + 1));
      unint64_t v9 = v24[0];
    }
  }
  v24[0] = -1;
  uint64_t v12 = *(degas::Bitset ***)(a2 + 16);
  uint64_t v11 = *(degas::Bitset ***)(a2 + 24);
  if (v12 != v11)
  {
    unint64_t v13 = *v12;
    unint64_t v5 = *((void *)*v12 + 1);
    if (v5 > 0xFFFFFFFFFFFFFBFFLL || (*((unsigned char *)v13 + 16) & 1) == 0)
    {
      degas::Bitset::nextBit(v13, v24, *((void *)*v12 + 1));
      unint64_t v5 = v24[0];
    }
  }
  if (v9 != v5) {
    return 0;
  }
  if (v6 == v7)
  {
    unint64_t v18 = 0;
  }
  else
  {
    uint64_t v14 = (uint64_t)*(v7 - 2);
    for (uint64_t i = 35; i != 4; --i)
    {
      unsigned int v16 = *(_DWORD *)(v14 + 4 * i);
      if (v16)
      {
        uint64_t v17 = i - 4;
        goto LABEL_21;
      }
    }
    uint64_t v17 = 0;
    unint64_t v18 = 0;
    unsigned int v16 = *(_DWORD *)(v14 + 16);
    if (!v16) {
      goto LABEL_22;
    }
LABEL_21:
    unint64_t v18 = (__clz(v16) ^ 0x1F | (unint64_t)(32 * v17)) + *(void *)(v14 + 8);
  }
LABEL_22:
  if (v12 == v11)
  {
    unint64_t v23 = 0;
  }
  else
  {
    uint64_t v19 = (uint64_t)*(v11 - 2);
    for (uint64_t j = 35; j != 4; --j)
    {
      unsigned int v21 = *(_DWORD *)(v19 + 4 * j);
      if (v21)
      {
        uint64_t v22 = j - 4;
        goto LABEL_30;
      }
    }
    uint64_t v22 = 0;
    unint64_t v23 = 0;
    unsigned int v21 = *(_DWORD *)(v19 + 16);
    if (!v21) {
      goto LABEL_31;
    }
LABEL_30:
    unint64_t v23 = (__clz(v21) ^ 0x1F | (unint64_t)(32 * v22)) + *(void *)(v19 + 8);
  }
LABEL_31:
  if (v18 != v23) {
    return 0;
  }
  BOOL result = (char *)v7 - (char *)v6 == (char *)v11 - (char *)v12;
  if ((char *)v7 - (char *)v6 == (char *)v11 - (char *)v12)
  {
    while (v6 != v7)
    {
      if (*((void *)*v6 + 1) != *((void *)*v12 + 1) || memcmp((char *)*v6 + 16, (char *)*v12 + 16, 0x80uLL)) {
        return 0;
      }
      v6 += 2;
      v12 += 2;
      BOOL result = 1;
    }
  }
  return result;
}

unint64_t degas::Bitmap::firstBit(degas::Bitmap *this)
{
  unint64_t v1 = -1;
  unint64_t v5 = -1;
  unint64_t v2 = (degas::Bitset **)*((void *)this + 2);
  if (v2 != *((degas::Bitset ***)this + 3))
  {
    unint64_t v3 = *v2;
    unint64_t v1 = *((void *)*v2 + 1);
    if (v1 > 0xFFFFFFFFFFFFFBFFLL || (*((unsigned char *)v3 + 16) & 1) == 0)
    {
      degas::Bitset::nextBit(v3, &v5, v1);
      return v5;
    }
  }
  return v1;
}

uint64_t degas::Bitmap::lastBit(degas::Bitmap *this)
{
  uint64_t v1 = *((void *)this + 3);
  if (*((void *)this + 2) == v1) {
    return 0;
  }
  uint64_t v2 = *(void *)(v1 - 16);
  for (uint64_t i = 35; i != 4; --i)
  {
    unsigned int v4 = *(_DWORD *)(v2 + 4 * i);
    if (v4)
    {
      uint64_t v5 = i - 4;
      return (__clz(v4) ^ 0x1F | (unint64_t)(32 * v5)) + *(void *)(v2 + 8);
    }
  }
  uint64_t v5 = 0;
  uint64_t result = 0;
  unsigned int v4 = *(_DWORD *)(v2 + 16);
  if (!v4) {
    return result;
  }
  return (__clz(v4) ^ 0x1F | (unint64_t)(32 * v5)) + *(void *)(v2 + 8);
}

uint64_t degas::Bitmap::replaceFromEncodedBuffer(degas::Bitmap *this, const unsigned __int8 **a2)
{
  uint64_t UnsignedInt = degas::_getUnsignedInt((degas *)a2, a2);
  uint64_t v7 = *((void *)this + 2);
  uint64_t v8 = *((void *)this + 3);
  for (uint64_t i = (uint64_t *)((char *)this + 16); v8 != v7; v8 -= 16)
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(v8 - 16));
    *(void *)(v8 - 8) = 0;
  }
  *((void *)this + 3) = v7;
  if (degas::getBitsetPool(void)::onceToken != -1) {
    dispatch_once(&degas::getBitsetPool(void)::onceToken, &__block_literal_global_3916);
  }
  unint64_t v9 = (os_unfair_lock_s *)degas::getBitsetPool(void)::sPool;
  if (UnsignedInt == 2)
  {
    uint64_t v16 = degas::_getUnsignedInt((degas *)a2, v4);
    if (v16)
    {
      uint64_t v18 = v16;
      *(void *)this = v16;
      unint64_t v19 = degas::_getUnsignedInt((degas *)a2, v17);
      long long v45 = 0uLL;
      degas::BitsetPool::allocBitset(v9, (degas::BitsetPtr *)&v45, v19 & 0xFFFFFFFFFFFFFC00);
      uint64_t v20 = v45;
      unint64_t v21 = v19 - *(void *)(v45 + 8);
      int v22 = 1 << v21;
      uint64_t v23 = v45 + 4 * (v21 >> 5);
      int v26 = *(_DWORD *)(v23 + 16);
      unsigned int v24 = (int *)(v23 + 16);
      int v25 = v26;
      if ((v22 & v26) == 0)
      {
        *unsigned int v24 = v22 | v25;
        int v27 = *(_DWORD *)(v20 + 4);
        if (v27 != -1) {
          *(_DWORD *)(v20 + 4) = v27 + 1;
        }
      }
      std::vector<degas::BitsetPtr>::push_back[abi:ne180100](i, &v45);
      for (uint64_t j = v18 - 1; j; --j)
      {
        v19 += degas::_getUnsignedInt((degas *)a2, v28);
        unint64_t v30 = *(void *)(v20 + 8);
        if (v30 > v19 || v30 + 1024 <= v19)
        {
          degas::BitsetPool::allocBitset(v9, (degas::BitsetPtr *)&v45, v19 & 0xFFFFFFFFFFFFFC00);
          std::vector<degas::BitsetPtr>::push_back[abi:ne180100](i, &v45);
          uint64_t v20 = v45;
          unint64_t v30 = *(void *)(v45 + 8);
        }
        unint64_t v32 = v19 - v30;
        int v33 = 1 << (v19 - v30);
        uint64_t v34 = v20 + 4 * (v32 >> 5);
        int v37 = *(_DWORD *)(v34 + 16);
        unint64_t v35 = (int *)(v34 + 16);
        int v36 = v37;
        if ((v33 & v37) == 0)
        {
          *unint64_t v35 = v33 | v36;
          int v38 = *(_DWORD *)(v20 + 4);
          if (v38 != -1) {
            *(_DWORD *)(v20 + 4) = v38 + 1;
          }
        }
      }
      degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&v45);
    }
    return 1;
  }
  if (UnsignedInt != 1) {
    return 0;
  }
  degas::_getUnsignedInt((degas *)a2, v4);
  unint64_t v11 = degas::_getUnsignedInt((degas *)a2, v10);
  unint64_t v12 = v11;
  uint64_t v13 = *((void *)this + 2);
  if (v11 > (*((void *)this + 4) - v13) >> 4)
  {
    if (v11 >> 60) {
      std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v14 = *((void *)this + 3) - v13;
    v48 = (char *)this + 32;
    *(void *)&long long v45 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<degas::Predicate>>>(v11);
    *((void *)&v45 + 1) = v45 + v14;
    uint64_t v46 = v45 + v14;
    uint64_t v47 = v45 + 16 * v15;
    std::vector<degas::BitsetPtr>::__swap_out_circular_buffer((uint64_t *)this + 2, &v45);
    std::__split_buffer<degas::BitsetPtr>::~__split_buffer((uint64_t)&v45);
    goto LABEL_27;
  }
  if (v11)
  {
LABEL_27:
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    do
    {
      long long v45 = 0uLL;
      degas::BitsetPool::allocBitset(v9, (degas::BitsetPtr *)&v45, a2);
      unsigned int v42 = *(_DWORD *)(v45 + 4);
      if (v42 == -1)
      {
        uint64_t v43 = 0;
        int32x4_t v44 = 0uLL;
        do
        {
          do
          {
            int32x4_t v44 = (int32x4_t)vpadalq_u16((uint32x4_t)v44, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v45 + 4 * v43 + 16))));
            v43 += 4;
          }
          while (v43 != 32);
          uint64_t v43 = 0;
          unsigned int v42 = vaddvq_s32(v44);
          int32x4_t v44 = 0uLL;
        }
        while (v42 == -1);
        *(_DWORD *)(v45 + 4) = v42;
      }
      std::vector<degas::BitsetPtr>::push_back[abi:ne180100]((uint64_t *)this + 2, &v45);
      v41 += v42;
      degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&v45);
      ++v40;
    }
    while (v40 != v12);
    goto LABEL_34;
  }
  uint64_t v41 = 0;
LABEL_34:
  *(void *)this = v41;
  return 1;
}

void sub_1D17B1498(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)va);
  _Unwind_Resume(a1);
}

uint64_t degas::Bitmap::useV2Encoding(degas::Bitmap *this, unint64_t *a2)
{
  unint64_t v4 = *(void *)this;
  if (*(void *)this == 0xFFFFFFFFLL)
  {
    degas::Bitmap::count(this);
    unint64_t v4 = *(void *)this;
  }
  unint64_t v5 = v4 + 2;
  if (v4)
  {
    uint64_t v7 = (degas::Bitset **)*((void *)this + 2);
    uint64_t v6 = (degas::Bitset **)*((void *)this + 3);
    unint64_t v8 = 34 * (((char *)v6 - (char *)v7) >> 4) + 3;
    if (v5 > v8) {
      return 0;
    }
    if (v4 < 0x80)
    {
      unint64_t v5 = 2;
    }
    else
    {
      uint64_t v9 = -1;
      do
      {
        unint64_t v10 = v4 >> 14;
        v4 >>= 7;
        ++v9;
      }
      while (v10);
      unint64_t v5 = v9 + 3;
    }
    if (v7 != v6)
    {
      unint64_t v11 = -1;
      do
      {
        unint64_t v26 = -1;
        unint64_t v12 = *v7;
        unint64_t v13 = *((void *)*v7 + 1);
        if (v13 <= 0xFFFFFFFFFFFFFBFFLL && (*((unsigned char *)v12 + 16) & 1) != 0)
        {
          unint64_t v26 = *((void *)*v7 + 1);
        }
        else
        {
          if (!degas::Bitset::nextBit(*v7, &v26, *((void *)*v7 + 1))) {
            goto LABEL_38;
          }
          unint64_t v13 = v26;
        }
        if (v11 == -1)
        {
          if (v13 >= 0x80)
          {
            uint64_t v18 = -1;
            unint64_t v19 = v13;
            do
            {
              unint64_t v20 = v19 >> 14;
              v19 >>= 7;
              ++v18;
            }
            while (v20);
            uint64_t v17 = v18 + 2;
            goto LABEL_27;
          }
        }
        else
        {
          unint64_t v14 = v13 - v11;
          if (v13 - v11 >= 0x80)
          {
            uint64_t v15 = -1;
            do
            {
              unint64_t v16 = v14 >> 14;
              v14 >>= 7;
              ++v15;
            }
            while (v16);
            uint64_t v17 = v15 + 2;
            goto LABEL_27;
          }
        }
        uint64_t v17 = 1;
LABEL_27:
        v5 += v17;
        while (degas::Bitset::nextBit(v12, &v26, v13))
        {
          unint64_t v11 = v26;
          unint64_t v21 = v26 - v13;
          if (v26 - v13 < 0x80)
          {
            uint64_t v24 = 1;
          }
          else
          {
            uint64_t v22 = -1;
            do
            {
              unint64_t v23 = v21 >> 14;
              v21 >>= 7;
              ++v22;
            }
            while (v23);
            uint64_t v24 = v22 + 2;
          }
          v5 += v24;
          unint64_t v13 = v26;
          if (v5 > v8) {
            goto LABEL_37;
          }
        }
        unint64_t v11 = v13;
LABEL_37:
        if (v5 > v8) {
          break;
        }
LABEL_38:
        v7 += 2;
      }
      while (v7 != v6);
    }
    if (v5 > v8) {
      return 0;
    }
  }
  *a2 = v5;
  return 1;
}

uint64_t degas::Bitmap::count(degas::Bitmap *this)
{
  uint64_t v1 = *(void *)this;
  if (*(void *)this == 0xFFFFFFFFLL)
  {
    uint64_t v2 = (uint64_t *)*((void *)this + 2);
    unint64_t v3 = (uint64_t *)*((void *)this + 3);
    if (v2 == v3)
    {
      uint64_t v1 = 0;
    }
    else
    {
      uint64_t v1 = 0;
      do
      {
        uint64_t v4 = *v2;
        unsigned int v5 = *(_DWORD *)(*v2 + 4);
        if (v5 == -1)
        {
          uint64_t v6 = 0;
          int32x4_t v7 = 0uLL;
          do
          {
            do
            {
              int32x4_t v7 = (int32x4_t)vpadalq_u16((uint32x4_t)v7, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v4 + 4 * v6 + 16))));
              v6 += 4;
            }
            while (v6 != 32);
            uint64_t v6 = 0;
            unsigned int v5 = vaddvq_s32(v7);
            int32x4_t v7 = 0uLL;
          }
          while (v5 == -1);
          *(_DWORD *)(v4 + 4) = v5;
        }
        v1 += v5;
        v2 += 2;
      }
      while (v2 != v3);
    }
    *(void *)this = v1;
  }
  return v1;
}

unint64_t degas::Bitmap::lengthOfEncodedData(degas::Bitset ***this)
{
  unint64_t v15 = 0;
  if (degas::Bitmap::useV2Encoding((degas::Bitmap *)this, &v15)) {
    return v15;
  }
  uint64_t v4 = *this;
  if ((unint64_t)*this < 0x80)
  {
    uint64_t v7 = 2;
  }
  else
  {
    uint64_t v5 = -1;
    do
    {
      unint64_t v6 = (unint64_t)v4 >> 14;
      uint64_t v4 = (degas::Bitset **)((unint64_t)v4 >> 7);
      ++v5;
    }
    while (v6);
    uint64_t v7 = v5 + 3;
  }
  uint64_t v9 = this[2];
  unint64_t v8 = this[3];
  if ((unint64_t)((char *)v8 - (char *)v9) < 0x7F1)
  {
    uint64_t v13 = 1;
  }
  else
  {
    unint64_t v10 = ((char *)v8 - (char *)v9) >> 4;
    uint64_t v11 = -1;
    do
    {
      unint64_t v12 = v10 >> 14;
      v10 >>= 7;
      ++v11;
    }
    while (v12);
    uint64_t v13 = v11 + 2;
  }
  uint64_t v2 = v13 + v7;
  while (v9 != v8)
  {
    unint64_t v14 = *v9;
    v9 += 2;
    v2 += degas::Bitset::encodedLength(v14);
  }
  return v2;
}

uint64_t degas::Bitmap::appendToEncodedBuffer(degas::Bitset ***this, unsigned __int8 **a2)
{
  uint64_t result = degas::Bitmap::useV2Encoding((degas::Bitmap *)this, &v50);
  if (result)
  {
    uint64_t v5 = (*a2)++;
    *uint64_t v5 = 2;
    unint64_t v6 = *this;
    if ((unint64_t)*this < 0x80)
    {
      unint64_t v8 = *this;
    }
    else
    {
      do
      {
        uint64_t v7 = (*a2)++;
        unsigned __int8 *v7 = v6 | 0x80;
        unint64_t v8 = (degas::Bitset **)((unint64_t)v6 >> 7);
        unint64_t v9 = (unint64_t)v6 >> 14;
        unint64_t v6 = (degas::Bitset **)((unint64_t)v6 >> 7);
      }
      while (v9);
    }
    unint64_t v19 = (*a2)++;
    unsigned __int8 *v19 = v8;
    unint64_t v20 = this[2];
    unint64_t v21 = this[3];
    if (v20 != v21)
    {
      uint64_t v22 = -1;
      while (1)
      {
        unint64_t v49 = -1;
        unint64_t v23 = *v20;
        unint64_t v24 = *((void *)*v20 + 1);
        if (v24 <= 0xFFFFFFFFFFFFFBFFLL && (*((unsigned char *)v23 + 16) & 1) != 0) {
          break;
        }
        uint64_t result = degas::Bitset::nextBit(v23, &v49, *((void *)*v20 + 1));
        if (result)
        {
          unint64_t v24 = v49;
LABEL_18:
          if (v22 == -1)
          {
            LOBYTE(v29) = v24;
            if (v24 >= 0x80)
            {
              unint64_t v30 = v24;
              do
              {
                unint64_t v31 = (*a2)++;
                *unint64_t v31 = v30 | 0x80;
                unint64_t v29 = v30 >> 7;
                unint64_t v32 = v30 >> 14;
                v30 >>= 7;
              }
              while (v32);
            }
            int v33 = (*a2)++;
            *int v33 = v29;
          }
          else
          {
            unint64_t v25 = v24 - v22;
            if (v24 - v22 < 0x80)
            {
              LOBYTE(v27) = v24 - v22;
            }
            else
            {
              do
              {
                unint64_t v26 = (*a2)++;
                *unint64_t v26 = v25 | 0x80;
                unint64_t v27 = v25 >> 7;
                unint64_t v28 = v25 >> 14;
                v25 >>= 7;
              }
              while (v28);
            }
            uint64_t v34 = (*a2)++;
            *uint64_t v34 = v27;
          }
          while (1)
          {
            uint64_t result = degas::Bitset::nextBit(*v20, &v49, v24);
            if (!result) {
              break;
            }
            unint64_t v35 = v49;
            unint64_t v36 = v49 - v24;
            if (v49 - v24 < 0x80)
            {
              LOBYTE(v38) = v49 - v24;
            }
            else
            {
              do
              {
                int v37 = (*a2)++;
                *int v37 = v36 | 0x80;
                unint64_t v38 = v36 >> 7;
                unint64_t v39 = v36 >> 14;
                v36 >>= 7;
              }
              while (v39);
            }
            uint64_t v40 = (*a2)++;
            unsigned __int8 *v40 = v38;
            unint64_t v24 = v35;
          }
          uint64_t v22 = v24;
        }
        v20 += 2;
        if (v20 == v21) {
          return result;
        }
      }
      unint64_t v49 = *((void *)*v20 + 1);
      goto LABEL_18;
    }
  }
  else
  {
    unint64_t v10 = this[2];
    uint64_t v11 = this[3];
    if (v10 == v11) {
      *this = 0;
    }
    uint64_t v12 = (char *)v11 - (char *)v10;
    unint64_t v13 = v12 >> 4;
    unint64_t v14 = (*a2)++;
    *unint64_t v14 = 1;
    unint64_t v15 = *this;
    if ((unint64_t)*this < 0x80)
    {
      uint64_t v17 = *this;
    }
    else
    {
      do
      {
        unint64_t v16 = (*a2)++;
        unsigned __int8 *v16 = v15 | 0x80;
        uint64_t v17 = (degas::Bitset **)((unint64_t)v15 >> 7);
        unint64_t v18 = (unint64_t)v15 >> 14;
        unint64_t v15 = (degas::Bitset **)((unint64_t)v15 >> 7);
      }
      while (v18);
    }
    uint64_t v41 = (*a2)++;
    unsigned __int8 *v41 = v17;
    if ((unint64_t)v12 < 0x7F1)
    {
      uint64_t v43 = v12 >> 4;
    }
    else
    {
      do
      {
        unsigned int v42 = (*a2)++;
        unsigned __int8 *v42 = v13 | 0x80;
        uint64_t v43 = v13 >> 7;
        unint64_t v44 = v13 >> 14;
        v13 >>= 7;
      }
      while (v44);
    }
    long long v45 = (*a2)++;
    unsigned __int8 *v45 = v43;
    uint64_t v47 = (uint64_t *)this[2];
    uint64_t v46 = (uint64_t *)this[3];
    while (v47 != v46)
    {
      uint64_t v48 = *v47;
      v47 += 2;
      uint64_t result = degas::Bitset::appendEncodedToBuffer(v48, a2);
    }
  }
  return result;
}

void degas::Bitmap::clearAllBits(degas::Bitmap *this)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  uint64_t v2 = *((void *)this + 2);
  for (uint64_t i = *((void *)this + 3); i != v2; i -= 16)
  {
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)(i - 16));
    *(void *)(i - 8) = 0;
  }
  *((void *)this + 3) = v2;
}

uint64_t degas::Bitmap::rangeCompare(degas::Bitmap *this, unint64_t a2, unint64_t a3)
{
  uint64_t v3 = *((void *)this + 2);
  if (a3 >= (*((void *)this + 3) - v3) >> 4) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v4 = *(void *)(*(void *)(v3 + 16 * a3) + 8);
  if (v4 + 1024 > a2) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = -1;
  }
  if (v4 > a2) {
    return 1;
  }
  else {
    return v5;
  }
}

unint64_t degas::Bitmap::findOffset(degas::Bitmap *this, unint64_t a2)
{
  uint64_t v2 = *((void *)this + 2);
  unint64_t v3 = *((void *)this + 1);
  unint64_t v4 = (*((void *)this + 3) - v2) >> 4;
  if (v3 >= v4)
  {
    unint64_t v6 = 0;
    return degas::Bitmap::findOffset(this, a2, v6, v4);
  }
  unint64_t v5 = *(void *)(*(void *)(v2 + 16 * v3) + 8);
  if (v5 > a2)
  {
    unint64_t v6 = 0;
    unint64_t v4 = *((void *)this + 1);
    return degas::Bitmap::findOffset(this, a2, v6, v4);
  }
  if (v5 + 1024 > a2) {
    int v7 = 0;
  }
  else {
    int v7 = -1;
  }
  if (v7)
  {
    unint64_t v6 = v3 + 1;
    return degas::Bitmap::findOffset(this, a2, v6, v4);
  }
  return *((void *)this + 1);
}

unint64_t degas::Bitmap::findOffset(degas::Bitmap *this, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a3 != a4)
  {
    uint64_t v4 = *((void *)this + 2);
    while (1)
    {
      unint64_t v5 = (a3 + a4) >> 1;
      if ((*((void *)this + 3) - v4) >> 4 <= v5) {
        goto LABEL_12;
      }
      unint64_t v6 = *(void *)(*(void *)(v4 + 16 * v5) + 8);
      if (v6 <= a2) {
        break;
      }
      a4 = (a3 + a4) >> 1;
LABEL_13:
      if (a3 == a4) {
        return a4;
      }
    }
    if (v6 + 1024 > a2) {
      int v7 = 0;
    }
    else {
      int v7 = -1;
    }
    if (v7 != -1)
    {
      *((void *)this + 1) = v5;
      return (a3 + a4) >> 1;
    }
LABEL_12:
    a3 = v5 + 1;
    goto LABEL_13;
  }
  return a3;
}

uint64_t degas::Bitmap::isSet(degas::Bitmap *this, unint64_t a2)
{
  unint64_t Offset = degas::Bitmap::findOffset(this, a2);
  uint64_t v5 = *((void *)this + 2);
  if (Offset < (*((void *)this + 3) - v5) >> 4
    && ((uint64_t v6 = *(void *)(v5 + 16 * Offset), v7 = *(void *)(v6 + 8), v8 = v7 + 1024, v9 = a2 >= v7, v10 = a2 - v7, v9)
      ? (BOOL v11 = v8 > a2)
      : (BOOL v11 = 0),
        v11))
  {
    return (*(_DWORD *)(v6 + 4 * (v10 >> 5) + 16) >> v10) & 1;
  }
  else
  {
    return 0;
  }
}

unint64_t degas::Bitmap::bitAtIndex(degas::Bitmap *this, unint64_t a2)
{
  uint64_t v2 = (long long *)*((void *)this + 2);
  unint64_t v3 = (long long *)*((void *)this + 3);
  if (v2 == v3) {
    return -1;
  }
  unint64_t v5 = 0;
  while (1)
  {
    long long v14 = *v2;
    uint64_t v6 = (degas::Bitset *)v14;
    unsigned int v7 = *(_DWORD *)(v14 + 4);
    ++*(_DWORD *)v14;
    if (v7 == -1)
    {
      uint64_t v8 = 0;
      int32x4_t v9 = 0uLL;
      do
      {
        do
        {
          int32x4_t v9 = (int32x4_t)vpadalq_u16((uint32x4_t)v9, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)v6 + 4 * v8 + 16))));
          v8 += 4;
        }
        while (v8 != 32);
        uint64_t v8 = 0;
        unsigned int v7 = vaddvq_s32(v9);
        int32x4_t v9 = 0uLL;
      }
      while (v7 == -1);
      *((_DWORD *)v6 + 1) = v7;
    }
    unint64_t v10 = v5 + v7;
    if (v10 > a2) {
      break;
    }
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&v14);
    ++v2;
    unint64_t v5 = v10;
    if (v2 == v3) {
      return -1;
    }
  }
  unint64_t v11 = -1;
  unint64_t v13 = -1;
  do
  {
    degas::Bitset::nextBit(v6, &v13, v11);
    unint64_t v11 = v13;
    ++v5;
  }
  while (v5 <= a2);
  degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&v14);
  return v11;
}

void degas::Bitmap::unshadowedBitSetAtIndex(degas::Bitmap *this@<X0>, unint64_t a2@<X1>, degas::BitsetPtr *a3@<X8>)
{
  uint64_t v4 = *((void *)this + 2);
  if (a2 >= (*((void *)this + 3) - v4) >> 4)
  {
    *(void *)a3 = 0;
    *((void *)a3 + 1) = 0;
    return;
  }
  unsigned int v7 = (const degas::Bitset **)(v4 + 16 * a2);
  if (*v7 && *(_DWORD *)*v7 == 1)
  {
    long long v8 = *(_OWORD *)v7;
    *(_OWORD *)a3 = *(_OWORD *)v7;
    int32x4_t v9 = (_DWORD *)v8;
LABEL_9:
    ++*v9;
    return;
  }
  *(void *)a3 = 0;
  *((void *)a3 + 1) = 0;
  if (degas::getBitsetPool(void)::onceToken != -1) {
    dispatch_once(&degas::getBitsetPool(void)::onceToken, &__block_literal_global_3916);
  }
  degas::BitsetPool::allocBitset((os_unfair_lock_s *)degas::getBitsetPool(void)::sPool, a3, *v7);
  unint64_t v10 = (degas::BitsetPtr *)(*((void *)this + 2) + 16 * a2);
  degas::BitsetPtr::releaseBitset(v10);
  long long v11 = *(_OWORD *)a3;
  *(_OWORD *)unint64_t v10 = *(_OWORD *)a3;
  int32x4_t v9 = (_DWORD *)v11;
  if ((void)v11) {
    goto LABEL_9;
  }
}

void sub_1D17B1EA8(_Unwind_Exception *a1)
{
  degas::BitsetPtr::releaseBitset(v1);
  *((void *)v1 + 1) = 0;
  _Unwind_Resume(a1);
}

uint64_t degas::Bitmap::setBit(degas::Bitmap *this, unint64_t a2)
{
  unint64_t Offset = degas::Bitmap::findOffset(this, a2);
  if (Offset == (uint64_t)(*((void *)this + 3) - *((void *)this + 2)) >> 4)
  {
    long long v26 = 0uLL;
    if (degas::getBitsetPool(void)::onceToken != -1) {
      dispatch_once(&degas::getBitsetPool(void)::onceToken, &__block_literal_global_3916);
    }
    degas::BitsetPool::allocBitset((os_unfair_lock_s *)degas::getBitsetPool(void)::sPool, (degas::BitsetPtr *)&v26, a2 & 0xFFFFFFFFFFFFFC00);
    std::vector<degas::BitsetPtr>::push_back[abi:ne180100]((uint64_t *)this + 2, &v26);
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&v26);
  }
  degas::Bitmap::unshadowedBitSetAtIndex(this, Offset, (degas::BitsetPtr *)&v26);
  uint64_t v5 = v26;
  unint64_t v6 = *(void *)(v26 + 8);
  unint64_t v7 = a2 - v6;
  if (a2 >= v6 && v6 + 1024 > a2)
  {
    int v18 = 1 << v7;
    uint64_t v19 = v26 + 4 * (v7 >> 5);
    int v22 = *(_DWORD *)(v19 + 16);
    unint64_t v20 = (int *)(v19 + 16);
    int v21 = v22;
    if ((v18 & v22) != 0)
    {
      uint64_t v17 = 0;
      goto LABEL_20;
    }
    *unint64_t v20 = v18 | v21;
    int v24 = *(_DWORD *)(v5 + 4);
    if (v24 != -1) {
      *(_DWORD *)(v5 + 4) = v24 + 1;
    }
    if (*(void *)this != 0xFFFFFFFFLL) {
      ++*(void *)this;
    }
  }
  else
  {
    v25[0] = 0;
    v25[1] = 0;
    if (degas::getBitsetPool(void)::onceToken != -1) {
      dispatch_once(&degas::getBitsetPool(void)::onceToken, &__block_literal_global_3916);
    }
    degas::BitsetPool::allocBitset((os_unfair_lock_s *)degas::getBitsetPool(void)::sPool, (degas::BitsetPtr *)v25, a2 & 0xFFFFFFFFFFFFFC00);
    uint64_t v9 = v25[0];
    unint64_t v10 = a2 - *(void *)(v25[0] + 8);
    int v11 = 1 << v10;
    uint64_t v12 = v25[0] + 4 * (v10 >> 5);
    int v15 = *(_DWORD *)(v12 + 16);
    unint64_t v13 = (int *)(v12 + 16);
    int v14 = v15;
    if ((v11 & v15) == 0)
    {
      int *v13 = v11 | v14;
      int v16 = *(_DWORD *)(v9 + 4);
      if (v16 != -1) {
        *(_DWORD *)(v9 + 4) = v16 + 1;
      }
    }
    std::vector<degas::BitsetPtr>::insert((void *)this + 2, (char *)(*((void *)this + 2) + 16 * Offset), (degas::BitsetPtr *)v25);
    if (*(void *)this != 0xFFFFFFFFLL) {
      ++*(void *)this;
    }
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)v25);
  }
  uint64_t v17 = 1;
LABEL_20:
  *((unsigned char *)this + 40) |= v17;
  degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&v26);
  return v17;
}

void sub_1D17B20BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
}

void std::vector<degas::BitsetPtr>::insert(void *a1, char *a2, degas::BitsetPtr *a3)
{
  unint64_t v3 = a3;
  unint64_t v6 = (char *)*a1;
  unint64_t v5 = a1[1];
  uint64_t v7 = (uint64_t)&a2[-*a1];
  uint64_t v8 = v7 >> 4;
  uint64_t v9 = (degas::BitsetPtr *)(*a1 + (v7 & 0xFFFFFFFFFFFFFFF0));
  int v11 = a1 + 2;
  unint64_t v10 = a1[2];
  if (v5 >= v10)
  {
    unint64_t v17 = ((uint64_t)(v5 - (void)v6) >> 4) + 1;
    if (v17 >> 60) {
      std::vector<unsigned long long>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v19 = v10 - (void)v6;
    if (v19 >> 3 > v17) {
      unint64_t v17 = v19 >> 3;
    }
    if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v20 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v20 = v17;
    }
    long long v54 = v11;
    if (v20) {
      unint64_t v20 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<degas::Predicate>>>(v20);
    }
    else {
      uint64_t v21 = 0;
    }
    unint64_t v23 = (_OWORD *)(v20 + 16 * v8);
    v51 = (char *)v20;
    *(void *)&long long v52 = v23;
    *((void *)&v52 + 1) = v23;
    uint64_t v53 = (char *)(v20 + 16 * v21);
    if (v8 == v21)
    {
      if (v7 < 1)
      {
        if (v6 == a2) {
          unint64_t v29 = 1;
        }
        else {
          unint64_t v29 = v7 >> 3;
        }
        long long v58 = v11;
        unint64_t v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<degas::Predicate>>>(v29);
        unint64_t v32 = (long long *)v52;
        uint64_t v33 = *((void *)&v52 + 1) - v52;
        if (*((void *)&v52 + 1) == (void)v52)
        {
          int64x2_t v39 = vdupq_n_s64(v52);
          unint64_t v35 = (unint64_t)&v30[16 * (v29 >> 2)];
        }
        else
        {
          uint64_t v34 = v33 >> 4;
          unint64_t v35 = (unint64_t)&v30[16 * (v29 >> 2) + (v33 & 0xFFFFFFFFFFFFFFF0)];
          uint64_t v36 = 16 * v34;
          int v37 = &v30[16 * (v29 >> 2)];
          do
          {
            long long v38 = *v32++;
            *(_OWORD *)int v37 = v38;
            v37 += 16;
            ++*(_DWORD *)v38;
            v36 -= 16;
          }
          while (v36);
          int64x2_t v39 = (int64x2_t)v52;
        }
        uint64_t v40 = v53;
        v55 = v51;
        v51 = v30;
        *(void *)&long long v52 = &v30[16 * (v29 >> 2)];
        int64x2_t v56 = v39;
        *((void *)&v52 + 1) = v35;
        uint64_t v53 = &v30[16 * v31];
        v57 = v40;
        std::__split_buffer<degas::BitsetPtr>::~__split_buffer((uint64_t)&v55);
        unint64_t v23 = (_OWORD *)*((void *)&v52 + 1);
      }
      else
      {
        unint64_t v24 = v8 + 2;
        if (v8 >= -1) {
          unint64_t v24 = v8 + 1;
        }
        v23 -= v24 >> 1;
        *(void *)&long long v52 = v23;
        *((void *)&v52 + 1) = v23;
      }
    }
    long long v41 = *(_OWORD *)v3;
    *unint64_t v23 = *(_OWORD *)v3;
    ++*(_DWORD *)v41;
    uint64_t v42 = v52;
    *((void *)&v52 + 1) += 16;
    uint64_t v43 = (degas::BitsetPtr *)*a1;
    unint64_t v44 = v9;
    while (v44 != v43)
    {
      long long v45 = *((_OWORD *)v44 - 1);
      unint64_t v44 = (degas::BitsetPtr *)((char *)v44 - 16);
      *(_OWORD *)(v42 - 16) = v45;
      v42 -= 16;
      ++*(_DWORD *)v45;
    }
    *(void *)&long long v52 = v42;
    uint64_t v46 = (degas::BitsetPtr *)a1[1];
    uint64_t v47 = (_OWORD *)*((void *)&v52 + 1);
    if (v9 != v46)
    {
      do
      {
        long long v48 = *(_OWORD *)v9;
        uint64_t v9 = (degas::BitsetPtr *)((char *)v9 + 16);
        *v47++ = v48;
        ++*(_DWORD *)v48;
      }
      while (v9 != v46);
      uint64_t v42 = v52;
      uint64_t v9 = (degas::BitsetPtr *)a1[1];
    }
    unint64_t v49 = (char *)*a1;
    *a1 = v42;
    a1[1] = v47;
    unint64_t v50 = (char *)a1[2];
    a1[2] = v53;
    *((void *)&v52 + 1) = v9;
    uint64_t v53 = v50;
    v51 = v49;
    *(void *)&long long v52 = v49;
    std::__split_buffer<degas::BitsetPtr>::~__split_buffer((uint64_t)&v51);
  }
  else if (v9 == (degas::BitsetPtr *)v5)
  {
    long long v22 = *(_OWORD *)a3;
    *(_OWORD *)uint64_t v9 = *(_OWORD *)a3;
    ++*(_DWORD *)v22;
    a1[1] = (char *)v9 + 16;
  }
  else
  {
    uint64_t v12 = (char *)v9 + 16;
    unint64_t v13 = (degas::BitsetPtr *)(v5 - 16);
    if (v5 < 0x10)
    {
      int v15 = (_OWORD *)a1[1];
    }
    else
    {
      int v14 = (long long *)(v5 - 16);
      int v15 = (_OWORD *)a1[1];
      do
      {
        long long v16 = *v14++;
        *v15++ = v16;
        ++*(_DWORD *)v16;
      }
      while ((unint64_t)v14 < v5);
    }
    a1[1] = v15;
    if ((char *)v5 != v12)
    {
      uint64_t v25 = 16 * ((uint64_t)(v5 - (void)v12) >> 4);
      uint64_t v26 = (uint64_t)&v6[16 * v8 - 16];
      do
      {
        degas::BitsetPtr::releaseBitset(v13);
        long long v27 = *(_OWORD *)(v26 + v25);
        *(_OWORD *)unint64_t v13 = v27;
        if ((void)v27) {
          ++*(_DWORD *)v27;
        }
        unint64_t v13 = (degas::BitsetPtr *)((char *)v13 - 16);
        v25 -= 16;
      }
      while (v25);
    }
    if (v9 <= v3) {
      unint64_t v3 = (degas::BitsetPtr *)((char *)v3 + 16 * (a1[1] > (unint64_t)v3));
    }
    degas::BitsetPtr::releaseBitset(v9);
    long long v28 = *(_OWORD *)v3;
    *(_OWORD *)uint64_t v9 = *(_OWORD *)v3;
    if ((void)v28) {
      ++*(_DWORD *)v28;
    }
  }
}

void sub_1D17B241C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t degas::Bitmap::clearBit(degas::BitsetPtr **this, unint64_t a2)
{
  unint64_t Offset = degas::Bitmap::findOffset((degas::Bitmap *)this, a2);
  if (Offset >= (this[3] - this[2]) >> 4)
  {
    uint64_t v9 = 0;
  }
  else
  {
    unint64_t v5 = Offset;
    degas::Bitmap::unshadowedBitSetAtIndex((degas::Bitmap *)this, Offset, (degas::BitsetPtr *)v22);
    unint64_t v6 = v22[0];
    unint64_t v7 = *((void *)v22[0] + 1);
    if (v7 <= a2 && v7 + 1024 > a2)
    {
      if (degas::Bitset::clearBit(v22[0], a2))
      {
        if (*this != (degas::BitsetPtr *)0xFFFFFFFFLL) {
          *this = (degas::BitsetPtr *)((char *)*this - 1);
        }
        uint64_t v9 = 1;
      }
      else
      {
        uint64_t v9 = 0;
      }
      int v10 = *((_DWORD *)v6 + 1);
      if (!v10) {
        goto LABEL_19;
      }
      if (v10 == -1)
      {
        uint64_t v11 = 0;
        int32x4_t v12 = 0uLL;
        do
        {
          do
          {
            int32x4_t v12 = (int32x4_t)vpadalq_u16((uint32x4_t)v12, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)v6 + 4 * v11 + 16))));
            v11 += 4;
          }
          while (v11 != 32);
          uint64_t v11 = 0;
          int v13 = vaddvq_s32(v12);
          int32x4_t v12 = 0uLL;
        }
        while (v13 == -1);
        *((_DWORD *)v6 + 1) = v13;
        if (!v13)
        {
LABEL_19:
          int v14 = this[3];
          int v15 = (degas::BitsetPtr *)((char *)this[2] + 16 * v5);
          long long v16 = (degas::BitsetPtr *)((char *)v15 + 16);
          if ((degas::BitsetPtr *)((char *)v15 + 16) != v14)
          {
            do
            {
              degas::BitsetPtr::releaseBitset(v15);
              long long v17 = *((_OWORD *)v15 + 1);
              *(_OWORD *)int v15 = v17;
              if ((void)v17) {
                ++*(_DWORD *)v17;
              }
              int v18 = (degas::BitsetPtr *)((char *)v15 + 16);
              uint64_t v19 = (degas::BitsetPtr *)((char *)v15 + 32);
              int v15 = (degas::BitsetPtr *)((char *)v15 + 16);
            }
            while (v19 != v14);
            long long v16 = this[3];
            int v15 = v18;
          }
          for (; v16 != v15; long long v16 = (degas::BitsetPtr *)((char *)v16 - 16))
          {
            degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)((char *)v16 - 16));
            *((void *)v16 - 1) = 0;
          }
          this[3] = v15;
        }
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)v22);
  }
  if (*((unsigned char *)this + 40)) {
    char v20 = 1;
  }
  else {
    char v20 = v9;
  }
  *((unsigned char *)this + 40) = v20;
  return v9;
}

void degas::Bitmap::setRange(degas::Bitmap *this, unint64_t a2, unint64_t a3)
{
  if (a2 <= a3)
  {
    unint64_t v4 = a2;
    if (degas::getBitsetPool(void)::onceToken != -1) {
      dispatch_once(&degas::getBitsetPool(void)::onceToken, &__block_literal_global_3916);
    }
    unint64_t v6 = (os_unfair_lock_s *)degas::getBitsetPool(void)::sPool;
    while (1)
    {
      unint64_t Offset = degas::Bitmap::findOffset(this, v4);
      if (Offset >= (uint64_t)(*((void *)this + 3) - *((void *)this + 2)) >> 4)
      {
        long long v19 = 0uLL;
        degas::BitsetPool::allocBitset(v6, (degas::BitsetPtr *)&v19, v4 & 0xFFFFFFFFFFFFFC00);
        uint64_t v13 = v19;
        if (*(void *)(v19 + 8) + 1023 >= a3) {
          unint64_t v14 = a3;
        }
        else {
          unint64_t v14 = *(void *)(v19 + 8) + 1023;
        }
        degas::Bitset::setRange((void *)v19, v4, v14);
        std::vector<degas::BitsetPtr>::push_back[abi:ne180100]((uint64_t *)this + 2, &v19);
        uint64_t v15 = *(void *)(v13 + 8);
      }
      else
      {
        unint64_t v8 = Offset;
        degas::Bitmap::unshadowedBitSetAtIndex(this, Offset, (degas::BitsetPtr *)&v19);
        uint64_t v9 = v19;
        unint64_t v10 = *(void *)(v19 + 8);
        if (v10 > v4 || v10 + 1024 <= v4)
        {
          if (v4 < v10)
          {
            v18[0] = 0;
            v18[1] = 0;
            degas::BitsetPool::allocBitset(v6, (degas::BitsetPtr *)v18, v4 & 0xFFFFFFFFFFFFFC00);
            if (*((void *)v18[0] + 1) + 1023 >= a3) {
              unint64_t v12 = a3;
            }
            else {
              unint64_t v12 = *((void *)v18[0] + 1) + 1023;
            }
            degas::Bitset::setRange((void *)v18[0], v4, v12);
            std::vector<degas::BitsetPtr>::insert((void *)this + 2, (char *)(*((void *)this + 2) + 16 * v8), (degas::BitsetPtr *)v18);
            unint64_t v4 = *((void *)v18[0] + 1) + 1024;
            degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)v18);
          }
          goto LABEL_24;
        }
        unint64_t v16 = v10 + 1023;
        if (v16 >= a3) {
          unint64_t v17 = a3;
        }
        else {
          unint64_t v17 = v16;
        }
        degas::Bitset::setRange((void *)v19, v4, v17);
        uint64_t v15 = *(void *)(v9 + 8);
      }
      unint64_t v4 = v15 + 1024;
LABEL_24:
      degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&v19);
      if (v4 > a3)
      {
        *(void *)this = 0xFFFFFFFFLL;
        *((unsigned char *)this + 40) = 1;
        return;
      }
    }
  }
}

void sub_1D17B2798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
}

void degas::Bitmap::clearRange(degas::BitsetPtr **this, unint64_t a2, unint64_t a3)
{
  if (a2 <= a3)
  {
    unint64_t Offset = degas::Bitmap::findOffset((degas::Bitmap *)this, a2);
    uint64_t v7 = this[3] - this[2];
    if (Offset < v7 >> 4)
    {
      unint64_t v8 = Offset;
      unint64_t v9 = degas::Bitmap::findOffset((degas::Bitmap *)this, a3, Offset, v7 >> 4);
      degas::Bitmap::unshadowedBitSetAtIndex((degas::Bitmap *)this, v8, (degas::BitsetPtr *)v51);
      BOOL v10 = v9 >= (this[3] - this[2]) >> 4;
      if (v9 < (this[3] - this[2]) >> 4) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = -1;
      }
      unint64_t v12 = v9 - v10;
      if (v8 == v9 - v10)
      {
        uint64_t v13 = v51[0];
        unint64_t v14 = *((void *)v51[0] + 1);
        if (v14 <= a2) {
          unint64_t v15 = a2;
        }
        else {
          unint64_t v15 = *((void *)v51[0] + 1);
        }
        unint64_t v16 = v14 + 1023;
        if (v16 >= a3) {
          unint64_t v17 = a3;
        }
        else {
          unint64_t v17 = v16;
        }
        if (v15 <= v17) {
          degas::Bitset::clearRange(v51[0], v15, v17);
        }
      }
      else
      {
        degas::Bitmap::unshadowedBitSetAtIndex((degas::Bitmap *)this, v12, (degas::BitsetPtr *)v50);
        int v18 = v50[0];
        unint64_t v19 = *((void *)v50[0] + 1);
        if (v19 <= a3 && v19 + 1024 > a3) {
          degas::Bitset::clearRange(v50[0], v19, a3);
        }
        int v21 = *((_DWORD *)v18 + 1);
        if (!v21) {
          goto LABEL_27;
        }
        if (v21 == -1)
        {
          uint64_t v22 = 0;
          int32x4_t v23 = 0uLL;
          do
          {
            do
            {
              int32x4_t v23 = (int32x4_t)vpadalq_u16((uint32x4_t)v23, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)v18 + 4 * v22 + 16))));
              v22 += 4;
            }
            while (v22 != 32);
            uint64_t v22 = 0;
            int v24 = vaddvq_s32(v23);
            int32x4_t v23 = 0uLL;
          }
          while (v24 == -1);
          *((_DWORD *)v18 + 1) = v24;
          if (!v24)
          {
LABEL_27:
            uint64_t v25 = this[3];
            uint64_t v26 = (degas::BitsetPtr *)((char *)this[2] + 16 * v12);
            long long v27 = (degas::BitsetPtr *)((char *)v26 + 16);
            if ((degas::BitsetPtr *)((char *)v26 + 16) != v25)
            {
              do
              {
                degas::BitsetPtr::releaseBitset(v26);
                long long v28 = *((_OWORD *)v26 + 1);
                *(_OWORD *)uint64_t v26 = v28;
                if ((void)v28) {
                  ++*(_DWORD *)v28;
                }
                unint64_t v29 = (degas::BitsetPtr *)((char *)v26 + 16);
                unint64_t v30 = (degas::BitsetPtr *)((char *)v26 + 32);
                uint64_t v26 = (degas::BitsetPtr *)((char *)v26 + 16);
              }
              while (v30 != v25);
              long long v27 = this[3];
              uint64_t v26 = v29;
            }
            for (; v27 != v26; long long v27 = (degas::BitsetPtr *)((char *)v27 - 16))
            {
              degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)((char *)v27 - 16));
              *((void *)v27 - 1) = 0;
            }
            this[3] = v26;
          }
        }
        unint64_t v31 = v12 - 1;
        if (v12 - 1 > v8)
        {
          unint64_t v32 = this[3];
          uint64_t v33 = 16 * v9 + 16 * v11 - 16;
          do
          {
            uint64_t v34 = this[2];
            unint64_t v35 = (long long *)((char *)v34 + 16 * v12);
            unint64_t v12 = v31;
            uint64_t v36 = (degas::BitsetPtr *)((char *)v34 + 16 * v31);
            if (v35 != (long long *)v32)
            {
              do
              {
                degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)((char *)v34 + v33));
                long long v37 = *v35;
                *(_OWORD *)uint64_t v36 = *v35;
                if ((void)v37) {
                  ++*(_DWORD *)v37;
                }
                ++v35;
                uint64_t v36 = (degas::BitsetPtr *)((char *)v36 + 16);
                uint64_t v34 = (degas::BitsetPtr *)((char *)v34 + 16);
              }
              while (v35 != (long long *)v32);
              uint64_t v36 = (degas::BitsetPtr *)((char *)v34 + v33);
              unint64_t v32 = this[3];
            }
            for (; v32 != v36; unint64_t v32 = (degas::BitsetPtr *)((char *)v32 - 16))
            {
              degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)((char *)v32 - 16));
              *((void *)v32 - 1) = 0;
            }
            this[3] = v36;
            unint64_t v31 = v12 - 1;
            v33 -= 16;
            unint64_t v32 = v36;
          }
          while (v12 - 1 > v8);
        }
        uint64_t v13 = v51[0];
        unint64_t v38 = *((void *)v51[0] + 1);
        if (v38 <= a2 && v38 + 1024 > a2) {
          degas::Bitset::clearRange(v51[0], a2, v38 + 1023);
        }
        degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)v50);
      }
      int v40 = *((_DWORD *)v13 + 1);
      if (!v40) {
        goto LABEL_58;
      }
      if (v40 == -1)
      {
        uint64_t v41 = 0;
        int32x4_t v42 = 0uLL;
        do
        {
          do
          {
            int32x4_t v42 = (int32x4_t)vpadalq_u16((uint32x4_t)v42, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)v13 + 4 * v41 + 16))));
            v41 += 4;
          }
          while (v41 != 32);
          uint64_t v41 = 0;
          int v43 = vaddvq_s32(v42);
          int32x4_t v42 = 0uLL;
        }
        while (v43 == -1);
        *((_DWORD *)v13 + 1) = v43;
        if (!v43)
        {
LABEL_58:
          unint64_t v44 = this[3];
          long long v45 = (degas::BitsetPtr *)((char *)this[2] + 16 * v8);
          uint64_t v46 = (degas::BitsetPtr *)((char *)v45 + 16);
          if ((degas::BitsetPtr *)((char *)v45 + 16) != v44)
          {
            do
            {
              degas::BitsetPtr::releaseBitset(v45);
              long long v47 = *((_OWORD *)v45 + 1);
              *(_OWORD *)long long v45 = v47;
              if ((void)v47) {
                ++*(_DWORD *)v47;
              }
              long long v48 = (degas::BitsetPtr *)((char *)v45 + 16);
              unint64_t v49 = (degas::BitsetPtr *)((char *)v45 + 32);
              long long v45 = (degas::BitsetPtr *)((char *)v45 + 16);
            }
            while (v49 != v44);
            uint64_t v46 = this[3];
            long long v45 = v48;
          }
          for (; v46 != v45; uint64_t v46 = (degas::BitsetPtr *)((char *)v46 - 16))
          {
            degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)((char *)v46 - 16));
            *((void *)v46 - 1) = 0;
          }
          this[3] = v45;
        }
      }
      *this = (degas::BitsetPtr *)0xFFFFFFFFLL;
      *((unsigned char *)this + 40) = 1;
      degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)v51);
    }
  }
}

void sub_1D17B2B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)va);
  _Unwind_Resume(a1);
}

uint64_t degas::Bitmap::countBitsInRange(degas::Bitmap *this, unint64_t a2, unint64_t a3)
{
  if (a2 > a3) {
    return 0;
  }
  unint64_t Offset = degas::Bitmap::findOffset(this, a2);
  uint64_t v7 = *((void *)this + 3) - *((void *)this + 2);
  if (Offset >= v7 >> 4) {
    return 0;
  }
  unint64_t v8 = Offset;
  unint64_t v9 = v7 >> 4;
  unint64_t v10 = degas::Bitmap::findOffset(this, a3, Offset, v7 >> 4);
  unint64_t v12 = v10 - (v10 >= v9);
  uint64_t v13 = *(degas::Bitset **)(*((void *)this + 2) + 16 * v8);
  unint64_t v14 = *((void *)v13 + 1);
  if (v14 <= a3 && v14 + 1024 >= a2) {
    uint64_t v16 = degas::Bitset::countBitsInRange(v13, a2, a3, *(int8x8_t *)v11.i8);
  }
  else {
    uint64_t v16 = 0;
  }
  if (v8 != v12)
  {
    unint64_t v18 = v8 + 1;
    uint64_t v19 = *((void *)this + 2);
    if (v8 + 1 < v12)
    {
      do
      {
        uint64_t v20 = *(void *)(v19 + 16 * v18);
        unint64_t v21 = *(void *)(v20 + 8);
        if (v21 <= a3 && v21 + 1024 >= a2)
        {
          unsigned int v23 = *(_DWORD *)(v20 + 4);
          if (v23 == -1)
          {
            uint64_t v24 = 0;
            int32x4_t v11 = 0uLL;
            do
            {
              do
              {
                int32x4_t v11 = (int32x4_t)vpadalq_u16((uint32x4_t)v11, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v20 + 4 * v24 + 16))));
                v24 += 4;
              }
              while (v24 != 32);
              uint64_t v24 = 0;
              unsigned int v23 = vaddvq_s32(v11);
              int32x4_t v11 = 0uLL;
            }
            while (v23 == -1);
            *(_DWORD *)(v20 + 4) = v23;
          }
          v16 += v23;
        }
        ++v18;
      }
      while (v18 != v12);
    }
    uint64_t v25 = *(degas::Bitset **)(v19 + 16 * v12);
    unint64_t v26 = *((void *)v25 + 1);
    if (v26 <= a3 && v26 + 1024 >= a2) {
      v16 += degas::Bitset::countBitsInRange(v25, a2, a3, *(int8x8_t *)v11.i8);
    }
  }
  return v16;
}

void degas::Bitmap::insertBitset(degas::Bitmap *this, uint64_t a2, const degas::Bitset *a3)
{
  if (degas::getBitsetPool(void)::onceToken != -1) {
    dispatch_once(&degas::getBitsetPool(void)::onceToken, &__block_literal_global_3916);
  }
  v6[0] = 0;
  v6[1] = 0;
  degas::BitsetPool::allocBitset((os_unfair_lock_s *)degas::getBitsetPool(void)::sPool, (degas::BitsetPtr *)v6, a3);
  std::vector<degas::BitsetPtr>::insert((void *)this + 2, (char *)(*((void *)this + 2) + 16 * a2), (degas::BitsetPtr *)v6);
  degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)v6);
}

void sub_1D17B2DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void degas::Bitmap::mergeBitset(degas::Bitmap *this, unint64_t *a2, degas::Bitset *a3, unint64_t *a4, const degas::Bitset *a5)
{
  unint64_t v7 = *((void *)a3 + 1);
  unint64_t v8 = *((void *)a5 + 1);
  if (v7 >= v8)
  {
    if (v7 > v8)
    {
      uint64_t v11 = *(void *)this;
      if (*(void *)this != 0xFFFFFFFFLL)
      {
        unsigned int v12 = *((_DWORD *)a5 + 1);
        if (v12 == -1)
        {
          uint64_t v13 = 0;
          int32x4_t v14 = 0uLL;
          do
          {
            do
            {
              int32x4_t v14 = (int32x4_t)vpadalq_u16((uint32x4_t)v14, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)a5 + 4 * v13 + 16))));
              v13 += 4;
            }
            while (v13 != 32);
            uint64_t v13 = 0;
            unsigned int v12 = vaddvq_s32(v14);
            int32x4_t v14 = 0uLL;
          }
          while (v12 == -1);
          *((_DWORD *)a5 + 1) = v12;
        }
        *(void *)this = v11 + v12;
      }
      degas::Bitmap::insertBitset(this, *a2, a5);
      ++*a2;
      ++*a4;
      *((unsigned char *)this + 40) = 1;
    }
    else
    {
      degas::Bitmap::unshadowedBitSetAtIndex(this, *a2, (degas::BitsetPtr *)v18);
      uint64_t v15 = 0;
      uint64_t v16 = v18[0];
      uint64_t v17 = v18[0] + 16;
      do
      {
        *(_DWORD *)(v17 + v15) |= *(_DWORD *)((char *)a5 + v15 + 16);
        v15 += 4;
      }
      while (v15 != 128);
      *(_DWORD *)(v16 + 4) = -1;
      ++*a2;
      ++*a4;
      *(void *)this = 0xFFFFFFFFLL;
      *((unsigned char *)this + 40) = 1;
      degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)v18);
    }
  }
  else
  {
    *a2 = degas::Bitmap::findOffset(this, v8, *a2, ((*((void *)this + 3) - *((void *)this + 2)) >> 4));
  }
}

void degas::Bitmap::appendBitset(degas::Bitmap *this, const degas::Bitset *a2)
{
  uint64_t v4 = *(void *)this;
  if (*(void *)this != 0xFFFFFFFFLL)
  {
    unsigned int v5 = *((_DWORD *)a2 + 1);
    if (v5 == -1)
    {
      uint64_t v6 = 0;
      int32x4_t v7 = 0uLL;
      do
      {
        do
        {
          int32x4_t v7 = (int32x4_t)vpadalq_u16((uint32x4_t)v7, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)a2 + 4 * v6 + 16))));
          v6 += 4;
        }
        while (v6 != 32);
        uint64_t v6 = 0;
        unsigned int v5 = vaddvq_s32(v7);
        int32x4_t v7 = 0uLL;
      }
      while (v5 == -1);
      *((_DWORD *)a2 + 1) = v5;
    }
    *(void *)this = v4 + v5;
  }
  long long v8 = 0uLL;
  if (degas::getBitsetPool(void)::onceToken != -1) {
    dispatch_once(&degas::getBitsetPool(void)::onceToken, &__block_literal_global_3916);
  }
  degas::BitsetPool::allocBitset((os_unfair_lock_s *)degas::getBitsetPool(void)::sPool, (degas::BitsetPtr *)&v8, a2);
  std::vector<degas::BitsetPtr>::push_back[abi:ne180100]((uint64_t *)this + 2, &v8);
  *((unsigned char *)this + 40) = 1;
  degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)&v8);
}

void sub_1D17B3028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t degas::Bitmap::intersectBitset(degas::BitsetPtr **this, unint64_t *a2, degas::Bitset *a3, unint64_t *a4, const degas::Bitset *a5)
{
  unint64_t v7 = *((void *)a3 + 1);
  unint64_t v8 = *((void *)a5 + 1);
  if (v7 >= v8)
  {
    if (v7 > v8)
    {
      return 1;
    }
    else
    {
      degas::Bitmap::unshadowedBitSetAtIndex((degas::Bitmap *)this, *a2, (degas::BitsetPtr *)v34);
      uint64_t v22 = 0;
      uint64_t v23 = v34[0];
      uint64_t v24 = v34[0] + 16;
      do
      {
        *(_DWORD *)(v24 + v22) &= *(_DWORD *)((char *)a5 + v22 + 16);
        v22 += 4;
      }
      while (v22 != 128);
      uint64_t v25 = 0;
      *(_DWORD *)(v23 + 4) = -1;
      *this = (degas::BitsetPtr *)0xFFFFFFFFLL;
      *((unsigned char *)this + 40) = 1;
      ++*a4;
      int32x4_t v26 = 0uLL;
      do
      {
        do
        {
          int32x4_t v26 = (int32x4_t)vpadalq_u16((uint32x4_t)v26, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(v23 + 4 * v25 + 16))));
          v25 += 4;
        }
        while (v25 != 32);
        uint64_t v25 = 0;
        int v27 = vaddvq_s32(v26);
        int32x4_t v26 = 0uLL;
      }
      while (v27 == -1);
      *(_DWORD *)(v23 + 4) = v27;
      if (v27)
      {
        ++*a2;
      }
      else
      {
        long long v28 = this[3];
        unint64_t v29 = (degas::BitsetPtr *)((char *)this[2] + 16 * *a2);
        unint64_t v30 = (degas::BitsetPtr *)((char *)v29 + 16);
        if ((degas::BitsetPtr *)((char *)v29 + 16) != v28)
        {
          do
          {
            degas::BitsetPtr::releaseBitset(v29);
            long long v31 = *((_OWORD *)v29 + 1);
            *(_OWORD *)unint64_t v29 = v31;
            if ((void)v31) {
              ++*(_DWORD *)v31;
            }
            unint64_t v32 = (degas::BitsetPtr *)((char *)v29 + 16);
            uint64_t v33 = (degas::BitsetPtr *)((char *)v29 + 32);
            unint64_t v29 = (degas::BitsetPtr *)((char *)v29 + 16);
          }
          while (v33 != v28);
          unint64_t v30 = this[3];
          unint64_t v29 = v32;
        }
        for (; v30 != v29; unint64_t v30 = (degas::BitsetPtr *)((char *)v30 - 16))
        {
          degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)((char *)v30 - 16));
          *((void *)v30 - 1) = 0;
        }
        this[3] = v29;
      }
      degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)v34);
      return 0;
    }
  }
  else
  {
    unint64_t v9 = *this;
    if (*this != (degas::BitsetPtr *)0xFFFFFFFFLL)
    {
      unsigned int v10 = *((_DWORD *)a3 + 1);
      if (v10 == -1)
      {
        uint64_t v11 = 0;
        int32x4_t v12 = 0uLL;
        do
        {
          do
          {
            int32x4_t v12 = (int32x4_t)vpadalq_u16((uint32x4_t)v12, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)a3 + 4 * v11 + 16))));
            v11 += 4;
          }
          while (v11 != 32);
          uint64_t v11 = 0;
          unsigned int v10 = vaddvq_s32(v12);
          int32x4_t v12 = 0uLL;
        }
        while (v10 == -1);
        *((_DWORD *)a3 + 1) = v10;
      }
      *this = (degas::BitsetPtr *)((char *)v9 - v10);
    }
    uint64_t v13 = this[3];
    int32x4_t v14 = (degas::BitsetPtr *)((char *)this[2] + 16 * *a2);
    uint64_t v15 = (degas::BitsetPtr *)((char *)v14 + 16);
    if ((degas::BitsetPtr *)((char *)v14 + 16) != v13)
    {
      do
      {
        degas::BitsetPtr::releaseBitset(v14);
        long long v16 = *((_OWORD *)v14 + 1);
        *(_OWORD *)int32x4_t v14 = v16;
        if ((void)v16) {
          ++*(_DWORD *)v16;
        }
        uint64_t v17 = (degas::BitsetPtr *)((char *)v14 + 16);
        unint64_t v18 = (degas::BitsetPtr *)((char *)v14 + 32);
        int32x4_t v14 = (degas::BitsetPtr *)((char *)v14 + 16);
      }
      while (v18 != v13);
      uint64_t v15 = this[3];
      int32x4_t v14 = v17;
    }
    for (; v15 != v14; uint64_t v15 = (degas::BitsetPtr *)((char *)v15 - 16))
    {
      degas::BitsetPtr::releaseBitset((degas::BitsetPtr *)((char *)v15 - 16));
      *((void *)v15 - 1) = 0;
    }
    uint64_t result = 0;
    this[3] = v14;
    *((unsigned char *)this + 40) = 1;
  }
  return result;
}

unint64_t *degas::Bitmap::getBatch(unint64_t *this, degas::Bitmap *a2, unint64_t a3)
{
  unsigned int v5 = this;
  unint64_t v18 = -1;
  uint64_t v6 = (unint64_t **)this[2];
  unint64_t v7 = this[3];
  if (v6 == (unint64_t **)v7)
  {
    unint64_t v7 = this[2];
    unint64_t v8 = -1;
  }
  else
  {
    this = *v6;
    unint64_t v8 = (*v6)[1];
    if (v8 > 0xFFFFFFFFFFFFFBFFLL || (this[2] & 1) == 0)
    {
      this = (unint64_t *)degas::Bitset::nextBit((degas::Bitset *)this, &v18, v8);
      unint64_t v8 = v18;
    }
  }
  uint64_t v15 = v5;
  unint64_t v16 = v8;
  uint64_t v17 = v6;
  if ((v6 != (unint64_t **)v7 || v8 != -1) && a3 != 0)
  {
    unint64_t v11 = 1;
    do
    {
      degas::Bitmap::setBit(a2, v8);
      this = degas::Bitmap::iterator::operator++((unint64_t *)&v15);
      unint64_t v8 = v16;
    }
    while ((v17 != (unint64_t **)v5[3] || v16 != -1 || v15 != v5) && v11++ < a3);
  }
  return this;
}

unint64_t *degas::Bitmap::iterator::operator++(unint64_t *a1)
{
  uint64_t v2 = (degas::Bitset **)a1[2];
  if (v2 != *(degas::Bitset ***)(*a1 + 24))
  {
    unint64_t v3 = a1[1];
    do
    {
      if (degas::Bitset::nextBit(*v2, a1 + 1, v3)) {
        break;
      }
      uint64_t v2 = (degas::Bitset **)(a1[2] + 16);
      unint64_t v3 = -1;
      a1[1] = -1;
      a1[2] = (unint64_t)v2;
    }
    while (v2 != *(degas::Bitset ***)(*a1 + 24));
  }
  return a1;
}

void *degas::Bitmap::begin@<X0>(void *this@<X0>, void *a2@<X8>)
{
  uint64_t v2 = this;
  unint64_t v4 = -1;
  unint64_t v6 = -1;
  uint64_t v5 = this[2];
  if (v5 != this[3])
  {
    this = *(void **)v5;
    unint64_t v4 = *(void *)(*(void *)v5 + 8);
    if (v4 > 0xFFFFFFFFFFFFFBFFLL || (this[2] & 1) == 0)
    {
      this = (void *)degas::Bitset::nextBit((degas::Bitset *)this, &v6, v4);
      unint64_t v4 = v6;
    }
  }
  *a2 = v2;
  a2[1] = v4;
  a2[2] = v5;
  return this;
}

BOOL degas::Bitmap::iterator::operator!=(void *a1, void *a2)
{
  return *a1 != *a2 || a1[1] != a2[1] || a1[2] != a2[2];
}

uint64_t degas::Bitmap::end@<X0>(uint64_t this@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(this + 24);
  *a2 = this;
  a2[1] = -1;
  a2[2] = v2;
  return this;
}

uint64_t degas::Bitmap::firstBitset(degas::Bitmap *this)
{
  uint64_t result = *((void *)this + 2);
  if (result == *((void *)this + 3))
  {
    uint64_t result = degas::emptySharedPtr(void)::s_emptySharedPtr;
    if (!degas::emptySharedPtr(void)::s_emptySharedPtr) {
      operator new();
    }
  }
  return result;
}

uint64_t degas::Bitmap::bitsetAtIndex(degas::Bitmap *this, unint64_t a2)
{
  uint64_t v2 = *((void *)this + 2);
  if (a2 < (*((void *)this + 3) - v2) >> 4) {
    return v2 + 16 * a2;
  }
  uint64_t result = degas::emptySharedPtr(void)::s_emptySharedPtr;
  if (!degas::emptySharedPtr(void)::s_emptySharedPtr) {
    operator new();
  }
  return result;
}

long long *degas::Bitmap::emptyBitmap(degas::Bitmap *this)
{
  {
    unk_1EBD275C1 = 0u;
    degas::Bitmap::emptyBitmap(void)::bitmap = 0u;
    unk_1EBD275B8 = 0u;
    __cxa_atexit((void (*)(void *))degas::Bitmap::~Bitmap, &degas::Bitmap::emptyBitmap(void)::bitmap, &dword_1D1654000);
  }
  return &degas::Bitmap::emptyBitmap(void)::bitmap;
}

void degas::Bitmap::~Bitmap(degas::Bitmap *this)
{
  uint64_t v1 = (void **)((char *)this + 16);
  std::vector<degas::BitsetPtr>::__destroy_vector::operator()[abi:ne180100](&v1);
}

uint64_t degas::Bitmap::description(degas::Bitmap *this)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"[", 1);
  unint64_t v2 = -1;
  unint64_t v15 = -1;
  unint64_t v4 = (degas::Bitset **)*((void *)this + 2);
  unint64_t v3 = (degas::Bitset **)*((void *)this + 3);
  if (v4 != v3)
  {
    uint64_t v5 = *v4;
    unint64_t v2 = *((void *)*v4 + 1);
    if (v2 > 0xFFFFFFFFFFFFFBFFLL || (*((unsigned char *)v5 + 16) & 1) == 0)
    {
      degas::Bitset::nextBit(v5, &v15, *((void *)*v4 + 1));
      unint64_t v2 = v15;
    }
  }
  unint64_t v9 = (unint64_t)this;
  unint64_t v10 = v2;
  char v6 = 1;
  unint64_t v7 = this;
  unint64_t v11 = v4;
  while (v7 != this || v2 != -1 || v4 != v3)
  {
    if ((v6 & 1) == 0) {
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)",", 1);
    }
    std::ostream::operator<<();
    degas::Bitmap::iterator::operator++(&v9);
    char v6 = 0;
    unint64_t v3 = (degas::Bitset **)*((void *)this + 3);
    unint64_t v7 = (degas::Bitmap *)v9;
    unint64_t v2 = v10;
    unint64_t v4 = v11;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"]", 1);
  std::stringbuf::str();
  v12[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v12 + *(void *)(v12[0] - 2std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(*((void **)this + 4)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v12[1] = MEMORY[0x1E4FBA470] + 16;
  if (v13 < 0) {
    operator delete((void *)v12[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1D25F9A50](&v14);
}

void sub_1D17B3858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

unint64_t *degas::Bitmap::iterator::operator++@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *a1;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 1);
  return degas::Bitmap::iterator::operator++(a1);
}

void *degas::Bitmap::iterator::iterator(void *result, uint64_t a2, uint64_t a3, void *a4)
{
  char *result = a2;
  result[1] = a3;
  result[2] = *a4;
  return result;
}

{
  char *result = a2;
  result[1] = a3;
  result[2] = *a4;
  return result;
}

void *degas::Bitmap::iterator::iterator(void *this, const degas::Bitmap *a2, uint64_t a3, uint64_t a4)
{
  *this = a2;
  this[1] = a3;
  this[2] = *((void *)a2 + 2) + 16 * a4;
  return this;
}

{
  *this = a2;
  this[1] = a3;
  this[2] = *((void *)a2 + 2) + 16 * a4;
  return this;
}

__n128 degas::Bitmap::iterator::iterator(degas::Bitmap::iterator *this, const degas::Bitmap::iterator *a2)
{
  *(void *)this = *(void *)a2;
  __n128 result = *(__n128 *)((char *)a2 + 8);
  *(__n128 *)((char *)this + 8) = result;
  return result;
}

{
  __n128 result;

  *(void *)this = *(void *)a2;
  __n128 result = *(__n128 *)((char *)a2 + 8);
  *(__n128 *)((char *)this + 8) = result;
  return result;
}

__n128 degas::Bitmap::iterator::operator=(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  __n128 result = *(__n128 *)(a2 + 8);
  *(__n128 *)(a1 + 8) = result;
  return result;
}

BOOL degas::Bitmap::iterator::operator==(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

void *degas::Bitmap::iterator::seek(void *this, unint64_t a2)
{
  uint64_t v2 = *this;
  unint64_t v3 = *(degas::Bitset ***)(*this + 16);
  this[1] = -1;
  this[2] = v3;
  if (v3 != *(degas::Bitset ***)(v2 + 24))
  {
    uint64_t v5 = this;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *v3;
      unsigned int v8 = *((_DWORD *)*v3 + 1);
      if (v8 == -1)
      {
        uint64_t v9 = 0;
        int32x4_t v10 = 0uLL;
        do
        {
          do
          {
            int32x4_t v10 = (int32x4_t)vpadalq_u16((uint32x4_t)v10, vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)((char *)v7 + 4 * v9 + 16))));
            v9 += 4;
          }
          while (v9 != 32);
          uint64_t v9 = 0;
          unsigned int v8 = vaddvq_s32(v10);
          int32x4_t v10 = 0uLL;
        }
        while (v8 == -1);
        *((_DWORD *)v7 + 1) = v8;
      }
      if (v6 + v8 > a2) {
        break;
      }
      v3 += 2;
      this[2] = v3;
      v6 += v8;
      if (v3 == *(degas::Bitset ***)(v2 + 24)) {
        return this;
      }
    }
    unint64_t v11 = -1;
    unint64_t v12 = -1;
    do
    {
      this = (void *)degas::Bitset::nextBit(v7, &v12, v11);
      unint64_t v11 = v12;
      ++v6;
    }
    while (v6 <= a2);
    v5[1] = v12;
  }
  return this;
}

void sub_1D17B4694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id nodePrintableSchema(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = NSString;
  unint64_t v6 = [v3 label];
  unint64_t v7 = [v5 stringWithFormat:@"(%@:%@:%lu)", v4, v6, objc_msgSend(v3, "domain")];

  unsigned int v8 = [MEMORY[0x1E4F28E78] stringWithFormat:@"==== Node: %@ === \n", v7];
  if ([v3 inEdgesCount])
  {
    [v8 appendString:@"inEdges:\n"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __nodePrintableSchema_block_invoke;
    unint64_t v12[3] = &unk_1E68DC958;
    id v13 = v8;
    id v14 = v4;
    [v3 enumerateInEdgesUsingBlock:v12];
  }
  if ([v3 outEdgesCount])
  {
    [v8 appendString:@"outEdges:\n"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __nodePrintableSchema_block_invoke_2;
    unint64_t v10[3] = &unk_1E68DCA20;
    id v11 = v8;
    [v3 enumerateOutEdgesUsingBlock:v10];
  }
  return v8;
}

void __nodePrintableSchema_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  edgePrintableSchema(a2, 0, 0, *(void **)(a1 + 40));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 appendFormat:@"%@\n", v3];
}

void __nodePrintableSchema_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  edgePrintableSchema(a2, @"DEFINITION_NODE", 0, 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 appendFormat:@"%@\n", v3];
}

id edgePrintableSchema(void *a1, void *a2, void *a3, void *a4)
{
  unint64_t v7 = a4;
  unsigned int v8 = a3;
  uint64_t v9 = a2;
  id v10 = a1;
  id v11 = [v10 sourceNode];
  uint64_t v12 = [v10 targetNode];
  id v13 = NSString;
  if (v8) {
    id v14 = v8;
  }
  else {
    id v14 = &stru_1F2802F38;
  }
  unint64_t v15 = [v10 label];
  unsigned int v16 = [v10 domain];

  uint64_t v17 = [v13 stringWithFormat:@"[%@:%@:%lu]", v14, v15, v16];

  unint64_t v18 = NSString;
  if (v9) {
    uint64_t v19 = v9;
  }
  else {
    uint64_t v19 = &stru_1F2802F38;
  }
  uint64_t v20 = [v11 label];
  unint64_t v21 = [v18 stringWithFormat:@"(%@:%@:%lu)", v19, v20, objc_msgSend(v11, "domain")];

  uint64_t v22 = NSString;
  if (v7) {
    uint64_t v23 = v7;
  }
  else {
    uint64_t v23 = &stru_1F2802F38;
  }
  uint64_t v24 = [v12 label];
  uint64_t v25 = [v22 stringWithFormat:@"(%@:%@:%lu)", v23, v24, objc_msgSend(v12, "domain")];

  int32x4_t v26 = [NSString stringWithFormat:@"%@->%@->%@", v21, v17, v25];

  return v26;
}

uint64_t isElementMatchingDefinition(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  int v5 = [v3 domain];
  if (v5 == [v4 domain])
  {
    unint64_t v6 = [v3 label];
    if ([v6 isEqualToString:@"*"])
    {
      uint64_t v7 = 1;
    }
    else
    {
      unsigned int v8 = [v3 label];
      uint64_t v9 = [v4 label];
      uint64_t v7 = [v8 isEqualToString:v9];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

void sub_1D17B99FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

void sub_1D17BAB84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 224), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6257(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6258(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__6469(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6470(uint64_t a1)
{
}

uint64_t degas::AttributeTable::deleteEntry(degas::AttributeTable *this, sqlite3_int64 a2)
{
  id v3 = degas::AttributeTable::deleteStatement(this);
  degas::Statement::bindInteger((sqlite3_stmt **)*v3, 1, a2);
  id v4 = (sqlite3_stmt **)*v3;
  return degas::Statement::update(v4);
}

uint64_t *degas::AttributeTable::deleteStatement(degas::AttributeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x500;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas14AttributeTable15deleteStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_6_6484;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas14AttributeTable15deleteStatementEv_block_invoke()
{
}

void sub_1D17BC988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t degas::AttributeTable::createTable(degas::AttributeTable *this)
{
  unsigned int v1 = (sqlite3 *)*((void *)this + 4);
  std::string::basic_string[abi:ne180100]<0>(__p, "create table Attribute (identifier integer primary key autoincrement, name text)");
  degas::Statement::Statement(ppStmt, v1, (uint64_t)__p);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  uint64_t v2 = degas::Statement::update(ppStmt);
  degas::Statement::~Statement((degas::Statement *)ppStmt);
  return v2;
}

void sub_1D17BCA40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
}

void degas::AttributeTable::~AttributeTable(degas::AttributeTable *this)
{
  *(void *)this = &unk_1F2801DE0;
  *((void *)this + 4) = 0;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
  JUMPOUT(0x1D25F9A90);
}

{
  *(void *)this = &unk_1F2801DE0;
  *((void *)this + 4) = 0;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

{
  *(void *)this = &unk_1F2801DE0;
  *((void *)this + 4) = 0;
  if (*((char *)this + 31) < 0) {
    operator delete(*((void **)this + 1));
  }
}

degas::AttributeTable *degas::AttributeTable::AttributeTable(degas::AttributeTable *this, sqlite3 *a2, degas::StatementCache *a3)
{
  std::string::basic_string[abi:ne180100]<0>(__p, "Attribute");
  *(void *)this = &unk_1F2801DE0;
  unint64_t v6 = (std::string *)((char *)this + 8);
  if (SHIBYTE(v10) < 0)
  {
    std::string::__init_copy_ctor_external(v6, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
    int v7 = SHIBYTE(v10);
    *((void *)this + 4) = a2;
    *((void *)this + 5) = a3;
    if (v7 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    *((void *)this + 3) = v10;
    *((void *)this + 4) = a2;
    *((void *)this + 5) = a3;
  }
  *(void *)this = &unk_1F2802E60;
  *((unsigned char *)this + 48) = 1;
  return this;
}

void sub_1D17BCC00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *degas::AttributeTable::insertStatement(degas::AttributeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x300;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas14AttributeTable15insertStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_6496;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas14AttributeTable15insertStatementEv_block_invoke()
{
}

void sub_1D17BCD8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t *degas::AttributeTable::updateStatement(degas::AttributeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x400;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas14AttributeTable15updateStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_4_6498;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas14AttributeTable15updateStatementEv_block_invoke()
{
}

void sub_1D17BCEEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t *degas::AttributeTable::readByIdentifierStatement(degas::AttributeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x600;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas14AttributeTable25readByIdentifierStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_8_6500;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas14AttributeTable25readByIdentifierStatementEv_block_invoke()
{
}

void sub_1D17BD04C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t *degas::AttributeTable::readAfterIdentifierStatement(degas::AttributeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x800;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas14AttributeTable28readAfterIdentifierStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_10_6502;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas14AttributeTable28readAfterIdentifierStatementEv_block_invoke()
{
}

void sub_1D17BD1AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t *degas::AttributeTable::readByNameStatement(degas::AttributeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x601;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas14AttributeTable19readByNameStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_12_6504;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas14AttributeTable19readByNameStatementEv_block_invoke()
{
}

void sub_1D17BD30C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t *degas::AttributeTable::readAllStatement(degas::AttributeTable *this)
{
  unsigned int v1 = (*((unsigned __int8 *)this + 48) << 16) | 0x700;
  uint64_t v2 = *((void *)this + 5);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5degas14AttributeTable16readAllStatementEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_14_6506;
  v4[4] = this;
  return degas::StatementCache::getStatement(v2, v1, (uint64_t)v4);
}

void ___ZNK5degas14AttributeTable16readAllStatementEv_block_invoke()
{
}

void sub_1D17BD46C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  MEMORY[0x1D25F9A90](v15, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t degas::AttributeTable::insert(sqlite3 **a1, sqlite3_int64 *a2, uint64_t *a3)
{
  inserted = degas::AttributeTable::insertStatement((degas::AttributeTable *)a1);
  int v7 = (sqlite3_stmt **)*inserted;
  if (*a2) {
    degas::Statement::bindInteger(v7, 1, *a2);
  }
  else {
    degas::Statement::bindNull(v7, 1);
  }
  degas::Statement::bindString(*inserted, 2, a3);
  uint64_t v8 = degas::Statement::update((sqlite3_stmt **)*inserted);
  if (v8) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = *a2 == 0;
  }
  if (v9) {
    *a2 = sqlite3_last_insert_rowid(a1[4]);
  }
  return v8;
}

uint64_t degas::AttributeTable::update(degas::AttributeTable *a1, sqlite3_int64 a2, uint64_t *a3)
{
  uint64_t updated = degas::AttributeTable::updateStatement(a1);
  degas::Statement::bindInteger((sqlite3_stmt **)*updated, 1, a2);
  degas::Statement::bindString(*updated, 2, a3);
  unint64_t v6 = (sqlite3_stmt **)*updated;
  return degas::Statement::update(v6);
}

uint64_t *degas::AttributeTable::prepareStatementToReadByIdentifier(degas::AttributeTable *this, sqlite3_int64 a2)
{
  id v3 = degas::AttributeTable::readByIdentifierStatement(this);
  degas::Statement::bindInteger((sqlite3_stmt **)*v3, 1, a2);
  return v3;
}

uint64_t *degas::AttributeTable::prepareStatementToReadAfterIdentifier(degas::AttributeTable *this, sqlite3_int64 a2)
{
  id v3 = degas::AttributeTable::readAfterIdentifierStatement(this);
  degas::Statement::bindInteger((sqlite3_stmt **)*v3, 1, a2);
  return v3;
}

uint64_t *degas::AttributeTable::prepareStatementToReadByName(degas::AttributeTable *a1, uint64_t *a2)
{
  id v3 = degas::AttributeTable::readByNameStatement(a1);
  degas::Statement::bindString(*v3, 1, a2);
  return v3;
}

degas::AttributeCursor *degas::AttributeCursor::AttributeCursor(degas::AttributeCursor *this, const degas::AttributeTable *a2)
{
  AllStatement = degas::AttributeTable::readAllStatement(a2);
  uint64_t v4 = AllStatement[1];
  *(void *)this = *AllStatement;
  *((void *)this + 1) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

{
  uint64_t *AllStatement;
  uint64_t v4;

  AllStatement = degas::AttributeTable::readAllStatement(a2);
  uint64_t v4 = AllStatement[1];
  *(void *)this = *AllStatement;
  *((void *)this + 1) = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

degas::AttributeCursor *degas::AttributeCursor::AttributeCursor(degas::AttributeCursor *this, sqlite3_int64 a2, const degas::AttributeTable *a3)
{
  char v5 = degas::AttributeTable::readByIdentifierStatement(a3);
  degas::Statement::bindInteger((sqlite3_stmt **)*v5, 1, a2);
  uint64_t v6 = v5[1];
  *(void *)this = *v5;
  *((void *)this + 1) = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

uint64_t *degas::AttributeCursor::AttributeCursor(uint64_t *a1, sqlite3_int64 a2, degas::AttributeTable *this, int a4)
{
  if (a4 == 5) {
    uint64_t v6 = degas::AttributeTable::readAfterIdentifierStatement(this);
  }
  else {
    uint64_t v6 = degas::AttributeTable::readByIdentifierStatement(this);
  }
  int v7 = v6;
  degas::Statement::bindInteger((sqlite3_stmt **)*v6, 1, a2);
  uint64_t v8 = v7[1];
  *a1 = *v7;
  a1[1] = v8;
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  return a1;
}

uint64_t *degas::AttributeCursor::AttributeCursor(uint64_t *a1, uint64_t *a2, degas::AttributeTable *this)
{
  char v5 = degas::AttributeTable::readByNameStatement(this);
  degas::Statement::bindString(*v5, 1, a2);
  uint64_t v6 = v5[1];
  *a1 = *v5;
  a1[1] = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  return a1;
}

sqlite3_int64 degas::AttributeCursor::attrId(sqlite3_stmt ***this)
{
  return sqlite3_column_int64(**this, 0);
}

void degas::AttributeCursor::name(sqlite3_stmt ***a1, uint64_t a2)
{
}

uint64_t sub_1D17BDB40()
{
  return MEMORY[0x1F4182DC8]();
}

uint64_t sub_1D17BDB50()
{
  return MEMORY[0x1F4182DD0]();
}

uint64_t sub_1D17BDB60()
{
  return MEMORY[0x1F4182DD8]();
}

uint64_t sub_1D17BDB90()
{
  return MEMORY[0x1F4183010]();
}

uint64_t sub_1D17BDBA0()
{
  return MEMORY[0x1F4183018]();
}

uint64_t sub_1D17BDBB0()
{
  return MEMORY[0x1F4183020]();
}

uint64_t sub_1D17BDBC0()
{
  return MEMORY[0x1F4183028]();
}

uint64_t sub_1D17BDC10()
{
  return MEMORY[0x1F4183050]();
}

uint64_t sub_1D17BDC20()
{
  return MEMORY[0x1F4183058]();
}

uint64_t sub_1D17BDC30()
{
  return MEMORY[0x1F4183060]();
}

uint64_t sub_1D17BDC40()
{
  return MEMORY[0x1F4183068]();
}

uint64_t sub_1D17BDC90()
{
  return MEMORY[0x1F40E2E10]();
}

uint64_t sub_1D17BDCA0()
{
  return MEMORY[0x1F40E37D0]();
}

uint64_t sub_1D17BDCB0()
{
  return MEMORY[0x1F40E37E0]();
}

uint64_t sub_1D17BDCC0()
{
  return MEMORY[0x1F40E3800]();
}

uint64_t sub_1D17BDCD0()
{
  return MEMORY[0x1F40E3818]();
}

uint64_t sub_1D17BDCE0()
{
  return MEMORY[0x1F40E3830]();
}

uint64_t sub_1D17BDCF0()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1D17BDD00()
{
  return MEMORY[0x1F40E4680]();
}

uint64_t sub_1D17BDD10()
{
  return MEMORY[0x1F40E4758]();
}

uint64_t sub_1D17BDD20()
{
  return MEMORY[0x1F40E49A0]();
}

uint64_t sub_1D17BDD30()
{
  return MEMORY[0x1F40E4AC0]();
}

uint64_t sub_1D17BDD40()
{
  return MEMORY[0x1F40E4B80]();
}

uint64_t sub_1D17BDD50()
{
  return MEMORY[0x1F40E4C80]();
}

uint64_t sub_1D17BDD60()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1D17BDD70()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1D17BDD80()
{
  return MEMORY[0x1F40E53F8]();
}

uint64_t sub_1D17BDD90()
{
  return MEMORY[0x1F40E5448]();
}

uint64_t sub_1D17BDDA0()
{
  return MEMORY[0x1F40E5BC0]();
}

uint64_t sub_1D17BDDB0()
{
  return MEMORY[0x1F4188500]();
}

uint64_t sub_1D17BDDC0()
{
  return MEMORY[0x1F4186C98]();
}

uint64_t sub_1D17BDDD0()
{
  return MEMORY[0x1F4186CB0]();
}

uint64_t sub_1D17BDDE0()
{
  return MEMORY[0x1F4186CF8]();
}

uint64_t sub_1D17BDDF0()
{
  return MEMORY[0x1F4186D60]();
}

uint64_t sub_1D17BDE00()
{
  return MEMORY[0x1F4183270]();
}

uint64_t sub_1D17BDE10()
{
  return MEMORY[0x1F4183280]();
}

uint64_t sub_1D17BDE20()
{
  return MEMORY[0x1F4187BE8]();
}

uint64_t sub_1D17BDE30()
{
  return MEMORY[0x1F40E6000]();
}

uint64_t sub_1D17BDE40()
{
  return MEMORY[0x1F40E6008]();
}

uint64_t sub_1D17BDE50()
{
  return MEMORY[0x1F40E6030]();
}

uint64_t sub_1D17BDE60()
{
  return MEMORY[0x1F4183318]();
}

uint64_t sub_1D17BDE70()
{
  return MEMORY[0x1F4183358]();
}

uint64_t sub_1D17BDE80()
{
  return MEMORY[0x1F4183398]();
}

uint64_t sub_1D17BDE90()
{
  return MEMORY[0x1F41834A8]();
}

uint64_t sub_1D17BDEA0()
{
  return MEMORY[0x1F41834F8]();
}

uint64_t sub_1D17BDEB0()
{
  return MEMORY[0x1F4183500]();
}

uint64_t sub_1D17BDEC0()
{
  return MEMORY[0x1F4183520]();
}

uint64_t sub_1D17BDED0()
{
  return MEMORY[0x1F4183528]();
}

uint64_t sub_1D17BDEE0()
{
  return MEMORY[0x1F4183530]();
}

uint64_t _sSF17KnowledgeGraphKitE23absoluteDifferenceBoundxvgZ_0()
{
  return MEMORY[0x1F4183598]();
}

uint64_t sub_1D17BDF00()
{
  return MEMORY[0x1F41835C0]();
}

uint64_t sub_1D17BDF10()
{
  return MEMORY[0x1F41835C8]();
}

uint64_t sub_1D17BDF20()
{
  return MEMORY[0x1F4183730]();
}

uint64_t sub_1D17BDF30()
{
  return MEMORY[0x1F4183738]();
}

uint64_t sub_1D17BDF40()
{
  return MEMORY[0x1F4183740]();
}

uint64_t sub_1D17BDF50()
{
  return MEMORY[0x1F4183750]();
}

uint64_t sub_1D17BDF60()
{
  return MEMORY[0x1F4183758]();
}

uint64_t sub_1D17BDF70()
{
  return MEMORY[0x1F4183760]();
}

uint64_t sub_1D17BDF80()
{
  return MEMORY[0x1F4183768]();
}

uint64_t sub_1D17BDF90()
{
  return MEMORY[0x1F41837C8]();
}

uint64_t sub_1D17BDFA0()
{
  return MEMORY[0x1F4183838]();
}

uint64_t sub_1D17BDFB0()
{
  return MEMORY[0x1F4183840]();
}

uint64_t sub_1D17BDFC0()
{
  return MEMORY[0x1F4183850]();
}

uint64_t sub_1D17BDFD0()
{
  return MEMORY[0x1F4183870]();
}

uint64_t sub_1D17BDFE0()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1D17BDFF0()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1D17BE000()
{
  return MEMORY[0x1F40E6238]();
}

uint64_t sub_1D17BE010()
{
  return MEMORY[0x1F4183898]();
}

uint64_t sub_1D17BE020()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1D17BE030()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1D17BE040()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1D17BE050()
{
  return MEMORY[0x1F4183B30]();
}

uint64_t sub_1D17BE060()
{
  return MEMORY[0x1F4183B58]();
}

uint64_t sub_1D17BE070()
{
  return MEMORY[0x1F4183BA8]();
}

uint64_t sub_1D17BE080()
{
  return MEMORY[0x1F4183BE0]();
}

uint64_t sub_1D17BE090()
{
  return MEMORY[0x1F4183BF0]();
}

uint64_t sub_1D17BE0A0()
{
  return MEMORY[0x1F4183BF8]();
}

uint64_t sub_1D17BE0B0()
{
  return MEMORY[0x1F4183C18]();
}

uint64_t sub_1D17BE0C0()
{
  return MEMORY[0x1F4183C38]();
}

uint64_t sub_1D17BE0D0()
{
  return MEMORY[0x1F4183C80]();
}

uint64_t sub_1D17BE0E0()
{
  return MEMORY[0x1F4183CC8]();
}

uint64_t sub_1D17BE0F0()
{
  return MEMORY[0x1F4183CE8]();
}

uint64_t sub_1D17BE100()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1D17BE110()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1D17BE120()
{
  return MEMORY[0x1F40E6360]();
}

uint64_t sub_1D17BE130()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1D17BE140()
{
  return MEMORY[0x1F4183E90]();
}

uint64_t sub_1D17BE150()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1D17BE160()
{
  return MEMORY[0x1F4183EA8]();
}

uint64_t sub_1D17BE170()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1D17BE180()
{
  return MEMORY[0x1F4183ED0]();
}

uint64_t sub_1D17BE190()
{
  return MEMORY[0x1F4183EE8]();
}

uint64_t sub_1D17BE1A0()
{
  return MEMORY[0x1F4183EF0]();
}

uint64_t sub_1D17BE1B0()
{
  return MEMORY[0x1F4183F00]();
}

uint64_t sub_1D17BE1C0()
{
  return MEMORY[0x1F4183F08]();
}

uint64_t sub_1D17BE1D0()
{
  return MEMORY[0x1F4183F10]();
}

uint64_t sub_1D17BE1E0()
{
  return MEMORY[0x1F4183F18]();
}

uint64_t sub_1D17BE1F0()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1D17BE200()
{
  return MEMORY[0x1F4183F40]();
}

uint64_t sub_1D17BE210()
{
  return MEMORY[0x1F4183F58]();
}

uint64_t sub_1D17BE220()
{
  return MEMORY[0x1F4183F60]();
}

uint64_t sub_1D17BE230()
{
  return MEMORY[0x1F4183F68]();
}

uint64_t sub_1D17BE240()
{
  return MEMORY[0x1F4183F70]();
}

uint64_t sub_1D17BE250()
{
  return MEMORY[0x1F4183F78]();
}

uint64_t sub_1D17BE260()
{
  return MEMORY[0x1F4183FA8]();
}

uint64_t sub_1D17BE270()
{
  return MEMORY[0x1F4183FB8]();
}

uint64_t sub_1D17BE280()
{
  return MEMORY[0x1F4183FC8]();
}

uint64_t sub_1D17BE290()
{
  return MEMORY[0x1F4183FD8]();
}

uint64_t sub_1D17BE2A0()
{
  return MEMORY[0x1F4183FE0]();
}

uint64_t sub_1D17BE2B0()
{
  return MEMORY[0x1F4183FE8]();
}

uint64_t sub_1D17BE2C0()
{
  return MEMORY[0x1F4183FF0]();
}

uint64_t sub_1D17BE2D0()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1D17BE2E0()
{
  return MEMORY[0x1F4187C18]();
}

uint64_t sub_1D17BE2F0()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1D17BE300()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1D17BE320()
{
  return MEMORY[0x1F4187DB0]();
}

uint64_t sub_1D17BE330()
{
  return MEMORY[0x1F4184048]();
}

uint64_t sub_1D17BE340()
{
  return MEMORY[0x1F40E6430]();
}

uint64_t sub_1D17BE350()
{
  return MEMORY[0x1F40E6458]();
}

uint64_t sub_1D17BE360()
{
  return MEMORY[0x1F4184138]();
}

uint64_t sub_1D17BE370()
{
  return MEMORY[0x1F4184178]();
}

uint64_t sub_1D17BE380()
{
  return MEMORY[0x1F4184188]();
}

uint64_t sub_1D17BE390()
{
  return MEMORY[0x1F41841D0]();
}

uint64_t sub_1D17BE3A0()
{
  return MEMORY[0x1F4184230]();
}

uint64_t sub_1D17BE3B0()
{
  return MEMORY[0x1F4184250]();
}

uint64_t sub_1D17BE3C0()
{
  return MEMORY[0x1F4184278]();
}

uint64_t sub_1D17BE3D0()
{
  return MEMORY[0x1F41842B0]();
}

uint64_t sub_1D17BE400()
{
  return MEMORY[0x1F41842D0]();
}

uint64_t sub_1D17BE410()
{
  return MEMORY[0x1F41842F8]();
}

uint64_t sub_1D17BE420()
{
  return MEMORY[0x1F4184338]();
}

uint64_t sub_1D17BE440()
{
  return MEMORY[0x1F4184380]();
}

uint64_t sub_1D17BE450()
{
  return MEMORY[0x1F4184390]();
}

uint64_t sub_1D17BE460()
{
  return MEMORY[0x1F4184398]();
}

uint64_t sub_1D17BE470()
{
  return MEMORY[0x1F41843A0]();
}

uint64_t sub_1D17BE480()
{
  return MEMORY[0x1F41843A8]();
}

uint64_t sub_1D17BE490()
{
  return MEMORY[0x1F41843C0]();
}

uint64_t sub_1D17BE4A0()
{
  return MEMORY[0x1F41843D0]();
}

uint64_t sub_1D17BE4B0()
{
  return MEMORY[0x1F41843D8]();
}

uint64_t sub_1D17BE4C0()
{
  return MEMORY[0x1F4184408]();
}

uint64_t sub_1D17BE4D0()
{
  return MEMORY[0x1F4184410]();
}

uint64_t sub_1D17BE4E0()
{
  return MEMORY[0x1F4184430]();
}

uint64_t sub_1D17BE4F0()
{
  return MEMORY[0x1F4184440]();
}

uint64_t sub_1D17BE500()
{
  return MEMORY[0x1F41844A0]();
}

uint64_t sub_1D17BE510()
{
  return MEMORY[0x1F41845B0]();
}

uint64_t sub_1D17BE520()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1D17BE530()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1D17BE540()
{
  return MEMORY[0x1F4186FC0]();
}

uint64_t sub_1D17BE550()
{
  return MEMORY[0x1F4186FD0]();
}

uint64_t sub_1D17BE560()
{
  return MEMORY[0x1F4186FD8]();
}

uint64_t sub_1D17BE570()
{
  return MEMORY[0x1F4187098]();
}

uint64_t sub_1D17BE580()
{
  return MEMORY[0x1F41870A0]();
}

uint64_t sub_1D17BE590()
{
  return MEMORY[0x1F41870C0]();
}

uint64_t sub_1D17BE5A0()
{
  return MEMORY[0x1F4187100]();
}

uint64_t sub_1D17BE5B0()
{
  return MEMORY[0x1F41874A8]();
}

uint64_t sub_1D17BE5C0()
{
  return MEMORY[0x1F41874C0]();
}

uint64_t sub_1D17BE5D0()
{
  return MEMORY[0x1F41874D0]();
}

uint64_t sub_1D17BE5E0()
{
  return MEMORY[0x1F41874E0]();
}

uint64_t sub_1D17BE5F0()
{
  return MEMORY[0x1F40E6928]();
}

uint64_t sub_1D17BE600()
{
  return MEMORY[0x1F4188728]();
}

uint64_t sub_1D17BE610()
{
  return MEMORY[0x1F41845E0]();
}

uint64_t sub_1D17BE620()
{
  return MEMORY[0x1F4184640]();
}

uint64_t sub_1D17BE630()
{
  return MEMORY[0x1F4184680]();
}

uint64_t sub_1D17BE640()
{
  return MEMORY[0x1F41847A0]();
}

uint64_t sub_1D17BE650()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1D17BE660()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1D17BE670()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1D17BE680()
{
  return MEMORY[0x1F4184958]();
}

uint64_t sub_1D17BE690()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1D17BE6A0()
{
  return MEMORY[0x1F41849C0]();
}

uint64_t sub_1D17BE6B0()
{
  return MEMORY[0x1F4184A40]();
}

uint64_t sub_1D17BE6D0()
{
  return MEMORY[0x1F4184B18]();
}

uint64_t sub_1D17BE6E0()
{
  return MEMORY[0x1F4184B20]();
}

uint64_t sub_1D17BE6F0()
{
  return MEMORY[0x1F4184B30]();
}

uint64_t sub_1D17BE700()
{
  return MEMORY[0x1F4184B58]();
}

uint64_t sub_1D17BE710()
{
  return MEMORY[0x1F4184B60]();
}

uint64_t sub_1D17BE720()
{
  return MEMORY[0x1F4184B68]();
}

uint64_t sub_1D17BE730()
{
  return MEMORY[0x1F4184B78]();
}

uint64_t sub_1D17BE740()
{
  return MEMORY[0x1F4184B80]();
}

uint64_t sub_1D17BE750()
{
  return MEMORY[0x1F4184B88]();
}

uint64_t sub_1D17BE760()
{
  return MEMORY[0x1F4184B90]();
}

uint64_t sub_1D17BE770()
{
  return MEMORY[0x1F4184BA8]();
}

uint64_t sub_1D17BE780()
{
  return MEMORY[0x1F4184BB0]();
}

uint64_t sub_1D17BE7A0()
{
  return MEMORY[0x1F4184BC0]();
}

uint64_t sub_1D17BE7B0()
{
  return MEMORY[0x1F4184BC8]();
}

uint64_t sub_1D17BE7C0()
{
  return MEMORY[0x1F4184BD0]();
}

uint64_t sub_1D17BE7D0()
{
  return MEMORY[0x1F4184BD8]();
}

uint64_t sub_1D17BE7E0()
{
  return MEMORY[0x1F4184C18]();
}

uint64_t sub_1D17BE7F0()
{
  return MEMORY[0x1F4184C20]();
}

uint64_t sub_1D17BE800()
{
  return MEMORY[0x1F4184C38]();
}

uint64_t sub_1D17BE810()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1D17BE820()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1D17BE830()
{
  return MEMORY[0x1F4184CA0]();
}

uint64_t sub_1D17BE840()
{
  return MEMORY[0x1F4184CA8]();
}

uint64_t sub_1D17BE850()
{
  return MEMORY[0x1F4184CE8]();
}

uint64_t sub_1D17BE860()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1D17BE870()
{
  return MEMORY[0x1F4184D18]();
}

uint64_t sub_1D17BE880()
{
  return MEMORY[0x1F4184D40]();
}

uint64_t sub_1D17BE890()
{
  return MEMORY[0x1F4184D70]();
}

uint64_t sub_1D17BE8A0()
{
  return MEMORY[0x1F4184D78]();
}

uint64_t sub_1D17BE8B0()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1D17BE8C0()
{
  return MEMORY[0x1F4184D88]();
}

uint64_t sub_1D17BE8D0()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1D17BE8E0()
{
  return MEMORY[0x1F4184EA8]();
}

uint64_t sub_1D17BE8F0()
{
  return MEMORY[0x1F4184EC8]();
}

uint64_t sub_1D17BE900()
{
  return MEMORY[0x1F4184ED8]();
}

uint64_t sub_1D17BE910()
{
  return MEMORY[0x1F4184EE8]();
}

uint64_t sub_1D17BE920()
{
  return MEMORY[0x1F4184EF0]();
}

uint64_t sub_1D17BE930()
{
  return MEMORY[0x1F4184F28]();
}

uint64_t sub_1D17BE940()
{
  return MEMORY[0x1F4184F30]();
}

uint64_t sub_1D17BE950()
{
  return MEMORY[0x1F4184F48]();
}

uint64_t sub_1D17BE960()
{
  return MEMORY[0x1F4184F68]();
}

uint64_t sub_1D17BE970()
{
  return MEMORY[0x1F4184F70]();
}

uint64_t sub_1D17BE980()
{
  return MEMORY[0x1F4184F90]();
}

uint64_t sub_1D17BE990()
{
  return MEMORY[0x1F4184FA8]();
}

uint64_t sub_1D17BE9A0()
{
  return MEMORY[0x1F4184FB0]();
}

uint64_t sub_1D17BE9B0()
{
  return MEMORY[0x1F4184FB8]();
}

uint64_t sub_1D17BE9C0()
{
  return MEMORY[0x1F4184FC0]();
}

uint64_t sub_1D17BE9D0()
{
  return MEMORY[0x1F4185048]();
}

uint64_t sub_1D17BE9E0()
{
  return MEMORY[0x1F4185050]();
}

uint64_t sub_1D17BE9F0()
{
  return MEMORY[0x1F4185068]();
}

uint64_t sub_1D17BEA00()
{
  return MEMORY[0x1F41851A0]();
}

uint64_t sub_1D17BEA10()
{
  return MEMORY[0x1F41851C8]();
}

uint64_t sub_1D17BEA20()
{
  return MEMORY[0x1F41851E0]();
}

uint64_t sub_1D17BEA30()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1D17BEA40()
{
  return MEMORY[0x1F41852A0]();
}

uint64_t sub_1D17BEA50()
{
  return MEMORY[0x1F41852C0]();
}

uint64_t sub_1D17BEA60()
{
  return MEMORY[0x1F41852C8]();
}

uint64_t sub_1D17BEA70()
{
  return MEMORY[0x1F41852D0]();
}

uint64_t sub_1D17BEA90()
{
  return MEMORY[0x1F41852E8]();
}

uint64_t sub_1D17BEAA0()
{
  return MEMORY[0x1F41852F0]();
}

uint64_t sub_1D17BEAB0()
{
  return MEMORY[0x1F41852F8]();
}

uint64_t sub_1D17BEAC0()
{
  return MEMORY[0x1F4185300]();
}

uint64_t sub_1D17BEAD0()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1D17BEAE0()
{
  return MEMORY[0x1F4185358]();
}

uint64_t sub_1D17BEAF0()
{
  return MEMORY[0x1F4185368]();
}

uint64_t sub_1D17BEB00()
{
  return MEMORY[0x1F4185370]();
}

uint64_t sub_1D17BEB10()
{
  return MEMORY[0x1F4185380]();
}

uint64_t sub_1D17BEB20()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1D17BEB30()
{
  return MEMORY[0x1F4185410]();
}

uint64_t sub_1D17BEB40()
{
  return MEMORY[0x1F41854B8]();
}

uint64_t sub_1D17BEB50()
{
  return MEMORY[0x1F4185730]();
}

uint64_t sub_1D17BEB60()
{
  return MEMORY[0x1F4185740]();
}

uint64_t sub_1D17BEB70()
{
  return MEMORY[0x1F4185758]();
}

uint64_t sub_1D17BEB80()
{
  return MEMORY[0x1F41859E8]();
}

uint64_t sub_1D17BEB90()
{
  return MEMORY[0x1F41859F0]();
}

uint64_t sub_1D17BEBA0()
{
  return MEMORY[0x1F4185A20]();
}

uint64_t sub_1D17BEBB0()
{
  return MEMORY[0x1F4185A30]();
}

uint64_t sub_1D17BEBC0()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1D17BEBD0()
{
  return MEMORY[0x1F4185B98]();
}

uint64_t sub_1D17BEBE0()
{
  return MEMORY[0x1F4185D38]();
}

uint64_t sub_1D17BEBF0()
{
  return MEMORY[0x1F4185D40]();
}

uint64_t sub_1D17BEC00()
{
  return MEMORY[0x1F4185D58]();
}

uint64_t sub_1D17BEC10()
{
  return MEMORY[0x1F4185D70]();
}

uint64_t sub_1D17BEC20()
{
  return MEMORY[0x1F4185D80]();
}

uint64_t sub_1D17BEC30()
{
  return MEMORY[0x1F4185D90]();
}

uint64_t sub_1D17BEC40()
{
  return MEMORY[0x1F4185DA0]();
}

uint64_t sub_1D17BEC50()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1D17BEC60()
{
  return MEMORY[0x1F4185DE0]();
}

uint64_t sub_1D17BEC70()
{
  return MEMORY[0x1F4185E00]();
}

uint64_t sub_1D17BEC80()
{
  return MEMORY[0x1F4185E08]();
}

uint64_t sub_1D17BEC90()
{
  return MEMORY[0x1F4185E10]();
}

uint64_t sub_1D17BECA0()
{
  return MEMORY[0x1F4185E18]();
}

uint64_t sub_1D17BECB0()
{
  return MEMORY[0x1F4185E48]();
}

uint64_t sub_1D17BECC0()
{
  return MEMORY[0x1F4185E68]();
}

uint64_t sub_1D17BECD0()
{
  return MEMORY[0x1F4185E70]();
}

uint64_t sub_1D17BECE0()
{
  return MEMORY[0x1F4185E78]();
}

uint64_t sub_1D17BECF0()
{
  return MEMORY[0x1F4185E80]();
}

uint64_t sub_1D17BED00()
{
  return MEMORY[0x1F4185E90]();
}

uint64_t sub_1D17BED10()
{
  return MEMORY[0x1F4185EA8]();
}

uint64_t sub_1D17BED20()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1D17BED30()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_1D17BED40()
{
  return MEMORY[0x1F4185ED0]();
}

uint64_t sub_1D17BED50()
{
  return MEMORY[0x1F4185ED8]();
}

uint64_t sub_1D17BED60()
{
  return MEMORY[0x1F4185EE0]();
}

uint64_t sub_1D17BED70()
{
  return MEMORY[0x1F4185EE8]();
}

uint64_t sub_1D17BED80()
{
  return MEMORY[0x1F4185EF8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1F40D7E30](number);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

void CFStringFold(CFMutableStringRef theString, CFStringCompareFlags theFlags, CFLocaleRef theLocale)
{
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x1F40E70B0](retstr, table);
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x1F40E71B0](enumerator, key, value);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1F417E3A8]();
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  unsigned int v1 = (const std::string_view::value_type *)MEMORY[0x1F417E3C0](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1F417E830]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1F417E838]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E860]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E880]();
}

{
  return MEMORY[0x1F417E898]();
}

{
  return MEMORY[0x1F417E8A0]();
}

{
  return MEMORY[0x1F417E8C8]();
}

{
  return MEMORY[0x1F417E8D0]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

std::__fs::filesystem::path *__cdecl std::__fs::filesystem::__temp_directory_path(std::__fs::filesystem::path *__return_ptr retstr, std::error_code *__ec)
{
  return (std::__fs::filesystem::path *)MEMORY[0x1F417EB88](retstr, __ec);
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1F417EE40]();
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1F40C9B60](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x1F417EF58](lpmangled, lpout, lpoutlen, lpstatus);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

{
  return MEMORY[0x1F41813D0]();
}

{
  return MEMORY[0x1F41813F0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sqlite3_db_copy()
{
  return MEMORY[0x1F4181F30]();
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x1F4186340]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void abort(void)
{
}

long double acos(long double __x)
{
  MEMORY[0x1F40CA330](__x);
  return result;
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

int atoi(const char *a1)
{
  return MEMORY[0x1F40CA4A8](a1);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1F40CA4F8](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cblas_dasum_NEWLAPACK()
{
  return MEMORY[0x1F40D1538]();
}

uint64_t cblas_daxpy_NEWLAPACK()
{
  return MEMORY[0x1F40D1548]();
}

uint64_t cblas_dcopy_NEWLAPACK()
{
  return MEMORY[0x1F40D1558]();
}

uint64_t cblas_dgemm_NEWLAPACK()
{
  return MEMORY[0x1F40D1578]();
}

uint64_t cblas_dnrm2_NEWLAPACK()
{
  return MEMORY[0x1F40D1590]();
}

uint64_t cblas_dscal_NEWLAPACK()
{
  return MEMORY[0x1F40D15B0]();
}

uint64_t cblas_scopy_NEWLAPACK()
{
  return MEMORY[0x1F40D15F0]();
}

uint64_t cblas_sgemm_NEWLAPACK()
{
  return MEMORY[0x1F40D1628]();
}

uint64_t cblas_snrm2_NEWLAPACK()
{
  return MEMORY[0x1F40D1670]();
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

uint64_t dgeev_NEWLAPACK()
{
  return MEMORY[0x1F40D16C8]();
}

uint64_t dgesdd_NEWLAPACK()
{
  return MEMORY[0x1F40D1708]();
}

uint64_t dgetrf_NEWLAPACK()
{
  return MEMORY[0x1F40D1738]();
}

uint64_t dgetri_NEWLAPACK()
{
  return MEMORY[0x1F40D1748]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA0](attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1F40CBC70]();
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1F40CBDA0](a1, a2);
}

long double erfc(long double __x)
{
  MEMORY[0x1F40CBF58](__x);
  return result;
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

int flock(int a1, int a2)
{
  return MEMORY[0x1F40CC160](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

int fsync(int a1)
{
  return MEMORY[0x1F40CC2D8](*(void *)&a1);
}

kern_return_t host_info(host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1F40CC608](*(void *)&host, *(void *)&flavor, host_info_out, host_info_outCnt);
}

kern_return_t host_statistics(host_t host_priv, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1F40CC620](*(void *)&host_priv, *(void *)&flavor, host_info_out, host_info_outCnt);
}

long double log(long double __x)
{
  MEMORY[0x1F40CC878](__x);
  return result;
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

float logf(float a1)
{
  MEMORY[0x1F40CC8C0](a1);
  return result;
}

void mach_error(const char *str, mach_error_t error_value)
{
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1F40CC950]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1F40CCB10](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x1F40CD828](a1, a2);
  return result;
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

sparse_status sparse_commit(void *A)
{
  return MEMORY[0x1F40D1820](A);
}

sparse_status sparse_extract_sparse_column_double(sparse_matrix_double A, sparse_index column, sparse_index row_start, sparse_index *row_end, sparse_dimension nz, double *val, sparse_index *indx)
{
  return MEMORY[0x1F40D1828](A, column, row_start, row_end, nz, val, indx);
}

sparse_status sparse_extract_sparse_row_double(sparse_matrix_double A, sparse_index row, sparse_index column_start, sparse_index *column_end, sparse_dimension nz, double *val, sparse_index *jndx)
{
  return MEMORY[0x1F40D1830](A, row, column_start, column_end, nz, val, jndx);
}

sparse_status sparse_extract_sparse_row_float(sparse_matrix_float A, sparse_index row, sparse_index column_start, sparse_index *column_end, sparse_dimension nz, float *val, sparse_index *jndx)
{
  return MEMORY[0x1F40D1838](A, row, column_start, column_end, nz, val, jndx);
}

uint64_t sparse_get_matrix_nonzero_count(void *A)
{
  return MEMORY[0x1F40D1840](A);
}

uint64_t sparse_get_matrix_nonzero_count_for_column(void *A, sparse_index j)
{
  return MEMORY[0x1F40D1848](A, j);
}

uint64_t sparse_get_matrix_nonzero_count_for_row(void *A, sparse_index i)
{
  return MEMORY[0x1F40D1850](A, i);
}

double sparse_inner_product_sparse_double(sparse_dimension nzx, sparse_dimension nzy, const double *x, const sparse_index *indx, const double *y, const sparse_index *indy)
{
  MEMORY[0x1F40D1868](nzx, nzy, x, indx, y, indy);
  return result;
}

float sparse_inner_product_sparse_float(sparse_dimension nzx, sparse_dimension nzy, const float *x, const sparse_index *indx, const float *y, const sparse_index *indy)
{
  MEMORY[0x1F40D1870](nzx, nzy, x, indx, y, indy);
  return result;
}

sparse_status sparse_insert_col_double(sparse_matrix_double A, sparse_index j, sparse_dimension nz, const double *val, const sparse_index *indx)
{
  return MEMORY[0x1F40D1878](A, j, nz, val, indx);
}

sparse_status sparse_insert_entry_double(sparse_matrix_double A, double val, sparse_index i, sparse_index j)
{
  return MEMORY[0x1F40D1888](A, i, j, val);
}

sparse_status sparse_insert_entry_float(sparse_matrix_float A, float val, sparse_index i, sparse_index j)
{
  return MEMORY[0x1F40D1890](A, i, j, val);
}

sparse_status sparse_insert_row_double(sparse_matrix_double A, sparse_index i, sparse_dimension nz, const double *val, const sparse_index *jndx)
{
  return MEMORY[0x1F40D1898](A, i, nz, val, jndx);
}

sparse_status sparse_insert_row_float(sparse_matrix_float A, sparse_index i, sparse_dimension nz, const float *val, const sparse_index *jndx)
{
  return MEMORY[0x1F40D18A0](A, i, nz, val, jndx);
}

sparse_matrix_double sparse_matrix_create_double(sparse_dimension M, sparse_dimension N)
{
  return (sparse_matrix_double)MEMORY[0x1F40D18A8](M, N);
}

sparse_matrix_float sparse_matrix_create_float(sparse_dimension M, sparse_dimension N)
{
  return (sparse_matrix_float)MEMORY[0x1F40D18B0](M, N);
}

sparse_status sparse_matrix_destroy(void *A)
{
  return MEMORY[0x1F40D18B8](A);
}

sparse_status sparse_matrix_product_dense_float(CBLAS_ORDER order, CBLAS_TRANSPOSE transa, sparse_dimension n, float alpha, sparse_matrix_float A, const float *B, sparse_dimension ldb, float *C, sparse_dimension ldc)
{
  return MEMORY[0x1F40D18C0](*(void *)&order, *(void *)&transa, n, A, B, ldb, C, ldc, alpha);
}

uint64_t sparse_pack_vector_float(sparse_dimension N, sparse_dimension nz, const float *x, sparse_stride incx, float *y, sparse_index *indy)
{
  return MEMORY[0x1F40D18D8](N, nz, x, incx, y, indy);
}

sparse_status sparse_set_matrix_property(void *A, sparse_matrix_property pname)
{
  return MEMORY[0x1F40D18E0](A, *(void *)&pname);
}

void sparse_unpack_vector_double(sparse_dimension N, sparse_dimension nz, BOOL zero, const double *x, const sparse_index *indx, double *y, sparse_stride incy)
{
}

void sparse_unpack_vector_float(sparse_dimension N, sparse_dimension nz, BOOL zero, const float *x, const sparse_index *indx, float *y, sparse_stride incy)
{
}

void *__cdecl sqlite3_aggregate_context(sqlite3_context *a1, int nBytes)
{
  return (void *)MEMORY[0x1F4181F60](a1, *(void *)&nBytes);
}

int sqlite3_backup_finish(sqlite3_backup *p)
{
  return MEMORY[0x1F4181F68](p);
}

sqlite3_backup *__cdecl sqlite3_backup_init(sqlite3 *pDest, const char *zDestName, sqlite3 *pSource, const char *zSourceName)
{
  return (sqlite3_backup *)MEMORY[0x1F4181F70](pDest, zDestName, pSource, zSourceName);
}

int sqlite3_backup_step(sqlite3_backup *p, int nPage)
{
  return MEMORY[0x1F4181F88](p, *(void *)&nPage);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F90](a1, *(void *)&a2, a3, *(void *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1F4181FA8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1F4181FB8](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1F4181FC0](a1, *(void *)&a2);
}

int sqlite3_bind_pointer(sqlite3_stmt *a1, int a2, void *a3, const char *a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE0](a1, *(void *)&a2, a3, a4, a5);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_busy_handler(sqlite3 *a1, int (__cdecl *a2)(void *, int), void *a3)
{
  return MEMORY[0x1F4182040](a1, a2, a3);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F4182088](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x1F4182098](a1, *(void *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A8](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820D8](a1, *(void *)&iCol);
}

int sqlite3_create_collation(sqlite3 *a1, const char *zName, int eTextRep, void *pArg, int (__cdecl *xCompare)(void *, int, const void *, int, const void *))
{
  return MEMORY[0x1F4182108](a1, zName, *(void *)&eTextRep, pArg, xCompare);
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return MEMORY[0x1F4182118](db, zFunctionName, *(void *)&nArg, *(void *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_create_module(sqlite3 *db, const char *zName, const sqlite3_module *p, void *pClientData)
{
  return MEMORY[0x1F4182128](db, zName, p, pClientData);
}

int sqlite3_db_release_memory(sqlite3 *a1)
{
  return MEMORY[0x1F4182170](a1);
}

int sqlite3_db_status(sqlite3 *a1, int op, int *pCur, int *pHiwtr, int resetFlg)
{
  return MEMORY[0x1F4182178](a1, *(void *)&op, pCur, pHiwtr, *(void *)&resetFlg);
}

int sqlite3_declare_vtab(sqlite3 *a1, const char *zSQL)
{
  return MEMORY[0x1F4182180](a1, zSQL);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return (char *)MEMORY[0x1F41821B8](pStmt);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x1F41821C8](a1, *(void *)&onoff);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1F41821D0](a1, zDbName, *(void *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

void sqlite3_free(void *a1)
{
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1F4182230](a1);
}

void *__cdecl sqlite3_malloc(int a1)
{
  return (void *)MEMORY[0x1F4182248](*(void *)&a1);
}

void *__cdecl sqlite3_malloc64(sqlite3_uint64 a1)
{
  return (void *)MEMORY[0x1F4182250](a1);
}

char *sqlite3_mprintf(const char *a1, ...)
{
  return (char *)MEMORY[0x1F4182258](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41822C0](pStmt);
}

void sqlite3_result_blob(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
}

void sqlite3_result_double(sqlite3_context *a1, double a2)
{
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
}

void sqlite3_result_pointer(sqlite3_context *a1, void *a2, const char *a3, void (__cdecl *a4)(void *))
{
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int sqlite3_stricmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F41823D0](a1, a2);
}

int sqlite3_table_column_metadata(sqlite3 *db, const char *zDbName, const char *zTableName, const char *zColumnName, const char **pzDataType, const char **pzCollSeq, int *pNotNull, int *pPrimaryKey, int *pAutoinc)
{
  return MEMORY[0x1F41823E0](db, zDbName, zTableName, zColumnName, pzDataType, pzCollSeq, pNotNull, pPrimaryKey);
}

int sqlite3_trace_v2(sqlite3 *a1, unsigned int uMask, int (__cdecl *xCallback)(unsigned int, void *, void *, void *), void *pCtx)
{
  return MEMORY[0x1F41823F8](a1, *(void *)&uMask, xCallback, pCtx);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x1F4182410](a1);
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x1F4182448](a1);
}

void *__cdecl sqlite3_value_pointer(sqlite3_value *a1, const char *a2)
{
  return (void *)MEMORY[0x1F4182450](a1, a2);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x1F4182458](a1);
}

int sqlite3_wal_autocheckpoint(sqlite3 *db, int N)
{
  return MEMORY[0x1F4182488](db, *(void *)&N);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x1F4182490](db, zDb, *(void *)&eMode, pnLog, pnCkpt);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1F41863D0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1F41863E0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1F41863F0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1F4186420]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1F4186428]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1F4186460]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1F4186478]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1F41864A0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1F4188218]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1F4188220]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1F41864C0]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1F41864E0]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1F41864E8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1F4186538]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1F4186540]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1F41865A8]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1F41865E0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1F41865E8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1F4186628]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1F4186650]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1F4186670]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1F4186688]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1F41866B8]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1F41866C8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1F41866F8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1F41867A8]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1F41867B0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1F41867D8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1F41867E8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1F41867F8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1F4186898]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40CE470](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
}

void vDSP_dotprD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Length __N)
{
}

void vDSP_maxviD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length *__I, vDSP_Length __N)
{
}

void vDSP_meanvD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
}

void vDSP_minviD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length *__I, vDSP_Length __N)
{
}

void vDSP_mtransD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N)
{
}

void vDSP_normalize(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, float *__Mean, float *__StandardDeviation, vDSP_Length __N)
{
}

void vDSP_normalizeD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, double *__Mean, double *__StandardDeviation, vDSP_Length __N)
{
}

void vDSP_svdivD(const double *__A, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_sveD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vdivD(const double *__B, vDSP_Stride __IB, const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vmulD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vnegD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsaddD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsdiv(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsdivD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsmsbD(const double *__A, vDSP_Stride __IA, const double *__B, const double *__C, vDSP_Stride __IC, double *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsmulD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsqD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vvfabs(double *a1, const double *a2, const int *a3)
{
}

void vvnint(double *a1, const double *a2, const int *a3)
{
}

void vvpows(double *a1, const double *a2, const double *a3, const int *a4)
{
}

void vvpowsf(float *a1, const float *a2, const float *a3, const int *a4)
{
}

void vvsqrt(double *a1, const double *a2, const int *a3)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}