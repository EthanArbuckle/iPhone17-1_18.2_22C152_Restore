char *sub_1000035EC(unint64_t a1)
{
  uint64_t v2;
  void *v3;
  char *result;
  uint64_t i;
  unint64_t v6;
  unint64_t v7;
  id *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _OWORD v12[2];
  void *v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_100003C20();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (char *)v3;
  }
  v13 = &_swiftEmptyArrayStorage;
  result = sub_100003A54(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        sub_100003C10();
        sub_100003A74();
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100003A54(0, v3[2] + 1, 1);
          v3 = v13;
        }
        v7 = v3[2];
        v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_100003A54((char *)(v6 > 1), v7 + 1, 1);
          v3 = v13;
        }
        v3[2] = v7 + 1;
        sub_100003AB4(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      v8 = (id *)(a1 + 32);
      sub_100003A74();
      do
      {
        v9 = *v8;
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100003A54(0, v3[2] + 1, 1);
          v3 = v13;
        }
        v11 = v3[2];
        v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_100003A54((char *)(v10 > 1), v11 + 1, 1);
          v3 = v13;
        }
        v3[2] = v11 + 1;
        sub_100003AB4(v12, &v3[4 * v11 + 4]);
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

id sub_1000039B8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ImageGenerationUIDiagnosticExtension();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ImageGenerationUIDiagnosticExtension()
{
  return self;
}

uint64_t sub_100003A10(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

char *sub_100003A54(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100003AC4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

unint64_t sub_100003A74()
{
  unint64_t result = qword_100008148;
  if (!qword_100008148)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100008148);
  }
  return result;
}

_OWORD *sub_100003AB4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

char *sub_100003AC4(char *result, int64_t a2, char a3, char *a4)
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
    sub_100003A10(&qword_100008150);
    v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
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

uint64_t sub_100003BD0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_100003BE0()
{
  return String._bridgeToObjectiveC()();
}

NSArray sub_100003BF0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100003C00()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100003C10()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100003C20()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}