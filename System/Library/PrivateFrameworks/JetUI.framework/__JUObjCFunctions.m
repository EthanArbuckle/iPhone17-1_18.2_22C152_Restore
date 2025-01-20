@interface __JUObjCFunctions
+ (id)makeContentUnavailableViewControllerWithError:(id)a3 retryAction:(id)a4;
+ (id)makeLoadingViewControllerWithLabel:(id)a3;
+ (id)placeableForButton:(id)a3;
+ (id)placeableForImageView:(id)a3;
+ (id)placeableForLabel:(id)a3;
+ (id)traitCollectionForView:(id)a3;
- (__JUObjCFunctions)init;
@end

@implementation __JUObjCFunctions

+ (id)placeableForButton:(id)a3
{
  return sub_1B07CDCE8((uint64_t)a1, (uint64_t)a2, a3, &qword_1E9B3ABE0, 0x1E4FB14D0, (uint64_t)&protocol witness table for UIButton);
}

+ (id)placeableForImageView:(id)a3
{
  return sub_1B07CDCE8((uint64_t)a1, (uint64_t)a2, a3, &qword_1E9B3ABE8, 0x1E4FB1838, (uint64_t)&protocol witness table for UIImageView);
}

+ (id)placeableForLabel:(id)a3
{
  return sub_1B07CDCE8((uint64_t)a1, (uint64_t)a2, a3, (unint64_t *)&unk_1E9B3ABF0, 0x1E4FB1930, (uint64_t)&protocol witness table for UILabel);
}

- (__JUObjCFunctions)init
{
  result = (__JUObjCFunctions *)sub_1B086A6C8();
  __break(1u);
  return result;
}

+ (id)makeLoadingViewControllerWithLabel:(id)a3
{
  uint64_t v4 = type metadata accessor for JULoadingViewController.PresentationContext(0);
  MEMORY[0x1F4188790](v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    uint64_t v7 = sub_1B0869D98();
    a3 = v8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v9 = qword_1EB595EB0;
  swift_bridgeObjectRetain();
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v10 = __swift_project_value_buffer(v4, (uint64_t)qword_1EB595F30);
  sub_1B07B573C(v10, (uint64_t)v6);
  v11 = (objc_class *)type metadata accessor for JULoadingViewController(0);
  v12 = (char *)objc_allocWithZone(v11);
  v13 = (uint64_t *)&v12[OBJC_IVAR____TtC5JetUI23JULoadingViewController_label];
  uint64_t *v13 = v7;
  v13[1] = (uint64_t)a3;
  sub_1B07B573C((uint64_t)v6, (uint64_t)&v12[OBJC_IVAR____TtC5JetUI23JULoadingViewController_presentationContext]);
  *(void *)&v12[OBJC_IVAR____TtC5JetUI23JULoadingViewController_pageRenderMetrics] = 0;
  v16.receiver = v12;
  v16.super_class = v11;
  id v14 = objc_msgSendSuper2(&v16, sel_initWithNibName_bundle_, 0, 0);
  sub_1B07B57A0((uint64_t)v6);
  swift_bridgeObjectRelease();

  return v14;
}

+ (id)traitCollectionForView:(id)a3
{
  id v3 = objc_msgSend(a3, sel_traitCollection);

  return v3;
}

+ (id)makeContentUnavailableViewControllerWithError:(id)a3 retryAction:(id)a4
{
  uint64_t v6 = type metadata accessor for JUContentUnavailableViewController.PresentationContext(0);
  MEMORY[0x1F4188790](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _Block_copy(a4);
  if (v9)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    uint64_t v9 = sub_1B0841C9C;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = a3;
  sub_1B07E8728((uint64_t)v9);
  if (qword_1E9B3A5E0 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v6, (uint64_t)qword_1E9B3A568);
  sub_1B0840000(v12, (uint64_t)v8);
  v13 = (objc_class *)type metadata accessor for JUContentUnavailableViewController(0);
  id v14 = (char *)objc_allocWithZone(v13);
  *(void *)&v14[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_error] = v11;
  sub_1B0840000((uint64_t)v8, (uint64_t)&v14[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_presentationContext]);
  v15 = &v14[OBJC_IVAR____TtC5JetUI34JUContentUnavailableViewController_retry];
  *(void *)v15 = v9;
  *((void *)v15 + 1) = v10;
  v18.receiver = v14;
  v18.super_class = v13;
  id v16 = objc_msgSendSuper2(&v18, sel_initWithNibName_bundle_, 0, 0);
  sub_1B0840328((uint64_t)v8);
  sub_1B07BDB64((uint64_t)v9);

  return v16;
}

@end