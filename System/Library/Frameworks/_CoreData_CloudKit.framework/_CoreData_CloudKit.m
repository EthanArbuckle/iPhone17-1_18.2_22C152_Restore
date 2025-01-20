id sub_234DE1D24()
{
  void *v0;

  return objc_msgSend(v0, sel_databaseScope);
}

id sub_234DE1D34@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_databaseScope);
  *a2 = result;
  return result;
}

id sub_234DE1D68(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDatabaseScope_, *a1);
}

id sub_234DE1D7C(uint64_t a1)
{
  return objc_msgSend(v1, sel_setDatabaseScope_, a1);
}

void *(*sub_234DE1D90(uint64_t a1))(void *result, char a2)
{
  *(void *)(a1 + 16) = v1;
  *(void *)a1 = objc_msgSend(v1, sel_databaseScope);
  *(unsigned char *)(a1 + 8) = 0;
  return sub_234DE1DE8;
}

void *sub_234DE1DE8(void *result, char a2)
{
  char v2 = *((unsigned char *)result + 8);
  if (a2)
  {
    if ((result[1] & 1) == 0) {
      return objc_msgSend((id)result[2], sel_setDatabaseScope_, *result);
    }
    __break(1u);
  }
  if ((v2 & 1) == 0) {
    return objc_msgSend((id)result[2], sel_setDatabaseScope_, *result);
  }
  __break(1u);
  return result;
}

id NSPersistentCloudKitContainerOptions.databaseScope.getter()
{
  return objc_msgSend(v0, sel_databaseScope);
}

id NSPersistentCloudKitContainerOptions.databaseScope.setter(uint64_t a1)
{
  return objc_msgSend(v1, sel_setDatabaseScope_, a1);
}

void (*NSPersistentCloudKitContainerOptions.databaseScope.modify(void *a1))(void *a1)
{
  char v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_234DE1D90((uint64_t)v2);
  return sub_234DE1E94;
}

void sub_234DE1E94(void *a1)
{
  v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32))(*a1, 0);

  free(v1);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}